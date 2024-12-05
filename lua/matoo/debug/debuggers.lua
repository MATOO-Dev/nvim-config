local dap = require("dap")

dap.adapters.gdb = {
	type = "executable",
	command = "gdb",
	args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
}

dap.configurations.c = {
	{
		name = "Launch C debugger",
		type = "gdb",
		request = "launch",
		cwd = "${workspaceFolder}",
		stopAtBeginningOfMainSubprogram = false,
		program = function()
			return vim.fn.input("Path to executable:", vim.fn.getcwd() .. "/", "file")
		end,
	},
}
