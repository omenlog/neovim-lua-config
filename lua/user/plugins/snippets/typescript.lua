local js = require("user.plugins.snippets.javascript")
local utils = require("user.plugins.snippets.utils")
local status_ok, ls = pcall(require, "luasnip")

local s = ls.snippet
local i = ls.insert_node
local c = ls.choice_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt

local M = {}

local snippets = utils.merge(js.snippets)

local react_snippets = {
    s("rfc", 
        fmt("{}",{ c(1, {
            fmt(
            [[
                const {}: React.FC<{}> = ({}) => {{
                    {}
                }};
            ]], {i(1), i(2), i(3), i(4)}),
            fmt(
            [[
                function {}({}: {}) {{
                    {}
                }}
            ]], {i(1), i(2), i(3), i(4)}),
            })
        })
    )
}

local ts_react = utils.merge(snippets, react_snippets)

M.setup = function()
    ls.add_snippets(null,{
        typescript = snippets,
        typescriptreact = ts_react
    })
end

return M
