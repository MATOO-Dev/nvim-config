require("matoo.plugins.colorscheme")
require("matoo.plugins.lualine")
require("matoo.plugins.oil")

require("lze").load({
	{ import = "matoo.plugins.lazy.autopairs" },
	{ import = "matoo.plugins.lazy.telescope" },
	{ import = "matoo.plugins.lazy.treesitter" },
})
