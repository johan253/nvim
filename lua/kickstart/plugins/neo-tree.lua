-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<leader>e', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  lazy = false,
  opts = {
    filesystem = {
      hijack_netrw_behavior = 'open_current',
      use_libuv_file_watcher = false,
      window = {
        mappings = {
          ['<leader>e'] = 'close_window',
          ['l'] = 'open',
          ['e'] = 'expand_all_subnodes',
        },
      },
    },
    event_handlers = {
      {
        event = 'file_open_requested',
        handler = function()
          require('neo-tree.command').execute { action = 'close' }
        end,
      },
    },
  },
}
