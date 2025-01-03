require "kickstart"
require "config"

require("lazy").setup({
    {import = "kickstart.kickstart.plugins.default"},
    -- {import = "kickstart.kickstart.plugins"}, 
    {import = "plugins"}
}, {{import = "kickstart.ui"}})

local nvim_lsp = require('lspconfig')
nvim_lsp.denols.setup {
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
}

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("package.json"),
  single_file_support = false
}
