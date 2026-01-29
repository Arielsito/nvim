return {
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
    vim.cmd.colorscheme("tokyonight")
  end
  -- Dynamic colorscheme based on wallpaper
  -- "uZer/pywal16.nvim",
  -- config = function()
  --   vim.cmd.colorscheme("pywal16")
  -- end
}
