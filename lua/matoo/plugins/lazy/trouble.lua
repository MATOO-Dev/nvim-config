return {
	"trouble.nvim",
	-- cmd = "Trouble",
	-- event = "BufEnter",
	-- keys = "<leader>tr",
	after = function()
		require("trouble").setup {
			warn_no_results = false,
			open_no_results = true,
		}
		-- still a wip, doesnt work correctly rn
		vim.keymap.set("n", "<leader>tr",
			function ()
				if vim.cmd("Trouble diagnostics is_open") then
					vim.cmd("Trouble close")
				else
					vim.cmd("Trouble diagnostics open")
					vim.cmd("Trouble focus")
				end
			end)
	end,
}
