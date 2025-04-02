vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

require 'core.options'
require 'core.keymaps'
require 'core.autocmds'
require 'config.lazy'

vim.lsp.enable { 'luals', 'pyright' }
vim.diagnostic.config { virtual_lines = true }
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

