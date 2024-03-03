local M = {}

-- Custom mappings
M.my_mappings = {
  i = {
    ["jj"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
  }
}

-- DAP debugger
M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>", "DAP toggle breakpoint"}
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

return M
