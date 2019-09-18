import json
import logging
import os
import socket
import struct
from enum import Enum
from re import search
from socket import AF_UNIX, socket
from time import time
from uuid import uuid4

import pynvim # pylint: disable=E0401

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

if os.environ.get('DISCORD_DEBUG'):
    fh = logging.FileHandler('debug.log')
    formatter = logging.Formatter('%(message)s')
    fh.setFormatter(formatter)
    logger.addHandler(fh)

class RPCClient:
    class Opcodes(Enum):
        HANDSHAKE = 0
        FRAME = 1
        CLOSE = 2

    def __init__(self):
        self.socket = None
        self.connected = False

    def connect(self):
        try:
            self.socket = socket(AF_UNIX)
            self.socket.connect(os.path.join(os.environ['TMPDIR'], 'discord-ipc-0'))
            self.handshake()
            self.connected = True
        except OSError:
            pass

    def handshake(self):
        self.send({
            'client_id': os.environ['DISCORD_CLIENT_ID'],
            'v': 1,
        }, self.Opcodes.HANDSHAKE)

        op, data = self.recv(8)

        if op == self.Opcodes.FRAME.value and data['evt'] == 'READY':
            return
        else:
            if op == self.Opcodes.CLOSE.value:
                self.close()

            raise RuntimeError(data)

    def close(self):
        self.send({}, self.Opcodes.CLOSE)
        self.socket.close()

    def send(self, data, opcode):
        opcode_value = opcode.value
        payload = json.dumps(data).encode('utf-8')
        header = struct.pack('<II', opcode_value, len(payload))

        logger.debug(f'SENDING op: {opcode_value}, payload: {payload}')

        try:
            self.socket.sendall(header)
            self.socket.sendall(payload)
        except:
            self.connect()

            if self.connected: self.send(data, opcode)

    def recv(self, size):
        op, length = struct.unpack('<II', self.get_from_buffer(size))
        payload = json.loads(self.get_from_buffer(length).decode('utf-8'))

        logger.debug(f'RECEIVING op: {op}, payload: {payload}')

        return op, payload

    def get_from_buffer(self, size):
        content = b''

        while size:
            chunk = self.socket.recv(size)
            content += chunk
            size -= len(chunk)

        return content

    def set_activity(self, details=None, state=None, assets={}):
        activity = {
            'assets': assets,
            'timestamps': { 'start': int(time()) }
        }

        if details: activity['details'] = details
        if state: activity['state'] = state

        self.send({
            'cmd': 'SET_ACTIVITY',
            'args': { 'pid': os.getpid(), 'activity': activity },
            'nonce': str(uuid4())
        }, self.Opcodes.FRAME)

@pynvim.plugin
class DiscordPlugin:
    FT_OVERRIDES = {
        'dockerfile': 'docker',
        'gitcommit': 'git',
        'javascriptreact': 'react',
    }

    FT_REGEX = {
        r'Procfile': 'heroku',
        r'\.s(c|a)ss': 'sass',
        r'_spec\.rb$': 'rspec',
        r'docker-compose\.yml': 'docker',
    }

    def __init__(self, nvim):
        self.client = RPCClient()
        self.nvim = nvim

    def update(self):
        if not self.client.connected: return

        current_buffer = self.nvim.current.buffer
        filename = os.path.basename(current_buffer.name)
        filetype = current_buffer.options['filetype']
        ft_info = self.FT_OVERRIDES.get(filetype)

        for regex, ft in self.FT_REGEX.items():
            if search(regex, filename):
                ft_info = ft
                break

        ft_info = ft_info or self.FT_OVERRIDES.get(filetype) or filetype

        if not ft_info:
            self.client.set_activity(
                details='Idling',
                state='Idling',
                assets={
                    'large_image': 'neovim-logo',
                    'large_text': 'Idling',
                },
            )
        else:
            self.client.set_activity(
                details=f'Editing {filename}',
                assets={
                    'large_image': ft_info or 'neovim-logo',
                    'large_text': f'Editing a {ft_info.upper()} file',
                    'small_image': 'neovim-small',
                    'small_text': 'Neovim'
                },
            )

    @pynvim.autocmd('VimEnter')
    def on_vim_enter(self):
        self.client.connect()
        self.update()

    @pynvim.autocmd('VimLeave')
    def on_vim_leave(self):
        self.client.connected: self.client.socket.close()

    @pynvim.autocmd('BufEnter')
    def on_buf_enter(self):
        self.update()

    @pynvim.autocmd('BufRead')
    def on_buf_read(self):
        self.update()

    @pynvim.autocmd('BufNewFile')
    def on_buf_new_file(self):
        self.update()
