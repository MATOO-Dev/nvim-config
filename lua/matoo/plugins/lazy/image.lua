return {
	"image.nvim",
	ft = { "typst", "markdown" },
	build = false,
	after = function()
		require("image").setup({
			backend = "kitty",
			processor = "magick_rock",
			integrations = {
				typst = {
					enabled = true,
					filetypes = { "typst" },
				},
				markdown = {
					enabled = true,
					filetypes = { "markdown" },
				},
			},
			hijack_file_patterns = {
				"*.png",
				"*.jpg",
				"*.jpeg",
				"*.gif",
				"*.webp",
				"*.avif",
			},
		})
	end,
}
