local status_ok, nvim_lsp = pcall(require, "lspconfig")
if not status_ok then
	print("LSP config not found")
  return
end

require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")

nvim_lsp.tsserver.setup {
  -- Omitting some options
  root_dir = nvim_lsp.util.root_pattern("package.json")
}
nvim_lsp.denols.setup {
  -- Omitting some options
  root_dir = nvim_lsp.util.root_pattern("deno.json"),

}
