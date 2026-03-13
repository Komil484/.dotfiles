# If we aren't a login shell, but we want the login variables anyway:
[[ -o login ]] || source ~/.zprofile

## Import easy-zsh-config
if [[ -r ~/.config/zsh/my-easy-zsh-config.sh ]]; then
  source ~/.config/zsh/my-easy-zsh-config.sh "${PATH_OF_THE_THEME}"
fi

alias ls='ls --color=auto -F'
alias la='ls -lhF'
alias lsa='ls -lAhF'
alias lsl='lsa --color=always | less -R'

alias mv='mv -i'
alias cp='cp -i'                                                # Confirm before overwriting something

alias q=exit

# Zoxide
eval "$(zoxide init --cmd cd zsh)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
