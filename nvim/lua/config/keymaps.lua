-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "d", function()
  local key = vim.fn.getcharstr()
  if key == "d" or key == "\n" then
    -- Explicitly call the normal dd or d<CR>
    return "d" .. key
  else
    return '"_d' .. key
  end
end, { expr = true, noremap = true, desc = "Smart d (preserve dd)" })

-- Insert mode: Map jj to escape
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode" })

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<C-s>", "<cmd>silent !tmux neww tmux-pick<CR>")
