-- Harpoon Remap
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>hf", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-7>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-8>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-9>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-0>", function() ui.nav_file(4) end)

-- UndoTree Remap
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Trouble Remap
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  { silent = true, noremap = true }
)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", "\"_dP")

-- delete without adding to register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- moves selected lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- ez replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


-- git
vim.keymap.set("n", "<leader>gf", ":diffget //2<CR>", { desc = "Diff get Current" })
vim.keymap.set("n", "<leader>gh", ":diffget //3<CR>", { desc = "Diff get Head" })
vim.keymap.set("n", "<leader>dv", ":Gvdiffsplit<CR>", { desc = "Diff Vertical" })
vim.keymap.set("n", "<leader>dh", ":Ghdiffsplit<CR>", { desc = "Diff Horizontal" })
vim.keymap.set("n", "<leader>di", ":DiffviewOpen<CR>", { desc = "Diff View Open" })
vim.keymap.set("n", "<leader>dh", ":DiffviewFileHistory<CR>", { desc = "Diff View File History" })
vim.keymap.set("n", "<leader>dq", ":tabc<CR>", { desc = "Close Tab" })
