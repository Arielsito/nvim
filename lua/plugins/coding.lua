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

