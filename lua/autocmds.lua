-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('User', {
  desc = 'Install other treesitter parsers',
  pattern = 'TSUpdate',
  callback = function()
    local parsers = require 'nvim-treesitter.parsers'
    parsers.koka = require 'koka.treesitter'
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Treat blade templates as html',
  pattern = 'blade',
  callback = function()
    vim.bo.filetype = 'html'
  end,
})
