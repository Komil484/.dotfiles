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

function e {
    explorer .
}

function la {
    ls -Force
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

# Fzf
$env:FZF_DEFAULT_OPTS="
    --highlight-line
    --info=inline
    --ansi
    --layout=reverse
    --border=rounded
    --keep-right
    --height=45%
    --cycle

    --color=bg+:#2e3c64
    --color=bg:-1
    --color=border:#29a4bd
    --color=fg:#c0caf5
    --color=gutter:-1
    --color=header:#ff9e64
    --color=hl+:#2ac3de
    --color=hl:#2ac3de
    --color=info:#545c7e
    --color=marker:#ff007c
    --color=pointer:#ff007c
    --color=prompt:#2ac3de
    --color=query:#c0caf5:regular
    --color=scrollbar:#29a4bd
    --color=separator:#ff9e64
    --color=spinner:#ff007c
"

# Zoxide
$env:_ZO_FZF_OPTS="$env:FZF_DEFAULT_OPTS
   --no-sort
   --bind=ctrl-z:ignore
   --exit-0
"
