return {
	"nvim-telescope/telescope.nvim",
	after = function()
		require("telescope").setup({})
	end,

	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "find files",
			mode = "n",
		},
	}
}
