require("lualine").setup {
	options = {
		icons_enabled = true,
		theme = "gruvbox-material",
		component_separators = { left = "|", right = "|" },
	},
	{
		sections = {
			lualine_a = {"mode"},
			lualine_b = {"diagnostics"},
			lualine_c = {"buffers"},
			lualine_d = {"filetype"},
			lualine_e = {"branch"},
			lualine_f = {"location"},
		}
	}
}
