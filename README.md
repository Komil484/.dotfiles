# Powershell
In order to get the program to start working add this to `$PROFILE`
(change `<dotfiles path>` with the location of `powershell`)
```ps1
. <dotfiles path>\powershell\init.ps1
```
Additionally, you can add a `local.ps1` to `powershell\config\`, this is going to be called during setup, and will not be saved in the github repository.
