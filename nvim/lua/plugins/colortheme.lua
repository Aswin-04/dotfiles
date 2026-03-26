local function enable_transparency()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end

return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,

    config = function() 
      require("tokyonight").setup({
        transparent = true, -- removes background
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      })
      enable_transparency()
      vim.cmd.colorscheme "tokyonight"
    end
  },
}
