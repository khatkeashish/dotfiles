-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Smart 'd': preserve `dd`, black-hole motion deletes like `dw`, `di"`, etc.
-- vim.keymap.set("n", "d", function()
--   local key = vim.fn.getcharstr()
--   if key == "d" or key == "\n" then
--     -- Allow dd or d<Enter> to use normal yank behavior
--     return ""
--   else
--     -- Use black hole register for everything else
--     return '"_d' .. key
--   end
-- end, { expr = true, noremap = true, desc = "Smart d (preserve dd)" })
--
-- -- Always black hole 'x'
-- vim.keymap.set("n", "x", '"_x', { desc = "x without yank" })

-- -- Optional: visual mode deletes also to black hole
-- vim.keymap.set("v", "d", '"_d', { desc = "Visual delete without yank" })
-- vim.keymap.set("v", "x", '"_x', { desc = "Visual x without yank" })
--

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

-- vim.keymap.set("n", "<M-h>", "<cmd>silent !tmux neww tmux-sessionizer -s 0<CR>")
-- vim.keymap.set("n", "<M-t>", "<cmd>silent !tmux neww tmux-sessionizer -s 1<CR>")
-- vim.keymap.set("n", "<M-n>", "<cmd>silent !tmux neww tmux-sessionizer -s 2<CR>")
-- vim.keymap.set("n", "<M-s>", "<cmd>silent !tmux neww tmux-sessionizer -s 3<CR>")

vim.keymap.set("n", "<C-s>", function()
  if not os.getenv("TMUX") then
    vim.notify("Not inside tmux", vim.log.levels.WARN)
    return
  end
  local sh = [[
    session=$(tmux list-sessions -F '#S' | sort | uniq | \
      fzf --height 40% --reverse --border --prompt '⚡  ')
    [ -n "$session" ] && exec tmux switch-client -t "$session" || true
  ]]
  vim.fn.jobstart({ "tmux", "new-window", "zsh", "-lc", sh }, { detach = true })
end, { desc = "tmux: pick session (new window)" })
