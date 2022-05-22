local utils = require("user.snippets.utils");
local status_ok, ls = pcall(require, "luasnip")

local M = {}

local s = ls.snippet
local i = ls.insert_node
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

local snippets = utils.merge(
    imports_snippets, 
    exports_snippets,
    console_snippets
)
 
M.setup = function()
    ls.add_snippets(null,{
        javascript = snippets,
        javascriptreact = snippets
    })
end

M.snippets = snippets

return M