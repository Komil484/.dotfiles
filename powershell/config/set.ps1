Set-PSReadLineOption -PredictionSource None

# Yazi setup
function y {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath $cwd
    }
    Remove-Item -Path $tmp
}

function q {
    Exit
}

Set-Alias n nvim
Set-Alias g git
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
