local telescope = require('telescope')

  telescope.setup{
    defaults = {
      layout_config = {
        prompt_position = 'top',
      },
      prompt_prefix = '  ',
      sorting_strategy = 'ascending',
    },
    pickers = {
      find_files = {
        find_command = {'rg', '--files', '--hidden', '-g', '!.git'},
        layout_config = {
          height = 0.70
        }
      },
      -- buffers = {
      --   show_all_buffers = true
      -- },
      -- live_grep = {
      --   previewer = false,
      --   theme = "dropdown"
      -- },
      git_status = {
        git_icons = {
          added = " ",
          changed = " ",
          copied = " ",
          deleted = " ",
          renamed = "➡",
          unmerged = " ",
          untracked = " ",
        },
        previewer = false,
        theme = "dropdown"
      }
  }
}


local builtin = require('telescope.builtin')

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
-- pcall(require('telescope').load_extension, 'project')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- telescope git commands (not on youtube nvim video)
vim.keymap.set("n", "<leader>gc", require('telescope.builtin').git_commits, { desc = '[g]it [c]ommits' })
vim.keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
vim.keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
vim.keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- zoxide
vim.keymap.set("n", "<leader>cd", require("telescope").extensions.zoxide.list)
