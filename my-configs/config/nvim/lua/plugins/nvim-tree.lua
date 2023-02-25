require("nvim-tree").setup()

--local builtin = require('nvim-tree.builtin')
vim.keymap.set('n', '<leader>nt', ":NvimTreeToggle<CR>", {})
