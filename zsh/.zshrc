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

# simple function to emulate clipboard manager using OSC 52 sequence
cb() {
  # Read from stdin (piped input) or use arguments
  local input
  if [[ -p /dev/stdin ]]; then
    input=$(cat)
  else
    input="$*"
  fi

  # Only proceed if there is something to copy
  if [[ -n "$input" ]]; then
    # Base64 encode the input
    # -w0 ensures the output is on a single line
    local encoded=$(echo -n "$input" | base64 -w0)
    
    # Send the OSC 52 sequence to the terminal
    # \e]52;c; is the header, \a is the terminator
    printf "\e]52;c;%s\a" "$encoded"
  fi
}

# Zoxide
eval "$(zoxide init --cmd cd zsh)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
