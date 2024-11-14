-- require("lz.n").load({
-- 	"telescope.nvim",
-- 	cmd = "Telescope",
-- 	load = function(name)
-- 		vim.cmd.packadd(name)
-- 	end,
-- 	keys = {
-- 		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "find files"},
-- 	},
-- 	after = function()
-- 		require("telescope").setup()
-- 	end,
-- })

return {
	"telescope.nvim",
	cmd = "Telescope",
	load = function(name)
		vim.cmd.packadd(name)
	end,
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "find files"},
	},
	after = function()
		require("telescope").setup()
	end,
}
