require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "|", "<cmd>vsplit<cr>", { desc = "Vertical Split"})
map("n", "\\", "<cmd>split<cr>", { desc = "Horizontal Split"})
map("n", "<leader>f", function() vim.diagnostic.open_float() end, { desc = "Open Float Diag"})
map("v", ".", ":norm.<CR>", { desc = "Make visual mode . work as normal mode's ."})
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
