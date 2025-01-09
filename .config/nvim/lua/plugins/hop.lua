return {
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
}
