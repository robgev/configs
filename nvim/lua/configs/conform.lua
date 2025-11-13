local options = {
  formatters = {
    prettierd = {
      require_cwd = true,

      cwd = require("conform.util").root_file {
        ".prettierrc",
        ".prettierrc.json",
        ".prettierrc.yml",
        ".prettierrc.yaml",
        ".prettierrc.json5",
        ".prettierrc.js",
        ".prettierrc.cjs",
        ".prettierrc.mjs",
        ".prettierrc.toml",
        "prettier.config.js",
        "prettier.config.cjs",
        "prettier.config.mjs",
      },
    },
  },
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettierd" },
    html = { "prettierd" },
    javascript = { "eslint_d", "prettierd" },
    javascriptreact = { "prettierd", "eslint_d" },
    typescriptreact = { "prettierd", "eslint_d" },
    typescript = { "prettierd", "eslint_d" },
    python = { "ruff", "black" },
    ruby = { "rubocop" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    -- timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
