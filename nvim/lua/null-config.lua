local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    require("null-ls").builtins.formatting.prettier,
    -- require("null-ls").builtins.diagnostics.eslint,
  },
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then

      -- format on save
      vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
    end

    -- if client.server_capabilities.documentRangeFormattingProvider then
    --   vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
    -- end
  end,
})
-- local prettier = require("prettier")
--
-- prettier.setup({
--   bin = 'prettier', -- or `'prettierd'` (v0.22+)
--   filetypes = {
--     "css",
--     "graphql",
--     "html",
--     "javascript",
--     "javascriptreact",
--     "json",
--     "less",
--     "markdown",
--     "scss",
--     "typescript",
--     "typescriptreact",
--     "yaml",
--   },
--   ["null-ls"] = {
--     condition = function()
--       return prettier.config_exists({
--         -- if `true`, checks `package.json` for `"prettier"` key
--         check_package_json = false,
--       })
--     end,
--     runtime_condition = function(params)
--       -- return false to skip running prettier
--       return true
--     end,
--     timeout = 5000,
--   }
-- })
