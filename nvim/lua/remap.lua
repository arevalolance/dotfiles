-- Harpoon Remap 
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>hf", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-u>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-i>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-o>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-p>", function() ui.nav_file(4) end)

-- UndoTree Remap
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Trouble Remap
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
