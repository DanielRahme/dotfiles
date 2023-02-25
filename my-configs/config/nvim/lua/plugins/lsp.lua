-- LSP
local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

lsp.setup_servers({"tsserver", "eslint", "lua_ls", "clangd", "cmake", "bashls", "pylsp" })
lsp.nvim_workspace() -- (Optional) Configure lua language server for neovim
lsp.setup()
--
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>e', vim.diagnostic.setloclist, opts)

require('lspconfig')['clangd'].setup{
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--completion-style=bundled",
        "--header-insertion=iwyu",
    },
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
}
