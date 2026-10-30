local theme_file = vim.fn.stdpath("data") .. "/theme.lua"
return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = true,
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    lazy = false,
    config = true,
  },
  {
    "RedsXDD/neopywal.nvim",
    name = "neopywal",
    lazy = false,
    priority = 1000,
    config = function()
      local wal_cache = vim.fn.expand("~/.cache/wal/colors.json")
      if vim.fn.filereadable(wal_cache) == 1 then
        pcall(function()
          require("neopywal").setup({
            transparent_background = true,
            no_bold = true,
          })
        end)
      end
    end,
  },
}
