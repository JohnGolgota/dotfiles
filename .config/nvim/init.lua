require "kickstart"
require "config"

require("lazy").setup({
    {import = "kickstart.kickstart.plugins.default"},
    -- {import = "kickstart.kickstart.plugins"}, 
    {import = "plugins"}
}, {{import = "kickstart.ui"}})
