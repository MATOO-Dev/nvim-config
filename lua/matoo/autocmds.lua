local ftgroup = vim.api.nvim_create_augroup("ft", {clear=true})

vim.api.nvim_create_autocmd(
	"BufReadPost",
	{
		pattern = "*.typ",
		command = "TypstPreview",
		group = ftgroup,
	}
)
