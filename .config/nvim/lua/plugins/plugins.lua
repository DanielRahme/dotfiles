return {

  { "ThePrimeagen/harpoon" },
  { "tpope/vim-fugitive" },
  { "mbbill/undotree" },
  { "kylechui/nvim-surround" },
  { "kalvinpearce/ShaderHighlight" },
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },

  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = { { "-", "<cmd>Oil<cr>", desc = "Oil: Filesystem in Neovim" } },
  },
}
