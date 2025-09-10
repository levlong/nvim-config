vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<C-,>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Windows navigator.
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Windows behavior.
vim.keymap.set("n", "<C-n>", ":tabnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-p>", ":tabprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-.>", ":tabclose<CR>", { noremap = true, silent = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlights text when yanking",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
