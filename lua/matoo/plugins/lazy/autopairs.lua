return {
	"nvim-autopairs",
	event = "InsertEnter",
	after = function()
		local npairs = require("nvim-autopairs")
		npairs.setup({
			check_ts = true,
			enable_check_bracket_line = false,
		})
		local rule = require("nvim-autopairs.rule")
		npairs.add_rules({
			rule("$", "$"),
		})
	end,
}
