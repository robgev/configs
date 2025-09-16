require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "|", "<cmd>vsplit<cr>", { desc = "Vertical Split" })
map("n", "\\", "<cmd>split<cr>", { desc = "Horizontal Split" })
map("n", "<leader>f", function()
  vim.diagnostic.open_float()
end, { desc = "Open Float Diag" })
map("v", ".", ":norm.<CR>", { desc = "Make visual mode . work as normal mode's ." })
map("i", "jk", "<ESC>")
map({ "n", "v" }, "<leader>ac", "<cmd>Augment chat<CR>", { desc = "Augment: Chat" })
map("n", "<leader>an", "<cmd>Augment chat-new<CR>", { desc = "Augment: New Chat" })
map("n", "<leader>at", "<cmd>Augment chat-toggle<CR>", { desc = "Augment: Toggle Chat" })
map("i", "<cr>", "<cmd>call augment#Accept('\n')<cr>", { desc = "Augment: Accept Changes on Enter" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
