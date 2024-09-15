Set-PSReadLineOption -PredictionSource None

Set-Alias sha Get-FileHash
Remove-Item alias:wget

$env:XDG_CONFIG_HOME = "$HOME\.config"
$env:XDG_DATA_HOME = "$HOME\.local\share"
$env:XDG_STATE_HOME = "$HOME\.local\share"

$nvim = "$env:XDG_CONFIG_HOME\nvim"
$nvimdata = "$env:XDG_STATE_HOME\nvim-data"

$Diskstation = "192.168.100.51"

$work = "C:\work"
$leet = "C:\work\leetcode"

$gd = "C:\godot_projects\SpaceRoguelite"
$dev = "$HOME\vaults\work\SpaceRogueliteDevlog"

$llm = "C:\LLM"
$stable = "C:\work\python_projects\learning_python"

$scala = "C:\work\self_projects\scala_projects\learning_scala"

$eelab = "20220932@eelabg14.kaist.ac.kr"
$eelab1= "20220932@eelabg13.kaist.ac.kr"
$ee205 = "C:\work\ee205"
$cs320 = "C:\work\cs320"
