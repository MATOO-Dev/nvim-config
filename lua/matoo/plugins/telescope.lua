return {
	"telescope.nvim",
	cmd = "Telescope",
	keys = {
		{ "<leader>ff" },
	},
	after = function()
		require("telescope").setup()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files)
	end,
}
