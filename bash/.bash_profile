# XDG Base Directories
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"

# Path
PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/go/bin:$PATH" # Go package binaries
PATH="$HOME/.fzf/bin:$PATH" # Fzf binaries

# Fzf opts
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

# --color=bg:#1f2335 \
# --color=gutter:#1f2335 \

# Also execute ~/.bashrc
[[ -r ~/.bashrc ]] && . ~/.bashrc
