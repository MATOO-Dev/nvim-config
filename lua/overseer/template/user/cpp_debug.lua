return {
	name = "C++: compile with debug flags",
	builder = function()
		local file = vim.fn.expand("%:p")
		return {
			cmd = { "g++" },
			args = { file, "-g" },
			components = { { "on_output_quickfix", open = true }, "default" },
		}
	end,
	condition = {
		filetype = { "cpp" },
	},
}
