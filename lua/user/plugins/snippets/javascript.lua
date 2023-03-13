local utils = require("user.plugins.snippets.utils");
local status_ok, ls = pcall(require, "luasnip")

local M = {}

local s = ls.snippet
local i = ls.insert_node
local c = ls.choice_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt

local imports_snippets = {
    s("imd", fmt("import {} from '{}';", {i(0), i(1)})),
    s("imn", fmt("import {{{}}} from '{}';", {i(0), i(1)})),
}

local exports_snippets = {
    s("exd", fmt("export default {};", {i(1)})),
    s("exn", fmt("export {{{}}};", {i(1)}))
}

local console_snippets = {
    s("cl", fmt("console.log('{}');", {i(1)})),
    s("ce", fmt("console.error('{}');", {i(1)})),
}

local test_snippets = {
    s("desc", fmt(
        [[
            describe('{}', () => {{
                {}
            }});
        ]], {i(1), i(0)})
    ),
    s("it", fmt(
        [[
            it('{}', () => {{
                {}
            }});
        ]], {i(1), i(0)})
    )
}

local react_snippets = {
    s("rfc", 
        fmt("{}",{ c(1, {
            fmt(
            [[
                const {} = ({}) => {{
                    {}
                }};
            ]], {i(1), i(2), i(0)}),
            fmt(
            [[
                function {}({}) {{
                    {}
                }}
            ]], {i(1), i(2), i(0)}),
            })
        })
    )
}

local function_snippets = {
    s("fn", 
        fmt("{}",{ c(1, {
            fmt(
            [[
                function {}({}) {{
                    {}
                }}
            ]], {i(1), i(2), i(3)}),
            fmt(
            [[
                const {} = function ({}) {{
                    {}
                }}
            ]], {i(1), i(2), i(3)}),
            fmt(
            [[
                function ({}) {{
                    {}
                }}
            ]], {i(1), i(2)})
        })})
    ),
    s("arf", 
        fmt("{}",{ c(1, {
            fmt(
            [[
                ({}) => {}
            ]], {i(1), i(2)}),
            fmt(
            [[
                const {} = ({}) => {{
                    {}
                }}
            ]], {i(1), i(2), i(3)}),
        })})
    ),

}

local snippets = utils.merge(
    imports_snippets, 
    exports_snippets,
    console_snippets,
    function_snippets,
    test_snippets
)

local js_react_snippets = utils.merge(snippets, react_snippets)
 
M.setup = function()
    ls.add_snippets(null,{
        javascript = snippets,
        javascriptreact = js_react_snippets
    })
end

M.snippets = snippets

return M
