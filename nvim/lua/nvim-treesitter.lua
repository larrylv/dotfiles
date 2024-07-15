require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "elixir", "go", "java", "javascript", "kotlin", "lua", "python", "ruby", "rust", "typescript", "yaml" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = { "dockerfile", "html", "markdown", "ruby", "scala", "yaml" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true,
    disable = { 'yaml' }
  },

  textobjects = {
    select = {
      enable = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",

        ["ad"] = "@conditional.outer",
        ["id"] = "@conditional.inner",

        ["af"] = "@function.outer",
        ["if"] = "@function.inner",

        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = false, -- whether to set jumps in the jumplist
      -- Below will go to either the start or the end, whichever is closer.
      -- Use if you want more granular movements
      -- Make it even more gradual by adding multiple queries and regex.
      goto_next = {
        ["]c"] = "@class.outer",
        ["]d"] = "@conditional.outer",
        ["]f"] = "@function.outer",
        ["]l"] = "@loop.outer",
      },
      goto_previous = {
        ["[c"] = "@class.outer",
        ["[d"] = "@conditional.outer",
        ["[f"] = "@function.outer",
        ["[l"] = "@loop.outer",
      }
    },
  },

  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}

-- read `:h treesitter-highlight-groups` for more information

-- python highlight customization
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

-- go highlight customization
vim.api.nvim_set_hl(0, "@function.go", { link = "Method" })
vim.api.nvim_set_hl(0, "@method.go", { link = "Special" })
vim.api.nvim_set_hl(0, "@module.go", { link = "Type" })
vim.api.nvim_set_hl(0, "@namespace.go", { link = "Type" })
vim.api.nvim_set_hl(0, "@type.builtin.go", { link = "Type" })
vim.api.nvim_set_hl(0, "@variable.go", { link = "Method" })
vim.api.nvim_set_hl(0, "@variable.parameter.go", { link = "Identifier" })

-- java highlight customization
vim.api.nvim_set_hl(0, "@function.java", { link = "Method" })
vim.api.nvim_set_hl(0, "@method.java", { link = "Special" })
vim.api.nvim_set_hl(0, "@namespace.java", { link = "Type" })
vim.api.nvim_set_hl(0, "@variable.java", { link = "Method" })
