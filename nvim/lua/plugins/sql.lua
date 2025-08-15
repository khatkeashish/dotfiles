return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    opts.formatters_by_ft = opts.formatters_by_ft or {}
    opts.formatters_by_ft.sql = { "sql_formatter" } -- or "pg_format"

    opts.formatters = vim.tbl_extend("force", opts.formatters or {}, {
      sql_formatter = {
        command = "sql-formatter",
        args = { "--config", vim.fn.stdpath("config") .. "/lua/plugins/sql-formatter.json" },
      },
      pg_format = {
        command = "pg_format",
        args = { "-" }, -- reads from stdin
      },
    })
  end,
}
