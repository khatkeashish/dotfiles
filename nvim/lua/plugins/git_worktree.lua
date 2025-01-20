return {
  {
    "ThePrimeagen/git-worktree.nvim",
    -- "polarmutex/git-worktree.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    enabled = true,
    opts = {
      change_directory_command = "cd",
      update_on_change = true,
      update_on_change_command = "e .",
      clearjumps_on_change = true,
      autopush = false,
    },
    keys = {
      -- add a keymap to browse plugin files
      {
        "<leader>zc",
        function()
          require("telescope").extensions.git_worktree.create_git_worktree()
        end,
        desc = "Create git worktree",
      },
      {
        "<leader>zl",
        function()
          require("telescope").extensions.git_worktree.git_worktrees()
        end,
        desc = "Show, switch, delete git worktree",
      },
    },
  },
}
