local nvim_lsp = require('lspconfig')
local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()

-- Only let null-ls format my files
local null_ls_format = function(bufnr)
  vim.lsp.buf.format({
    bufnr = bufnr,
    filter = function(client) return client.name == "null-ls" end,
  })
end


local custom_attach = function(client, bufnr)
  -- use omnifunc
  vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
  vim.bo[bufnr].formatexpr = "v:lua.vim.lsp.formatexpr"

  -- all formatting done by null-ls
  local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup,
    buffer = bufnr,
    callback = function() null_ls_format(bufnr) end,
  })
end


nvim_lsp.tsserver.setup {
  on_attach = custom_attach
}

nvim_lsp.pyright.setup{}



nvim_lsp.vuels.setup({
  on_attach = custom_attach,
  settings = {
    vetur = {
      completion = {
        autoImport = true,
        tagCasing = "kebab",
        useScaffoldSnippets = true,
      },
      useWorkspaceDependencies = true,
      experimental = {
        templateInterpolationService = true,
      },
    },
    format = {
      enable = true,
      options = {
        useTabs = false,
        tabSize = 2,
      },
      defaultFormatter = {
        ts = "prettier",
      },
      scriptInitialIndent = false,
      styleInitialIndent = false,
    },
    validation = {
      template = true,
      script = true,
      style = true,
      templateProps = true,
      interpolation = true,
    },
  },
})


local null_ls = require("null-ls")
null_ls.setup({
  on_attach = custom_attach,
  sources = {
    --#formatters
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.eslint_d,

    --#diagnostics/linters
    -- DOESNT WORK?? LITNS TS AS JS
    -- null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.diagnostics.flake8,

    --#code actions
    null_ls.builtins.code_actions.eslint_d,
  },
})



-- nvim_lsp.diagnosticls.setup {
--   on_attach = on_attach,
--   filetypes = { 'javascript', 'json', 'typescript', 'cs$', 'less', 'scss', 'markdown', 'vuels', 'html' },
--   init_options = {
--     linters = {
--       eslint = {
--         command = 'eslint_d',
--         rootPatterns = { '.git' },
--         debounce = 100,
--         args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
--         sourceName = 'eslint_d',
--         parseJson = {
--           errorsRoot = '[0].messages',
--           line = 'line',
--           column = 'column',
--           endLine = 'endLine',
--           endColumn = 'endColumn',
--           message = '[eslint] ${message} [${ruleId}]',
--           security = 'severity'
--         },
--         securities = {
--           [2] = 'error',
--           [1] = 'warning'
--         }
--       },
--     },
--     filetypes = {
--       javascript = 'eslint',
--       javascriptreact = 'eslint',
--       typescript = 'eslint',
--       typescriptreact = 'eslint',
--     },
--     formatters = {
--       prettier = {
--         command = 'prettier',
--         args = { '--stdin-filepath', '%filename' }
--       }
--     },
--     formatFiletypes = {
--       css = 'prettier',
--       javascript = 'eslint_d',
--       javascriptreact = 'eslint_d',
--       json = 'prettier',
--       scss = 'prettier',
--       less = 'prettier',
--       typescript = 'eslint_d',
--       typescriptreact = 'eslint_d',
--       json = 'prettier',
--       markdown = 'prettier',
--     }
--   }
-- }

-- icon
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
  }
)
