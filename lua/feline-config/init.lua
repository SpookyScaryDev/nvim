local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')

local force_inactive = {
  filetypes = {},
  buftypes = {},
  bufnames = {}
}

local disable = {
  filetypes = {},
  buftypes = {},
  bufnames = {}
}

local components = {
  active = { {}, {}, {} },
  inactive = { {}, {}, {} },
}

local colors = {
  bg = '#1D2021',
  black = '#1d2021',
  yellow = '#d8a657',
  cyan = '#89b482',
  oceanblue = '#45707a',
  green = '#a9b665',
  orange = '#e78a4e',
  violet = '#d3869b',
  magenta = '#c14a4a',
  white = '#a89984',
  fg = '#a89984',
  skyblue = '#7daea3',
  red = '#ea6962',
}

local vi_mode_colors = {
  NORMAL = 'green',
  OP = 'green',
  INSERT = 'red',
  CONFIRM = 'red',
  VISUAL = 'skyblue',
  LINES = 'skyblue',
  BLOCK = 'skyblue',
  REPLACE = 'violet',
  ['V-REPLACE'] = 'violet',
  ENTER = 'cyan',
  MORE = 'cyan',
  SELECT = 'orange',
  COMMAND = 'green',
  SHELL = 'green',
  TERM = 'green',
  NONE = 'yellow'
}
 
local vi_mode_text = {
  NORMAL = '<|',
  OP = '<|',
  INSERT = '|>',
  VISUAL = '<>',
  LINES = '<>',
  BLOCK = '<>',
  REPLACE = '<>',
  ['V-REPLACE'] = '<>',
  ENTER = '<>',
  MORE = '<>',
  SELECT = '<>',
  COMMAND = '<|',
  SHELL = '<|',
  TERM = '<|',
  NONE = '<>',
  CONFIRM = '|>'
}

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

force_inactive.filetypes = {
  'dbui',
  'packer',
  'startify',
  'fugitive',
  'fugitiveblame',
  'NvimTree',
}

disable.filetypes = {
  }

force_inactive.buftypes = {
  'terminal'
}

-- LEFT

-- vi-mode
components.active[1] = { {
  provider = function()
    return ' ' .. vi_mode_utils.get_vim_mode() .. ' '
  end,
  hl = function()
    local val = {}

    val.bg = bg
    val.fg = vi_mode_utils.get_mode_color()
    val.style = 'bold'

    return val
  end,
  right_sep = ' '
},
{
  provider = 'git_branch',
  hl = {
    fg = 'yellow',
    bg = 'bg',
    style = 'bold'
  },
  right_sep = {
    str = '  ',
  }
},
-- filename
{
  provider = 'file_info',
  hl = {
    fg = 'white',
    bg = 'bg',
    style = 'bold'
  },
  right_sep = {
    str = '  ',
  }
},


-- MID

-- gitBranch
-- diffAdd
--{
--  provider = 'git_diff_added',
--  hl = {
--    fg = 'green',
--    bg = 'bg',
--    style = 'bold'
--  }
--},
---- diffModfified
--{
--  provider = 'git_diff_changed',
--  hl = {
--    fg = 'orange',
--    bg = 'bg',
--    style = 'bold'
--  }
--},
---- diffRemove
--{
--  provider = 'git_diff_removed',
--  hl = {
--    fg = 'red',
--    bg = 'bg',
--    style = 'bold'
--  },
--},
-- diagnosticErrors
{
  provider = 'diagnostic_errors',
  enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.ERROR) end,
  hl = {
    fg = 'red',
    style = 'bold'
  }
},
-- diagnosticWarn
{
  provider = 'diagnostic_warnings',
  enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.WARN) end,
  hl = {
    fg = 'yellow',
    style = 'bold'
  }
},
-- diagnosticHint
{
  provider = 'diagnostic_hints',
  enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.HINT) end,
  hl = {
    fg = 'cyan',
    style = 'bold'
  }
},
-- diagnosticInfo
{
  provider = 'diagnostic_info',
  enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.INFO) end,
  hl = {
    fg = 'skyblue',
    style = 'bold'
  }
}
}
-- RIGHT

-- LspName
components.active[3] = {{
  provider = 'lsp_client_names',
  hl = {
    fg = 'yellow',
    bg = 'bg',
    style = 'bold'
  },
  right_sep = ' '
},
-- fileIcon
{
  provider = function()
    local filename = vim.fn.expand('%:t')
    local extension = vim.fn.expand('%:e')
    local icon  = require'nvim-web-devicons'.get_icon(filename, extension)
    if icon == nil then
      icon = ' '
    end
    return icon
  end,
  hl = function()
    local val = {}
    local filename = vim.fn.expand('%:t')
    local extension = vim.fn.expand('%:e')
    local icon, name  = require'nvim-web-devicons'.get_icon(filename, extension)
    if icon ~= nil then
      val.fg = vim.fn.synIDattr(vim.fn.hlID(name), 'fg')
    else
      val.fg = 'white'
    end
    --val.bg = 'bg'
    --val.style = 'bold'
    return val
  end,
  right_sep = ' '
},
-- fileType
{
  provider = 'file_type',
  hl = function()
    local val = {}
    local filename = vim.fn.expand('%:t')
    local extension = vim.fn.expand('%:e')
    local icon, name  = require'nvim-web-devicons'.get_icon(filename, extension)
    if icon ~= nil then
      val.fg = vim.fn.synIDattr(vim.fn.hlID(name), 'fg')
    else
      val.fg = 'white'
    end
    val.bg = 'bg'
    val.style = 'bold'
    return val
  end,
  right_sep = ' '
},
-- fileSize
{
  provider = 'file_size',
  enabled = function() return vim.fn.getfsize(vim.fn.expand('%:t')) > 0 end,
  hl = {
    fg = 'skyblue',
    bg = 'bg',
    style = 'bold'
  },
  right_sep = ' '
},
-- fileFormat
{
  provider = function() return '' .. vim.bo.fileformat:upper() .. '' end,
  hl = {
    fg = 'orange',
    bg = 'bg',
    style = 'bold'
  },
  right_sep = ' '
},
-- fileEncode
{
  provider = 'file_encoding',
  hl = {
    fg = 'violet',
    bg = 'bg',
    style = 'bold'
  },
  right_sep = ' '
},
-- RVMrubyVersion
-- components.active[3][7] = {
--   provider = function()
--     return ' '..vim.fn['rvm#string']()
--   end,
--   hl = {
--     fg = 'red',
--     bg = 'bg',
--     style = 'bold'
--   },
--   right_sep = ' '
-- }
-- lineInfo
--{
--  provider = 'position',
--  hl = {
--    fg = 'white',
--    bg = 'bg',
--    style = 'bold'
--  },
--  right_sep = ' '
--},
-- linePercent
{
  provider = 'line_percentage',
  hl = {
    fg = 'skyblue',
    bg = 'bg',
    style = 'bold'
  },
  right_sep = ' '
},
-- scrollBar
{
  provider = 'scroll_bar',
  hl = {
    fg = 'skyblue',
    bg = 'bg',
  },
  right_sep = ' '
}
}

-- INACTIVE

-- fileType
components.inactive[1] = { {
  provider = 'file_type',
  hl = {
    fg = 'black',
    bg = 'cyan',
    style = 'bold'
  },
  left_sep = {
    str = ' ',
    hl = {
      fg = 'NONE',
      bg = 'cyan'
    }
  },
  right_sep = {
    {
      str = ' ',
      hl = {
        fg = 'NONE',
        bg = 'cyan'
      }
    },
    ' '
  }
}
}

components.inactive = components.active
require('feline').setup({
  theme = colors,
  default_bg = bg,
  default_fg = fg,
  vi_mode_colors = vi_mode_colors,
  components = components,
  force_inactive = force_inactive,
  disable = disable,
})
