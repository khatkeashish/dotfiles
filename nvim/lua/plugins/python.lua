return {
  -- Disable automatic dap installation
  { "jay-babu/mason-nvim-dap.nvim", enabled = false },

  -- Use local venv Python for debugging
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
    },
    config = function()
      local dap_python = require("dap-python")
      -- Use the "python" from your local venv
      dap_python.setup("python")
      dap_python.test_runner = "pytest" -- optional: if you use pytest
    end,
  },

  -- Venv selector (optional)
  {
    "linux-cultist/venv-selector.nvim",
    enabled = true,
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
    opts = {},
    event = "VeryLazy",
    keys = {
      { "<leader>vs", "<cmd>VenvSelect<cr>" },
      { "<leader>vc", "<cmd>VenvSelectCached<cr>" },
    },
  },

  -- Linting/formatting
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "mypy", "ruff" })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        python = { "mypy" },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["python"] = { "ruff_fix", "ruff_format" },
      },
    },
  },
}
