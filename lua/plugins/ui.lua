return {
  {
    "nvim-tree/nvim-web-devicons", lazy = true,
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.config
    opts = {
      bigfile = { enabled = true },
      quickfile = { enabled = true },
      dashboard = {
        preset = {
          header =  [[n e o v i m]],
          keys = {
            { icon = " ", key = "n", desc = "New file", action = ":ene | startinsert" },
            { icon = " ", key = "c", desc = "Open config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = " ", key = "q", desc = "Quit Neovim", action = ":qa" },
          },
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          {
            icon = " ",
            title = "Recent files",
            section = "recent_files",
            indent = 2,
            padding = 1,
            limit = 3,
          },
          {
            icon = " ",
            title = "Projects",
            section = "projects",
            indent = 2,
            padding = 1,
            limit = 2,
          },
          { section = "startup" },
        },
      },
    },
  },
  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      local function build_theme()
        local current_theme = vim.g.colors_name or ""
        local lualine_theme = "auto"
        if current_theme:find("neopywal") then
          local ok, C = pcall(function() return require("neopywal").get_colors() end)
          if ok and C then
            local dark_bg = C.background or C.color0 or "#000000"
            -- local U = require("neopywal.utils.color") -- in case you want to mess with the colors
            lualine_theme = {
              normal = {
                a = { fg = dark_bg, bg = C.color6, gui = "none" },
                b = { fg = C.foreground, bg = C.color0, gui = "none" },
                c = { fg = dark_bg, bg = C.color3, gui = "none" },
                x = { fg = dark_bg, bg = C.color3, gui = "none" },
                y = { fg = C.foreground, bg = C.color0, gui = "none" },
                z = { fg = dark_bg, bg = C.color6, gui = "none" },
              },
              insert = {
                a = { fg = dark_bg, bg = C.color2, gui = "none" },
                z = { fg = dark_bg, bg = C.color2, gui = "none" },
              },
              visual = {
                a = { fg = dark_bg, bg = C.color5, gui = "none" },
                z = { fg = dark_bg, bg = C.color5, gui = "none" },
              },
              replace = {
                a = { fg = dark_bg, bg = C.color1, gui = "none" },
                z = { fg = dark_bg, bg = C.color1, gui = "none" },
              },
              command = {
                a = { fg = dark_bg, bg = C.color3, gui = "none" },
                z = { fg = dark_bg, bg = C.color3, gui = "none" },
              },
              inactive = {
                a = { fg = C.color8, bg = "NONE", gui = "none" },
                b = { fg = C.color8, bg = "NONE", gui = "none" },
                c = { fg = C.color8, bg = "NONE", gui = "none" },
              },
            }
          end
        end
        return lualine_theme
      end

      local function build_opts()
        return {
          options = {
            theme = build_theme(),
            component_separators = "",
            disabled_filetypes = { "alpha", "Outline" },
          },
          sections = {
            lualine_a = {
              {
                "mode",
              },
            },
            lualine_b = {
              {
                "diagnostics",
                symbols = { error = " ", warning = " ", info = " ", hint = " " },
                update_in_insert = true,
                always_visible = true,
              },
            },
            lualine_c = {
              "filename",
            },
            lualine_x = {
              {
                function()
                  local bufnr = vim.api.nvim_get_current_buf()

                  local clients = vim.lsp.get_clients()
                  if next(clients) == nil then
                    return ""
                  end

                  local c = {}
                  for _, client in pairs(clients) do
                    table.insert(c, client.name)
                  end
                  return " " .. table.concat(c, " | ")
                end,
              },
            },
            lualine_y = {
              {
                "branch",
                icons_enabled = false,
              },
              {
                "diff",
                colored = true,
                symbols = { added = " ", modified = " ", removed = " " },
              },
            },
            lualine_z = {
              { "location" },
            },
          },
          inactive_sections = {
            lualine_a = { "filename" },
            lualine_b = { "" },
            lualine_c = { "" },
            lualine_x = { "" },
            lualine_y = { "" },
            lualine_z = { "location" },
          },
        }
      end

      require("lualine").setup(build_opts())
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*neopywal*",
        callback = function()
          vim.schedule(function()
            require("lualine").setup(build_opts())
          end)
        end
      })
    end,
   },
  -- vim-tmux-navigator
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateRight",
      "TmuxNavigateUp",
      "TmuxNavigateDown",
      "TmuxNavigatePrevious",
      "TmuxNavigateProcessList",
    },

    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Navigate to left pane" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Navigate to lower pane" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Navigate to upper pane" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Navigate to right pane" },
      { "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Navigate to previous pane" },
    },
  },
}
