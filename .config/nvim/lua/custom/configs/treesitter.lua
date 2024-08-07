local options = {
  ensure_installed = {
    "cpp",
    "c",
    "python",
    "cmake",
    "make",
    "glsl",
    "bash",
    "perl",
    "lua",
    "markdown",
    "yaml",
    "json",
    "rust",
  },

  highlight = {
    enable = true,

    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,

    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

  indent = { enable = true },
}

return options
