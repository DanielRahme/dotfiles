-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Exit insert mode
map("i", "jj", "<esc>", { desc = "Exit instert mode" })

-- buffers
if Util.has("bufferline.nvim") then
  map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
else
  map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
end
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- floating terminal
map("n", "<leader>ft", function()
  Util.float_term(nil, { cwd = Util.get_root() })
end, { desc = "Terminal (root dir)" })

map("n", "<leader>fT", function()
  Util.float_term()
end, { desc = "Terminal (cwd)" })
map("t", "jj", "<c-\\><c-n>", { desc = "Go out of terminal mode" }) -- Not working

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move visual block down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move visual block up" })

-- Cursor stays in place when joining lines "J"
vim.keymap.set("n", "J", "mzJ`z")
-- Ctrl-d and Ctrl-u: scroll up/down pimp-up
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Mouse in the middle when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
map("n", "<leader>a", mark.add_file, { desc = "Add file to harpoon" })
map("n", "<C-e>", ui.toggle_quick_menu, { desc = "View harpoon files" })

map("n", "<leader>1", function()
  ui.nav_file(1)
end, { desc = "Go to harpoon file 1" })

map("n", "<leader>2", function()
  ui.nav_file(2)
end, { desc = "Go to harpoon file 2" })

map("n", "<leader>3", function()
  ui.nav_file(3)
end, { desc = "Go to harpoon file 3" })

map("n", "<leader>4", function()
  ui.nav_file(4)
end, { desc = "Go to harpoon file 4" })

-- Undotree
map("n", "<leader>ut", vim.cmd.UndotreeToggle, { desc = "Toggle undo-tree" })
