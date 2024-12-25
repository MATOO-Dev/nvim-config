return {
	{
		"dressing.nvim",
		dep_of = "overseer.nvim",
	},
	{
		"overseer.nvim",
		after = function()
			require("overseer").setup({
				templates = {
					"builtin",
					"user.c_compile",
					"user.c_compile_run",
					"user.c_debug",
					"user.cpp_compile",
					"user.cpp_compile_run",
					"user.cpp_debug",
				},
			})
		end,
	},
}
