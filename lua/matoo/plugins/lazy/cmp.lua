return {
	"nvim-cmp",
	event = "InsertEnter",
	after = function()
		require("cmp").setup {
		}
	end,
}
