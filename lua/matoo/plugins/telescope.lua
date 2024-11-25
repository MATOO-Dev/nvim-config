return {
	"telescope.nvim",
	cmd = "Telescope",
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "find files"},
	},
	after = function()
		require("telescope").setup()
	end,
}
