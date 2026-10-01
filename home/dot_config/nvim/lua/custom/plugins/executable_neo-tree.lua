-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree toggle<CR>', desc = 'Toggle NeoTree ', silent = true },
  },
  opts = {
    git_status_async_options = {
      batch_size = 1000,
      batch_delay = 10,
      max_lines = 10000,
    },
    filesystem = {
      follow_current_file = {
        enabled = true,
      },
      filtered_items = {
        visible = true,
        never_show = { '.git', 'venv', '.venv', '__pycache__' },
      },
      window = {
        width = 24,
        mappings = {
          ['\\'] = 'close_window',
          -- ['<Tab>'] = 'expand_all_nodes',
          ['<S-Tab>'] = 'close_all_nodes',
          ['E'] = 'expand_all_subnodes',
        },
      },
    },
  },
}
