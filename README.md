#         d     o     t     f     i     l     e     s
# .oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oO

## Installation

````
DOTFILESDIR=${HOME}/.config/dotfiles \
&& mkdir -p ${DOTFILESDIR}
````

````
alias dot='git --git-dir=/home/michael/.config/dotfiles --work-tree=/home/michael'
````

## Personal Directory Hierarchy

| Directory          | Description                                                  |
|--------------------|--------------------------------------------------------------|
| `~/.local/bin`     | Most user commands                                           |
| `~/.local/include` | Header files for C programming                               |
| `~/.local/lib`     | Libraries for programs in `~/.local/bin` and `~/.local/sbin` |
| `~/.local/local`   | Locally installed software                                   |
| `~/.local/sbin`    | Non-essential system binaries                                |
| `~/.local/share`   | Architecture-independent data                                |
| `~/.local/src`     | Source code non-personally maintained code                   |

