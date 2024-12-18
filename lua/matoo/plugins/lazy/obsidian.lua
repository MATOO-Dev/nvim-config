return {
	"obsidian.nvim",
	ft = "markdown",
	after = function()
		require("obsidian").setup({
			workspaces = {
				{
					name = "Uni",
					path = "",
				},
			},
		})
	end,
}
