return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = false,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    keys = {
      {
        "<leader>bt",
        function()
          local conf = require("tokyonight.config")
          conf.options.transparent = not conf.options.transparent
          require("tokyonight").setup(conf.options)
          vim.cmd("colorscheme tokyonight")
        end,
        desc = "Toggle background transparency",
      },
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
    end
  },
  {
    "RedsXDD/neopywal.nvim",
    name = "neopywal",
    lazy = false,
    priority = 1000,
    config = function()
      local wal_cache = vim.fn.expand("~/.cache/wal/colors.json")
      local has_wal = vim.fn.filereadable(wal_cache) == 1

      local applied_neopywal = false

      if has_wal then
        local ok = pcall(function()
          require("neopywal").setup({
            transparent_background = true,
            no_bold = true,
          })
          vim.cmd.colorscheme("neopywal")
        end)
        applied_neopywal = ok
      end

      if not applied_neopywal then
        vim.cmd.colorscheme("tokyonight")
      end
    end,
  },
}
