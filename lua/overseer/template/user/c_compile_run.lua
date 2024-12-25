return {
	name = "C: compile & run",
	builder = function()
		local file = vim.fn.expand("%:p")
		return {
			name = "C: compile & run",
			components = { "default" },
			strategy = {
				"orchestrator",
				tasks = {
					{
						cmd = { "gcc" },
						args = { file },
						components = { { "on_output_quickfix", open = true }, "default" },
					},
					{
						cmd = { "./a.out" },
					},
				},
			},
		}
	end,
	condition = {
		filetype = { "c" },
	},
}
