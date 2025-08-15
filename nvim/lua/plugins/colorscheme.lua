return {
  -- {
  --    "catppuccin/nvim",
  --    name = "catppuccin",
  --    lazy = false,
  --    priority = 1000,
  --    opts = {
  --      flavour = "mocha", -- latte, frappe, macchiato, mocha
  --    },
  --    config = function(_, opts)
  --      require("catppuccin").setup(opts)
  --      vim.cmd.colorscheme("catppuccin")
  --    end,
  --  },

  -- { "ellisonleao/gruvbox.nvim" },
  { "rose-pine/neovim", name = "rose-pine" },
  -- { "rebelot/kanagawa.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox",
      colorscheme = "rose-pine",
      -- colorscheme = "kanagawa-wave",
      -- colorscheme = "kanagawa-dragon",
      -- colorscheme = "kanagawa-lotus",
    },
  },
}
