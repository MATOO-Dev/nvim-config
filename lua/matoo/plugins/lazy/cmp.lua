return {
	{
		"cmp_luasnip",
		on_plugin = "nvim-cmp",
	},
	{
		"friendly-snippets",
		dep_of = "nvim-cmp",
	},
	{
		"luasnip",
		dep_of = "nvim-cmp",
		after = function()
			local luasnip = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()
			luasnip.config.setup {}
		end,
	},
	{
		"nvim-cmp",
		event = "DeferredUIEnter",
		on_require = "cmp",
		-- this is a bit of a hack. cmp_luasnips needs to load after nvim-cmp
		-- i dont really want to get into learning nixcats-utils right now
		-- instead I can just make nvim-cmp a dependency of cmp_luasnips
		-- todo: clean this up
		dep_of = "cmp_luasnip",
		after = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			cmp.setup {
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end
				},
				-- window
				mapping = {
					["<c-space>"] = cmp.mapping.complete(),
				},
				sources = cmp.config.sources {
					{ name = "luasnip" },
					-- { name = "nvim_lsp" },
					-- { name = "path" },
					-- { name = "buffer" },
				},
			}
		end,
	},
}
