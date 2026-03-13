# Set oh-my-posh theme
PATH_OF_THE_THEME="/usr/share/oh-my-posh/themes/capr4n.omp.json"

export EDITOR=nvim

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"

typeset -U path

path=(
    "$HOME/.local/bin"
    "$HOME/go/bin"
    "$HOME/.fzf/bin"
    $path
)

export PATH

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
    --highlight-line \
    --info=inline\
    --ansi \
    --layout=reverse \
    --border=rounded \
    --keep-right \
    --height=45% \
    --cycle \
    \
    --color=bg+:#2e3c64 \
    --color=bg:-1 \
    --color=border:#29a4bd \
    --color=fg:#c0caf5 \
    --color=gutter:-1 \
    --color=header:#ff9e64 \
    --color=hl+:#2ac3de \
    --color=hl:#2ac3de \
    --color=info:#545c7e \
    --color=marker:#ff007c \
    --color=pointer:#ff007c \
    --color=prompt:#2ac3de \
    --color=query:#c0caf5:regular \
    --color=scrollbar:#29a4bd \
    --color=separator:#ff9e64 \
    --color=spinner:#ff007c \
"

export _ZO_FZF_OPTS="$FZF_DEFAULT_OPTS \
    --no-sort \
    --bind=ctrl-z:ignore \
    --exit-0 \
"

# For flutter
export CHROME_EXECUTABLE=helium-browser
