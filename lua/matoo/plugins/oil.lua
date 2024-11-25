vim.g.loaded_netrwplugin = 1
require("oil").setup({
	default_file_explorer = true,
	columns = {
		"icon",
	},
	keymaps = {
		["<leader>ol"] = "actions.parent",
	},
})
