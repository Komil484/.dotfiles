Set-PSReadLineOption -PredictionSource None

Set-Alias sha Get-FileHash
Remove-Item alias:wget

# XDG
$env:XDG_CONFIG_HOME = "$HOME\.config"
$env:XDG_DATA_HOME = "$HOME\.local\share"
$env:XDG_STATE_HOME = "$HOME\.local\share"

# yazi
$env:YAZI_CONFIG_HOME = "$env:XDG_CONFIG_HOME\yazi"

# nvim stuff
$nvim = "$env:XDG_CONFIG_HOME\nvim"
$nvimdata = "$env:XDG_STATE_HOME\nvim-data"
