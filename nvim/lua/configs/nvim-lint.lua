local lint = require("lint");

lint.linters_by_ft = {
  javascript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  typescript = { "eslint_d" },
  json = { "jsonlint" },
  markdown = { "vale" },
  rst = { "vale" },
}

return lint
