# pylint: disable=import-error, missing-docstring, no-self-use
# pylint: disable=too-few-public-methods

from ranger.api import register_linemode
from ranger.core.linemode import LinemodeBase

# Reused Icons
APPLE = ''
ARCHIVE = ''
AWS = ''
CLOJURE = ''
CONF = ''
CONSOLE = ''
DB = ''
DOCKER = ''
DOTNET = ''
DROPBOX = ''
ELIXIR = ''
GIT = ''
GITHUB = ''
GO = ''
HASKELL = ''
IMAGE = ''
JAVA = ''
JAVASCRIPT = ''
LICENSE = ''
MUSIC = ''
NODE = ''
NPM = ''
PYTHON = ''
RUBY = ''
RUST = ''
SASS = ''
VIM = ''

DIR_NODE_MATCHES = {
    '.atom': '',
    '.aws': AWS,
    '.bundle': RUBY,
    '.cabal': HASKELL,
    '.cargo': RUST,
    '.dnx': DOTNET,
    '.docker': DOCKER,
    '.dropbox': DROPBOX,
    '.ebextensions': AWS,
    '.elasticbeanstalk': AWS,
    '.gem': RUBY,
    '.ghc': HASKELL,
    '.git': GIT,
    '.github': GITHUB,
    '.heroku': '',
    '.hoogle': HASKELL,
    '.ipython': PYTHON,
    '.lein': CLOJURE,
    '.multirust': RUST,
    '.node-gyp': NODE,
    '.npm': NODE,
    '.nuget': DOTNET,
    '.nvm': NODE,
    '.rubies': RUBY,
    '.rustup': RUST,
    '.rvm': RUBY,
    '.stack': HASKELL,
    '.tmux': CONF,
    '.tmuxinator': CONF,
    '.vim': VIM,
    'Desktop': '',
    'Documents': '',
    'Downloads': '',
    'Dropbox (Personal)': DROPBOX,
    'Dropbox': DROPBOX,
    'Movies': '',
    'Music': '',
    'Pictures': '',
    'node_modules': NPM,
    'nvim': VIM,
}

FILE_EXT_MATCHES = {
    '7z': ARCHIVE,
    'applescript': APPLE,
    'bash': CONSOLE,
    'bz2': ARCHIVE,
    'c': '',
    'cgo': GO,
    'clj': CLOJURE,
    'coffee': '',
    'conf': CONF,
    'config': CONF,
    'cpp': '',
    'cson': CONF,
    'css': '',
    'csv': '藺',
    'db': DB,
    'diff': '',
    'dmg': APPLE,
    'docx': '',
    'ex': ELIXIR,
    'exe': '',
    'exs': ELIXIR,
    'gif': IMAGE,
    'go': GO,
    'gz': ARCHIVE,
    'hs': HASKELL,
    'html': '',
    'ico': IMAGE,
    'ini': CONF,
    'jar': JAVA,
    'java': JAVA,
    'jpeg': IMAGE,
    'jpg': IMAGE,
    'js': JAVASCRIPT,
    'json': '',
    'jsx': '',
    'less': '',
    'lua': '',
    'md': '',
    'mp3': MUSIC,
    'mp4': MUSIC,
    'mysql': '',
    'pdf': '',
    'php': '',
    'pl': '',
    'png': IMAGE,
    'py': PYTHON,
    'rar': ARCHIVE,
    'rb': RUBY,
    'rpm': '',
    'rs': RUST,
    'sass': SASS,
    'scss': SASS,
    'sh': CONSOLE,
    'sql': DB,
    'sqlite': '',
    'tgz': ARCHIVE,
    'ts': '',
    'vim': VIM,
    'xml': '',
    'yaml': CONF,
    'yml': CONF,
    'zip': ARCHIVE,
    'zsh': CONSOLE,
    'zsh-theme': CONSOLE,
}

FILE_NODE_MATCHES = {
    '.DS_Store': APPLE,
    '.babelrc': JAVASCRIPT,
    '.bash_profile': CONSOLE,
    '.bashrc': CONSOLE,
    '.dockerignore': DOCKER,
    '.gemrc': RUBY,
    '.ghci': HASKELL,
    '.gitconfig': GIT,
    '.gitignore': GIT,
    '.nvmrc': NODE,
    '.profile': CONSOLE,
    '.rspec': RUBY,
    '.rubocop.yml': RUBY,
    '.ruby-version': RUBY,
    '.zshrc': CONSOLE,
    'Brewfile': RUBY,
    'CODEOWNERS': GITHUB,
    'Dockerfile': DOCKER,
    'Gemfile': RUBY,
    'Gemfile.lock': RUBY,
    'Guardfile': RUBY,
    'LICENSE': LICENSE,
    'LICENSE.txt': LICENSE,
    'Rakefile': RUBY,
    'config.ru': RUBY,
    'license': LICENSE,
    'package.json': NPM,
    'yarn.lock': JAVASCRIPT,
}


def devicon(file):
    path = file.relative_path

    if file.is_directory:
        return DIR_NODE_MATCHES.get(path, '')

    return FILE_NODE_MATCHES.get(
        path, FILE_EXT_MATCHES.get(file.extension, '')
    )


@register_linemode
class JamesLinemode(LinemodeBase):
    name = 'james'

    def filetitle(self, file, _metadata):
        return f'{devicon(file)}  {file.relative_path}'
