require("conform").setup({
  formatters_by_ft = {
    -- Conform will run multiple formatters sequentially
    -- python = { "autopep8", "isort", "ruff_format" },
    python = { "black", "isort", "ruff_fix" },
    ruby = { "rubyfmt" },
  },
  format_on_save = {
    lsp_fallback = true,
    timeout_ms = 3000,
  },
})

require("conform").formatters.black = {
  prepend_args = { "--line-length", "100", "--exclude", "''" },
}
