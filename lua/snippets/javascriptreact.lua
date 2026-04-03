local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
	-- Console snippets
	s("cl", fmt("console.log('{}');", { i(1) })),
	s("ce", fmt("console.error('{}');", { i(1) })),
	-- Imports snippets
	s("imr", fmt("import React from 'react';", {})),
	s("imd", fmt("import {} from '{}';", { i(1), i(2) })),
	s("imn", fmt("import {{{}}} from '{}';", { i(1), i(2) })),
	-- Exports snippets
	s("exd", fmt("export default {};", { i(1) })),
	s("exn", fmt("export {{{}}};", { i(1) }))
}
