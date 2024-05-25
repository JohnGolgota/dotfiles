return {
  "simrat39/rust-tools.nvim",
  "evanleck/vim-svelte",
  'nvim-lua/plenary.nvim',
'nvim-pack/nvim-spectre',
  {
    "github/copilot.vim",
    config = function()
      vim.keymap.set('i', '<Tab>', 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false
      })
      vim.keymap.set('i', '<tab>', 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false
      })

      vim.g.copilot_no_tab_map = false
    end,
  },
}
