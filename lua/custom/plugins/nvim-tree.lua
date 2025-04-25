return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local nvim_tree = require 'nvim-tree'
    local api = require 'nvim-tree.api'

    nvim_tree.setup {
      view = {
        side = 'left',
      },
      on_attach = function(bufnr)
        local function opts(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        api.config.mappings.default_on_attach(bufnr)

        -- Custom mappings
        vim.keymap.set('n', 'l', api.node.open.edit, opts 'Open')
        vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts 'Close Directory')
        vim.keymap.set('n', 'v', api.node.open.vertical, opts 'Open: Vertical Split')
      end,
    }

    -- Global keymap for <leader>e to toggle tree
    vim.keymap.set('n', '<leader>e', function()
      api.tree.toggle { find_file = true, focus = true }
    end, { desc = 'Toggle NvimTree' })

    -- Defer the subscription to avoid setup-time errors
    vim.schedule(function()
      api.events.subscribe(api.events.Event.FileOpened, function()
        api.tree.close()
      end)
    end)
  end,
}
