require("conform").setup({
  formatters_by_ft = {
    -- Conform will run multiple formatters sequentially
    python = { "autopep8", "ruff_format" },
    ruby = { "rubyfmt" },
  },
  format_on_save = {
    lsp_fallback = true,
    timeout_ms = 500,
  },
})
