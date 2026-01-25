return {
  -- gitsigns
  {
    "lewis6991/gitsigns.nvim",
    event = {"BufReadPre", "BufNewFile"},
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },

      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end

        map("n", "]h", gs.next_hunk, "Next hunk")
        map("n", "[h", gs.prev_hunk, "Prev hunk")
        map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
        map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
        map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
        map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")
        map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
        map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Blame line")
        map("n", "<leader>hd", gs.diffthis, "Diff this")
      end,
    }
  },
  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
      },
      "nvim-telescope/telescope-file-browser.nvim",
    },
    keys = {
      { ";f", function() require("telescope.builtin").find_files({ no_ignore = false, hidden = true }) end, desc = "Find Files" },
      { ";r", function() require("telescope.builtin").live_grep({ additional_args = { "--hidden" } }) end, desc = "Live Grep" },
      { "\\\\", function() require("telescope.builtin").buffers() end, desc = "Buffers" },
      { ";t", function() require("telescope.builtin").help_tags() end, desc = "Help Tags" },
      { ";;", function() require("telescope.builtin").resume() end, desc = "Resume Search" },
      { ";e", function() require("telescope.builtin").diagnostics() end, desc = "Diagnostics" },
      { "sf", function()
          local telescope = require("telescope")
          local function telescope_buffer_dir() return vim.fn.expand("%:p:h") end
          telescope.extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = "normal",
            layout_config = { height = 40 }
          })
        end,
        desc = "File Browser"
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = require("telescope").extensions.file_browser.actions

      opts = opts or {}
      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        wrap_results = true,
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        mappings = {
          n = {},
        },
      })

      opts.pickers = {
        diagnostics = {
          theme = "ivy",
          initial_mode = "normal",
          layout_config = { preview_cutoff = 9999 },
        },
      }

      opts.extensions = {
        file_browser = {
          theme = "dropdown",
          hijack_netrw = true,
          mappings = {
            ["n"] = {
              ["N"] = fb_actions.create,
              ["h"] = fb_actions.goto_parent_dir,
              ["/"] = function() vim.cmd("startinsert") end,
              ["<PageUp>"] = actions.preview_scrolling_up,
              ["<PageDown>"] = actions.preview_scrolling_down,
            },
          },
        },
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        }
      }

      telescope.setup(opts)
      pcall(telescope.load_extension, "fzf")
      pcall(telescope.load_extension, "file_browser")
    end,
  },
  -- blink
  {
    "saghen/blink.cmp",
    version = "*",
    opts = {
      keymap = {
        preset = "default",
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<CR>"] = { "accept", "fallback" },
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    },
  },
  -- which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      win = {
        border = "rounded",
        padding = { 2, 2 },
      },
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
      },
      spec = {
        { "<leader>c", group = "Code" },
      },
    },
    keys = {
      {
        "<leader>?",
        function ()
          require("which-key").show({global=false})
        end,
        desc = "Buffer Local Keymaps"
      }
    }
  },
}
