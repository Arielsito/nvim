return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = {
        "c",
        "cpp",
        "python",
        "html",
        "css",
        "javascript",
        "lua",
        "vim",
        "vimdoc",
        "query",
      },
      auto_install = true,
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      callback = function(args)
        local ft = vim.bo[args.buf].filetype
        local lang = vim.treesitter.language.get_lang(ft)
        if lang and vim.treesitter.language.add(lang) then
          vim.treesitter.start(args.buf, lang)
        end
      end
    })
  end
}
