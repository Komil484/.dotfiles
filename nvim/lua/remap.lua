vim.g.mapleader = " "

vim.keymap.set("n", "<esc>", vim.cmd.noh) -- no highlight
vim.keymap.set("t", "<esc>", "<C-\\><C-n>")

-- common commands
vim.keymap.set("n", "<leader>w", vim.cmd.write)
vim.keymap.set("n", "<leader>x", vim.cmd.quit)
vim.keymap.set("n", "<leader>q", vim.cmd.wqall)

vim.keymap.set("n", "<leader>ss", vim.cmd.split)
vim.keymap.set("n", "<leader>sv", vim.cmd.vsplit)
vim.keymap.set("n", "<leader>cc", vim.cmd.cclose)

-- navigation
vim.keymap.set("n", "<S-down>", "<C-d>zz")
vim.keymap.set("n", "<S-up>", "<C-u>zz")

-- window navigation
vim.keymap.set("n", "<C-left>", "<C-w>h")
vim.keymap.set("n", "<C-right>", "<C-w>l")
vim.keymap.set("n", "<C-down>", "<C-w>j")
vim.keymap.set("n", "<C-up>", "<C-w>k")

-- tab navigation
vim.keymap.set("n", "<leader>t", vim.cmd.tabnew, { desc = "Open new tab" })

vim.keymap.set("n", "t", "gt")
vim.keymap.set("n", "T", "gT")

-- swap lines
vim.keymap.set("v", "<S-up>", ":m '<-2<cr>gv=gv")
vim.keymap.set("v", "<S-down>", ":m '>+1<cr>gv=gv")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")

-- copy / paste
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without saving into register" })
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>Y", function()
	vim.cmd("%y+")
end, { desc = "Yank file into clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P', { desc = "Paste from clipboard" })

-- disable formatter
vim.keymap.set("n", "<leader>f", function()
	vim.api.nvim_del_augroup_by_name("__formatter__")
	print("Formatter disabled till end of session")
end, { desc = "Disable formatter" })

-- delete shada contents
vim.keymap.set("n", "<leader>shada", function()
    local shada_file = vim.fs.joinpath(vim.fn.stdpath("state"), "shada/")
    vim.fn.delete(shada_file, "rf")
end)
