return {
	"luasnip",
	dep_of = "nvim-cmp",
	after = function()
		local luasnip = require("snippets")
		require("luasnip.loaders.from_vscode").lazy_load()
		luasnip.config.setup()
	end,
}
