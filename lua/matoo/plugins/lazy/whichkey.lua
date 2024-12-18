return {
	"which-key.nvim",
	event = "DeferredUIEnter",
	keys = "<leader?",
	after = function()
		require("which-key").setup()
	end,
}
