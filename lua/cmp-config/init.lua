  -- Setup nvim-cmp.cmp
  local cmp = require'cmp'

vim.opt.completeopt = "menuone,noselect"

local function border(hl_name)
   return {
      { "╭", hl_name },
      { "─", hl_name },
      { "╮", hl_name },
      { "│", hl_name },
      { "╯", hl_name },
      { "─", hl_name },
      { "╰", hl_name },
      { "│", hl_name },
   }
end

local cmp_window = require "cmp.utils.window"

function cmp_window:has_scrollbar()
   return false
end

  cmp.setup({
    -- snippet = {
    --   -- REQUIRED - you must specify a snippet engine
    --   expand = function(args)
    --     vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    --     -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    --     -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
    --     -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    --   end,
    -- },
   window = {
      completion = {
         border = border "CmpBorder",
      },
      documentation = {
         border = border "CmpDocBorder",
      },
   },
--   formatting = {
--      format = function(_, vim_item)
--         local icons = require "lspkind"
--         vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
--
--         return vim_item
--      end,
--   },
   mapping = {
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm {
         behavior = cmp.ConfirmBehavior.Replace,
         select = true,
      },
      ["<Tab>"] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.select_next_item()
         -- elseif require("luasnip").expand_or_jumpable() then
         --    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
         else
            fallback()
         end
      end, {
         "i",
         "s",
      }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.select_prev_item()
         --elseif require("luasnip").jumpable(-1) then
         --   vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
         else
            fallback()
         end
      end, {
         "i",
         "s",
      }),
   },
   sources = {
     -- { name = "nvim_lsp" },
     -- { name = "luasnip" },
      { name = "buffer" },
      { name = "nvim_lua" },
      { name = "path" },
   },
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
  -- Setup lspconfig.
--   local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- --   -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- --   require('lspconfig')["lua_ls"].setup {
-- --     capabilities = capabilities
-- --   }
-- --   require('lspconfig')["emmet_ls"].setup {
-- --     capabilities = capabilities
-- --   }
-- --   require('lspconfig')["clangd"].setup {
-- --     capabilities = capabilities
-- --   }
-- --   require('lspconfig')["tsserver"].setup {
-- --     capabilities = capabilities
-- --   }
-- 
-- local language_servers = {'lua_ls', 'clangd', 'emmet_ls', 'tsserver', 'cssls' }
-- for _, ls in pairs(language_servers) do
--     require('lspconfig')[ls].setup {
--         capabilities = capabilities
--         -- you can add other fields for setting up lsp server in this table
--     }
-- end
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
vim.api.nvim_exec(
[[
    highlight PMenu guibg=bg
    highlight CmpBorder guifg=#83a598
]], false)
