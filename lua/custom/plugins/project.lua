return {
  'DrKJeff16/project.nvim',
  dependencies = { -- OPTIONAL
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'ibhagwan/fzf-lua',
  },
  opts = {},
  config = function()
    require('project').setup()

    require('telescope').setup {
      extensions = {
        projects = {
          prompt_prefix = '󱎸  ',
          layout_strategy = 'horizontal',
          layout_config = {
            anchor = 'N',
            height = 0.25,
            width = 0.6,
            prompt_position = 'bottom',
          },
        },
      },
    }
  end,
}
