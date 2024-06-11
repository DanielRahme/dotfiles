local plugins = {
  {
    {
      "tpope/vim-fugitive",
      lazy = false,
    },
    {
      "echasnovski/mini.surround",
      lazy = false,
      version = false,
      opts = function()
        return require "custom.configs.surround"
      end,
    },
    {
      "williamboman/mason.nvim",
      opts = {
        ensure_installed = {
          -- C++
          "clangd",
          "clang-format",
          "codelldb",
          -- Python
          "pyright",
          "mypy",
          "debugpy",
          "black",
          -- Lua
          "stylua",
        },
      },
    },
    {
      "simrat39/symbols-outline.nvim",
      cmd = "SymbolsOutline",
      keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
      config = true,
    },
    {
      "stevearc/oil.nvim",
      lazy = false,
      config = function(_, opts)
        require("oil").setup()
        require("core.utils").load_mappings "oil"
      end,
    },
    {
      "mbbill/undotree",
      lazy = false,
      config = function(_, opts)
        require("core.utils").load_mappings "undotree"
      end,
    },
    {
      "smoka7/hop.nvim",
      version = "*",
      opts = {
        keys = "etovxqpdygfblzhckisuran",
      },
      keys = {
        {
          "<leader>fj",
          function()
            require("hop").hint_words()
          end,
          mode = { "n", "x", "o" },
        },
      },
    },
    {
      "nvim-treesitter/nvim-treesitter",
      opts = function()
        return require "custom.configs.treesitter"
      end,
    },
    {
      "jose-elias-alvarez/null-ls.nvim",
      event = "VeryLazy",
      --ft = { "python", "cpp" },
      opts = function()
        return require "custom.configs.null-ls"
      end,
    },
    {
      "neovim/nvim-lspconfig",
      config = function()
        require "plugins.configs.lspconfig"
        require "custom.configs.lspconfig"
      end,
    },
    -- DAP debugger
    {
      "jay-babu/mason-nvim-dap.nvim",
      event = "VeryLazy",
      dependencies = {
        "williamboman/mason.nvim",
        "nfussenegger/nvim-dap",
      },
      opts = {
        handlers = {},
      },
    },
    {
      "rcarriga/nvim-dap-ui",
      dependencies = "mfussenegger/nvim-dap",
      config = function()
        local dap = require "dap"
        local dapui = require "dapui"
        dapui.setup()
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close()
        end
      end,
    },
    {
      "mfussenegger/nvim-dap",
      config = function(_, opts)
        require("core.utils").load_mappings "dap"
      end,
    },
    {
      "mfussenegger/nvim-dap-python",
      ft = "python",
      dependencies = {
        "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui",
      },
      config = function(_, opts)
        local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
        require("dap-python").setup(path)
        require("core.utils").load_mappings "dap_python"
      end,
    },
  },
}
return plugins
