local ts = require("nvim-treesitter")

local parsers = {
  "c",
  "elixir",
  "go",
  "java",
  "javascript",
  "kotlin",
  "lua",
  "python",
  "ruby",
  "rust",
  "typescript",
  "yaml",
}

ts.setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})

-- Replaces ensure_installed. Installation is asynchronous and is a no-op
-- for parsers that are already installed.
ts.install(parsers)

-- Replaces highlight.enable / highlight.disable.
local highlight_disabled = {
  dockerfile = true,
  html = true,
  markdown = true,
  ruby = true,
  scala = true,
  yaml = true,
}

-- Neovim ftplugins can start bundled Tree-sitter highlighting independently.
-- For example, Neovim 0.12 enables it for Markdown before this setup runs.
vim.api.nvim_create_autocmd("FileType", {
  pattern = vim.tbl_keys(highlight_disabled),
  callback = function(args)
    vim.treesitter.stop(args.buf)
  end,
})

-- Replaces indent.enable / indent.disable.
local indent_disabled = {
  yaml = true,
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = parsers,
  callback = function(args)
    local filetype = vim.bo[args.buf].filetype

    if not highlight_disabled[filetype] then
      -- Ignore the error during the first startup while parsers are still
      -- being installed asynchronously. Reopening the buffer will attach it.
      pcall(vim.treesitter.start, args.buf)
    end

    if not indent_disabled[filetype] then
      vim.bo[args.buf].indentexpr =
      "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

-- nvim-treesitter-textobjects must also be on its main branch.
require("nvim-treesitter-textobjects").setup({
  select = {
    lookahead = false,
    include_surrounding_whitespace = false,
  },
  move = {
    set_jumps = false,
  },
})

local ts_select = require("nvim-treesitter-textobjects.select")
local ts_move = require("nvim-treesitter-textobjects.move")

local select_mappings = {
  ac = "@class.outer",
  ic = "@class.inner",

  ad = "@conditional.outer",
  id = "@conditional.inner",

  af = "@function.outer",
  ["if"] = "@function.inner",
  am = "@function.outer",
  im = "@function.inner",

  al = "@loop.outer",
  il = "@loop.inner",
}

for lhs, capture in pairs(select_mappings) do
  local query = capture
  vim.keymap.set({ "x", "o" }, lhs, function()
    ts_select.select_textobject(query, "textobjects")
  end)
end

local goto_next_mappings = {
  ["]c"] = "@class.outer",
  ["]C"] = "@class.inner",
  ["]d"] = "@conditional.outer",
  ["]D"] = "@conditional.inner",
  ["]f"] = "@function.outer",
  ["]F"] = "@function.inner",
  ["]m"] = "@function.outer",
  ["]M"] = "@function.inner",
  ["]l"] = "@loop.outer",
  ["]L"] = "@loop.inner",
}

for lhs, capture in pairs(goto_next_mappings) do
  local query = capture
  vim.keymap.set({ "n", "x", "o" }, lhs, function()
    ts_move.goto_next(query, "textobjects")
  end)
end

local goto_previous_mappings = {
  ["[c"] = "@class.outer",
  ["[C"] = "@class.inner",
  ["[d"] = "@conditional.outer",
  ["[D"] = "@conditional.inner",
  ["[f"] = "@function.outer",
  ["[F"] = "@function.inner",
  ["[m"] = "@function.outer",
  ["[M"] = "@function.inner",
  ["[l"] = "@loop.outer",
  ["[L"] = "@loop.inner",
}

for lhs, capture in pairs(goto_previous_mappings) do
  local query = capture
  vim.keymap.set({ "n", "x", "o" }, lhs, function()
    ts_move.goto_previous(query, "textobjects")
  end)
end

-- Python highlight customization
vim.api.nvim_set_hl(0, "@attribute.python", { link = "Function" })
vim.api.nvim_set_hl(0, "@attribute.builtin.python", { link = "Function" })
vim.api.nvim_set_hl(0, "@constructor.python", { link = "Type" })
vim.api.nvim_set_hl(0, "@field.python", { link = "Underlined" })
vim.api.nvim_set_hl(0, "@function.call.python", { link = "Function" })
vim.api.nvim_set_hl(0, "@keyword.directive.python", { link = "PreProc" })
vim.api.nvim_set_hl(0, "@keyword.import.python", { link = "PreProc" })
vim.api.nvim_set_hl(0, "@method.call.python", { link = "Method" })
vim.api.nvim_set_hl(0, "@punctuation.delimiter.python", { link = "PreProc" })
vim.api.nvim_set_hl(0, "@punctuation.bracket.python", { link = "PreProc" })
vim.api.nvim_set_hl(0, "@punctuation.special.python", { link = "PreProc" })
vim.api.nvim_set_hl(0, "@string.python", { link = "String" })
vim.api.nvim_set_hl(0, "@string.regexp.python", { link = "SpecialComment" })
vim.api.nvim_set_hl(0, "@type.builtin.python", { link = "Method" })
vim.api.nvim_set_hl(0, "@variable.builtin.python", { link = "Type" })
vim.api.nvim_set_hl(0, "@variable.member.python", { link = "Underlined" })
vim.api.nvim_set_hl(0, "@variable.parameter.python", { link = "Function" })
vim.api.nvim_set_hl(0, "@variable.python", { link = "Method" })

-- Go highlight customization
vim.api.nvim_set_hl(0, "@function.go", { link = "Method" })
vim.api.nvim_set_hl(0, "@method.go", { link = "Special" })
vim.api.nvim_set_hl(0, "@module.go", { link = "Type" })
vim.api.nvim_set_hl(0, "@namespace.go", { link = "Type" })
vim.api.nvim_set_hl(0, "@type.builtin.go", { link = "Type" })
vim.api.nvim_set_hl(0, "@variable.go", { link = "Method" })
vim.api.nvim_set_hl(0, "@variable.parameter.go", { link = "Identifier" })

-- Java highlight customization
vim.api.nvim_set_hl(0, "@function.java", { link = "Method" })
vim.api.nvim_set_hl(0, "@method.java", { link = "Special" })
vim.api.nvim_set_hl(0, "@namespace.java", { link = "Type" })
vim.api.nvim_set_hl(0, "@variable.java", { link = "Method" })
