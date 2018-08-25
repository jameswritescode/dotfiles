# pylint: disable=import-error, missing-docstring, no-self-use
# pylint: disable=too-few-public-methods

from ranger.api import register_linemode
from ranger.core.linemode import LinemodeBase

DIR_NODE_MATCHES = {
    '.bundle': '',
    '.ebextensions': '',
    '.elasticbeanstalk': '',
    '.git': '',
    '.github': '',
    'node_modules': '',
}

FILE_EXT_MATCHES = {
    'applescript': '',
    'bash': '',
    'cgo': '',
    'conf': '',
    'config': '',
    'css': '',
    'db': '',
    'gif': '',
    'go': '',
    'hs': '',
    'html': '',
    'jpeg': '',
    'jpg': '',
    'js': '',
    'json': '',
    'jsx': '',
    'lua': '',
    'md': '',
    'mysql': '',
    'php': '',
    'png': '',
    'py': '',
    'rb': '',
    'rs': '',
    'sh': '',
    'sql': '',
    'vim': '',
    'yaml': '',
    'yml': '',
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
    'Guardfile': '',
    'Rakefile': '',
    'config.ru': '',
    'package.json': '',
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
