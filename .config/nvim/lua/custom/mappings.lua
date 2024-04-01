local M = {}

-- Custom mappings
M.my_mappings = {
  i = {
    ["jj"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
  },

  t = {
    ["jj"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
  },
}

-- DAP debugger
M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "DAP toggle breakpoint" },
    ["<leader>dr"] = { "<cmd> DapContinue <CR> ", "Run debugger" }
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require('dap-python').test_method()
      end,
      "Debug python run"
    }
  }
}

M.undotree = {
  n = {
    ["<leader>ut"] = {
      "<cmd> UndotreeToggle <CR>",
      "Toggle undotree"
    }
  }
}

M.oil = {
  n = {
    ["-"] = {
      "<cmd> Oil <CR>",
      "Oil open directory"
    }
  }
}

return M
