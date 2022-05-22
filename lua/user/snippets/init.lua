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

require("user.snippets.javascript").setup()
require("user.snippets.typescript").setup()

