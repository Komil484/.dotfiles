vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

vim.opt.rnu = true
vim.opt.nu = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.linebreak = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.smartindent = true
vim.opt.showmode = false
vim.opt.conceallevel = 2

vim.opt.sessionoptions = "buffers,curdir,folds,resize,tabpages,terminal,winsize"

if vim.fn.has("win32") == 1 then
	vim.opt.shell = (vim.fn.executable("pwsh") ~= 0) and "pwsh" or "powershell"
	vim.opt.shellcmdflag =
		"-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';"
	vim.opt.shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
	vim.opt.shellpipe = '2>&1 | %%{ "$_" } | Tee-Object %s; exit $LastExitCode'
	vim.opt.shellquote = ""
	vim.opt.shellxquote = ""
elseif vim.fn.has("unix") then
	vim.opt.shell = (vim.fn.executable("bash") ~= 0) and "bash" or "sh"
end
