vim.keymap.set("n", "<leader>ut",
	function()
		vim.cmd.UndotreeToggle()
		vim.cmd.UndotreeFocus()
	end
)

return {
	"undotree",
	cmd = "UndotreeToggle",
}
