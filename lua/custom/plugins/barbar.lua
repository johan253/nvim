local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<leader>w', '<Cmd>w<CR>', { desc = '[W]rite Buffer', noremap = true, silent = true })
map('n', '<leader>c', '<Cmd>BufferClose<CR>', { desc = '[C]lose Buffer', noremap = true, silent = true })
map('n', '<leader>C', '<Cmd>BufferClose!<CR>', { desc = '[!]Force [C]lose Buffer', noremap = true, silent = true })
map('n', '<leader>q', '<Cmd>q<CR>', { desc = '[Q]uit', noremap = true, silent = true })

return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = true
  end,
  opts = {
    -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
    -- animation = true,
    -- insert_at_start = true,
    -- …etc.
  },
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
