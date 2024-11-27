return {
	"nvim-autopairs",
	event = "InsertEnter",
	after = function()
		require("nvim-autopairs").setup {
			check_ts = true,
			enable_check_bracket_line = false,
		}
	end,
}
