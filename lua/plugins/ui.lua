return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.config
    opts = {
      bigfile = { enabled = true },
      quickfile = { enabled = true },
    },
  },
  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
			options = {
				theme = "tokyonight",
				component_separators = "",
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "Outline" },
			},

			sections = {
				lualine_a = {
					{
						"mode",
						separator = { left = "", right = "" },
						icon = "󰏒",
					},
				},
				lualine_b = {
					{
						"filetype",
						icons_only = true,
						padding = { left = 1, right = 0 },
					},
					"filename",
				},
				lualine_c = {
					{
						"branch",
						icon = "",
					},
					{
						"diff",
						colored = true,
						symbols = { added = " ", modified = " ", removed = " " },
					},
				},
				lualine_x = {
					{
						"diagnostics",
						symbols = { error = " ", warning = " ", info = " ", hint = " " },
						update_in_insert = true,
					},
				},
				lualine_y = {
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
							return " " .. table.concat(c, " | ")
						end,
					},
				},
				lualine_z = {
					{ "location", separator = { left = "", right = "" }, icon = "" },
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
		},
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
