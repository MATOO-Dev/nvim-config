return {
	"overseer.nvim",
	after = function()
		require("overseer").setup({
			templates = {
				"builtin",
				"user.cpp_compile",
				"user.cpp_debug",
			},
		})
	end,
}
