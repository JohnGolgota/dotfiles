return {
  "simrat39/rust-tools.nvim",
  "evanleck/vim-svelte",
  'nvim-lua/plenary.nvim',
  'nvim-pack/nvim-spectre',
  -- {
  --   "github/copilot.vim",
  --   config = function()
  --     vim.keymap.set('i', '<Tab>', 'copilot#Accept("\\<CR>")', {
  --       expr = true,
  --       replace_keycodes = false
  --     })
  --     vim.keymap.set('i', '<tab>', 'copilot#Accept("\\<CR>")', {
  --       expr = true,
  --       replace_keycodes = false
  --     })

  --     vim.g.copilot_no_tab_map = false
  --   end,
  -- },
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        ketmaps = {
          accept_suggestion = "<Tab>",
          clear_suggestion = "<C-]>",
          accept_word = "<C-j>",
        },
      })
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    priority = 1000,
    config = function()
      require("nightfox").setup({
        options = {
          transparent = true,
          terminal_colors = true,
        },
      })
    end,
    init = function()
      vim.cmd.colorscheme "carbonfox"
    end,
  },
}
