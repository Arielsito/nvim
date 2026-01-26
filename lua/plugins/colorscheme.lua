return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "night",
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
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
