return {
  -- Autopair
  {
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter" },
    config = true,
  },
  -- Comment
  {
    "folke/ts-comments.nvim",
    event = "VeryLazy",
    opts = {},
  },
  -- Latex
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_view_method = "evince"
    end,
  },
  -- {
  --   "smjonas/inc-rename.nvim",
  --   cmd = "IncRename"
  --   config = true,
  -- }
  -- Copilot
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<C-l>",
          accept_word = "<M-l>",
          accept_line = "<M-S-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
}

