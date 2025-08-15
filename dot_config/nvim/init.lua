require("kickstart")
require("config")

if vim.g.vscode then
   require("user.vscode_keymaps")
end

require("lazy").setup({
   { import = "kickstart.kickstart.plugins.default" },
   { import = "kickstart.kickstart.plugins" },
   { import = "plugins" },
}, { { import = "kickstart.ui" } })
