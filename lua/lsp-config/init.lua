require("mason").setup()
require("mason-lspconfig").setup()

   local lspconfig = require 'lspconfig'
   local configs = require 'lspconfig.configs'

   -- -- Check if the config is already defined (useful when reloading this file)
   -- if not configs.lua_ls then
   --   configs.lua_ls = {
   --     default_config = {
   --       cmd = {'/home/neovim/lua-language-server/run.sh'};
   --       filetypes = {'lua'};
   --       root_dir = function(fname)
   --         return lspconfig.util.find_git_ancestor(fname)
   --       end;
   --       settings = {};
   --     };
   --   }
   -- end

   local function lspSymbol(name, icon)
      local hl = "DiagnosticSign" .. name
      vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
   end

   lspSymbol("Error", " ")
   lspSymbol("Info", "")
   lspSymbol("Hint", "")
   lspSymbol("Warn", "")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
severity_sort = true
}
)

   vim.diagnostic.config {
      virtual_text = {
         prefix = "",
      },
      signs = true,
      underline = true,
      update_in_insert = false,
   }

   vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "single",
   })
   vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "single",
   })

-- vim.api.nvim_exec(
-- [[
--     highlight DiagnosticSignHimt guibg=bg 
--     highlight DiagnosticSignInfo guibg=bg 
--     highlight DiagnosticSignWarn guibg=bg 
--     highlight DiagnosticSignError guibg=bg 
-- ]], false)

