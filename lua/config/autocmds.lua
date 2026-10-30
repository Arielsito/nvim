-- Turn off paste mode when leaving insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Persistent colorscheme
local theme_file = vim.fn.stdpath("data") .. "/theme.lua"

if vim.fn.filereadable(theme_file) == 1 then
  dofile(theme_file)
else
  vim.cmd.colorscheme("gruvbox")
end
-- load saved theme if it exists
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function(args)
    local file = io.open(theme_file, "w")
    if file then
      file:write(string.format("vim.cmd.colorscheme('%s')", args.match))
      file:close()
    end
  end,
})
