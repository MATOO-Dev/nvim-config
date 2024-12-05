return {
	"conform.nvim",
	event = "BufWritePre",
	cmd = "ConformInfo",
	after = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				c = { "astyle" },
				cpp = { "astyle" },
				cs = { "csharpier" },
				gdscript = { "gdformat" },
				java = { "astyle" },
				nix = { "alejandra", "nixfmt" },
				rust = { "rustfmt" },
				tex = { "tex-fmt" },
				typst = { "typstyle" },
			},
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 500,
			},
			notify_on_error = true,
		})
	end,
}
