vim.g.mapleader = " "

vim.keymap.set("n", "<esc>", vim.cmd.noh) -- no highlight
vim.keymap.set("t", "<esc>", "<C-\\><C-n>")

-- common commands
vim.keymap.set("n", "<leader>w", vim.cmd.write)
vim.keymap.set("n", "<leader>x", vim.cmd.quit)
vim.keymap.set("n", "<leader>ss", vim.cmd.split)
vim.keymap.set("n", "<leader>sv", vim.cmd.vsplit)
vim.keymap.set("n", "<leader>qq", vim.cmd.cclose)

-- navigation
vim.keymap.set({ "n", "v" }, "<C-u>", "<C-u>zz")
vim.keymap.set({ "n", "v" }, "<C-d>", "<C-d>zz")

-- window navigation
vim.keymap.set("n", "<C-left>", "<C-w>h")
vim.keymap.set("n", "<C-right>", "<C-w>l")
vim.keymap.set("n", "<C-down>", "<C-w>j")
vim.keymap.set("n", "<C-up>", "<C-w>k")

-- swap lines
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')

vim.keymap.set("n", "<leader>f", function()
	vim.api.nvim_del_augroup_by_name("__formatter__")
	print("Formatter disabled till end of session")
end)

-- plugin keymaps
vim.keymap.set("n", "<leader>l", vim.cmd.Lazy)

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.keymap.set("n", "-", "<cmd>Oil --float<cr>", { desc = "Open parent directory" })
