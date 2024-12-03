return {
	"nvim-cmp",
	event = "DeferredUIEnter",
	on_require = "cmp",
	after = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		cmp.setup {
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end
			},
			sources = cmp.config.sources {
				{ name = "luasnip" },
				{ name = "nvim_lsp" },
				{ name = "path" },
				{ name = "buffer" },
			}
		}
	end,
}
