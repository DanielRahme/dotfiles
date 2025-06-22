return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
--    "neovim/nvim-lspconfig",
    --config = function()
      --require "configs.lspconfig"
    --end,
  },
  {
    require "plugins.oil"
  },
  {
    require "plugins.git"
  },
  {
    require "plugins.outline"
  },
  {
    require "plugins.hop"
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false
  },
  {
    "neovim/nvim-lspconfig",
    enabled = false
  }
}
