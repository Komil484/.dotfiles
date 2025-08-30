# Oh-my-posh setup
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/dracula.omp.json" | Invoke-Expression

# Zoxide setup
# Must be at the end
Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })
