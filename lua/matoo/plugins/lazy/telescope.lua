return {
	"telescope.nvim",
	cmd = "Telescope",
	keys = {
		{ "<leader>ff", desc = "Telescope: [F]ind [F]iles" },
	},
	after = function()
		require("telescope").setup()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope: [F]ind [F]iles" })
	end,
}
