## Options section
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.
setopt inc_append_history                                       # save commands are added to the history immediately, otherwise only when shell exits.
setopt histignorespace                                          # Don't save commands that start with space

zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
zstyle ':completion:*' menu select                              # Highlight menu selection
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word
zstyle :compinstall filename '/home/mateo/.zshrc'

# PROMPT="%n@%m %~ > "
eval "$(starship init zsh)"

autoload -Uz compinit
compinit

## Plugins section: Enable fish style features
# Use syntax highlighting
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Use auto suggestions
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# End of lines added by compinstall

export EDITOR="NVIM_APPNAME=nvim-custom nvim"
export PATH=$HOME/.config/rofi/scripts:$PATH
[[ $- != *i* ]] && return

# alias vim="NVIM_APPNAME=nvim-custom $EDITOR"
alias vim="$EDITOR"
alias grep="grep --color=auto"
alias ls="exa -lhA --group-directories-first --color=auto --icons"
alias cat="bat"
alias ccat="/usr/bin/cat"
alias cp="cp -i"                                                # Confirm before overwriting something
alias df='df -h'                                                # Human-readable sizes
alias free='free -m'                                            # Show sizes in MB
alias wallpaper='function _wallpaper() { hyprctl hyprpaper preload "$1"; hyprctl hyprpaper wallpaper ",$1"; }; _wallpaper'

# Initialize zoxide
eval "$(zoxide init zsh)"

# Created by `pipx` on 2025-08-21 03:02:51
export PATH="$PATH:/home/mateo/.local/bin"

# Load Angular CLI autocompletion.
source <(ng completion script)

if command -v fzf &> /dev/null; then
  if [[ -f /usr/share/fzf/completion.zsh ]]; then
    source /usr/share/fzf/completion.zsh
  fi
  if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
    source /usr/share/fzf/key-bindings.zsh
  fi
fi
