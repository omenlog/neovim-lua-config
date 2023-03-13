local status_ok, ls = pcall(require, "luasnip")

if not status_ok then 
    print "lua snippets not installed"
    return
end

local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.config.set_config = {
    history = true,
    enable_autosnippets = true
}

-- set keybinds for both INSERT and VISUAL.
require("user.plugins.snippets.javascript").setup()
require("user.plugins.snippets.typescript").setup()

