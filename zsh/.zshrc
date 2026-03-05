# If we aren't a login shell, but we want the login variables anyway:
[[ -o login ]] || source ~/.zprofile

## Import easy-zsh-config
if [[ -r ~/.config/zsh/easy-zsh-config.sh ]]; then
  source ~/.config/zsh/easy-zsh-config.sh "${PATH_OF_THE_THEME}"
fi

alias ls='ls --color=auto -F'
alias la='ls -lhF'
alias lsa='ls -lAhF'

alias q=exit

# Zoxide
eval "$(zoxide init --cmd cd zsh)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
