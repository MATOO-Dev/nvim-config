return {
	"trouble.nvim",
	cmd = "Trouble",
	keys = {
		{ "<leader>tr" },
	},
	after = function()
		require("trouble").setup {
			warn_no_results = false,
			open_no_results = true,
		}
		vim.keymap.set("n", "<leader>tr", "<cmd>Trouble diagnostics toggle<cr>")
		-- todo: this is a bit nicer, get this working
		-- vim.keymap.set("n", "<leader>tr",
		-- 	function()
		-- 		if vim.cmd("Trouble diagnostics is_open") then
		-- 			vim.cmd("Trouble close")
		-- 		else
		-- 			vim.cmd("Trouble diagnostics focus")
		-- 		end
		-- 	end
		-- )
	end,
}
