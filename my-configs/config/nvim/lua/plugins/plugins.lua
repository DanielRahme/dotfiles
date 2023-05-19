-- since this is just an example spec, don't actually load anything here and return an empty spec
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

  -- Colorschemes
  {
    "folke/tokyonight.nvim",
    opts = {
      on_colors = function(colors)
        colors.border = "#565f89"
      end,
    },
  },
  { "rose-pine/neovim" },
  { "rebelot/kanagawa.nvim" },
  { "catppuccin/nvim" },
  { "EdenEast/nightfox.nvim" },
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = { { "-", "<cmd>Oil<cr>", desc = "Oil: Filesystem in Neovim" } },
  },
}
