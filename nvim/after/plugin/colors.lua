
---------------- Theme setup ----------------
-- Set colorscheme
-- vim.cmd [[colorscheme onedark]]


---------------- rosepine
require('rose-pine').setup({
    disable_background = true
})
function ColorMyPencils(color) 
	color = color or "rose-pine" 
	vim.cmd.colorscheme(color)
    vim.o.termguicolors = true

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMyPencils()



---------------- lualine setup ----------------
-- Set lualine as statusline
-- See `:help lualine.txt`
require('lualine').setup {
    options = {
      icons_enabled = false,
      theme = 'rose-pine',
    --   theme = 'onedark',
      component_separators = '|',
      section_separators = '',
    },
  }