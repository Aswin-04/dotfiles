return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'master', 
  lazy = false, 
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs").setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
      highlight = { enable = true },
      indent = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
      auto_install = { enable = true },
    })
  end

}
