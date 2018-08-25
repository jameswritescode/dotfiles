# pylint: disable=import-error, missing-docstring, no-self-use
# pylint: disable=too-few-public-methods

from ranger.api import register_linemode
from ranger.core.linemode import LinemodeBase

DIR_NODE_MATCHES = {
    '.atom': '',
    '.aws': '',
    '.bundle': '',
    '.cabal': '',
    '.cargo': '',
    '.dnx': '',
    '.docker': '',
    '.dropbox': '',
    '.ebextensions': '',
    '.elasticbeanstalk': '',
    '.gem': '',
    '.ghc': '',
    '.git': '',
    '.github': '',
    '.heroku': '',
    '.hoogle': '',
    '.ipython': '',
    '.lein': '',
    '.multirust': '',
    '.node-gyp': '',
    '.npm': '',
    '.nvm': '',
    '.rubies': '',
    '.rustup': '',
    '.rvm': '',
    '.stack': '',
    '.tmux': '',
    '.tmuxinator': '',
    '.vim': '',
    'node_modules': '',
}

FILE_EXT_MATCHES = {
    '7z': '',
    'applescript': '',
    'bash': '',
    'bz2': '',
    'c': '',
    'cgo': '',
    'clj': '',
    'coffee': '',
    'conf': '',
    'config': '',
    'cpp': '',
    'cson': '',
    'css': '',
    'csv': '藺',
    'db': '',
    'dmg': '',
    'docx': '',
    'ex': '',
    'exe': '',
    'exs': '',
    'gif': '',
    'go': '',
    'gz': '',
    'hs': '',
    'html': '',
    'jar': '',
    'java': '',
    'jpeg': '',
    'jpg': '',
    'js': '',
    'json': '',
    'jsx': '',
    'less': '',
    'lua': '',
    'md': '',
    'mp3': '',
    'mp4': '',
    'mysql': '',
    'pdf': '',
    'php': '',
    'png': '',
    'py': '',
    'rb': '',
    'rpm': '',
    'rs': '',
    'sass': '',
    'scss': '',
    'sh': '',
    'sql': '',
    'sqlite': '',
    'tgz': '',
    'vim': '',
    'yaml': '',
    'yml': '',
    'zip': '',
    'zsh': '',
    'zsh-theme': '',
}

FILE_NODE_MATCHES = {
    '.DS_Store': '',
    '.babelrc': '',
    '.bash_profile': '',
    '.bashrc': '',
    '.dockerignore': '',
    '.gemrc': '',
    '.ghci': '',
    '.gitconfig': '',
    '.gitignore': '',
    '.nvmrc': '',
    '.profile': '',
    '.rspec': '',
    '.rubocop.yml': '',
    '.ruby-version': '',
    '.zshrc': '',
    'Brewfile': '',
    'CODEOWNERS': '',
    'Dockerfile': '',
    'Gemfile': '',
    'Gemfile.lock': '',
    'Guardfile': '',
    'LICENSE': '',
    'LICENSE.txt': '',
    'Rakefile': '',
    'config.ru': '',
    'package.json': '',
    'yarn.lock': '',
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
