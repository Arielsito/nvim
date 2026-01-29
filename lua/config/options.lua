vim.g.mapleader = " "
vim.g.maplocalleader = " "

local options = {
  encoding = "utf-8",
  fileencoding = "utf-8",
  number = true,
  relativenumber = true,
  title = true,
  autoindent = true,
  smartindent = true,
  hlsearch = true,
  backup = false,
  showcmd = true,
  cmdheight = 1,
  laststatus = 3,
  expandtab = true,
  scrolloff = 10,
  backupskip = { "/tmp/*", "/private/tmp/*", "$TEMP/*" },
  inccommand = "split",
  ignorecase = true,
  smarttab = true,
  breakindent = true,
  shiftwidth = 2,
  tabstop = 2,
  wrap = false,
  backspace = { "start", "eol", "indent" },
  splitbelow = true,
  splitright = true,
  splitkeep = "cursor",
  mouse = "",
  termguicolors = true,
  guifont = "Iosevka Nerd Font:h12",
  clipboard = "unnamedplus",
}

for key, value in pairs(options) do
	vim.opt[key] = value
end

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
