local dap = require("dap")

dap.adapters.gdb = {
	type = "executable",
	-- command = "gdb",
	command = vim.fn.exepath("gdb"),
	args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.cpp = {
	{
		name = "GDB Debug",
		type = "gdb",
		request = "launch",
		cwd = "${workspaceFolder}",
		stopAtBeginningOfMainSubprogram = true,
		program = function()
			return vim.fn.input("Path to executable:", vim.fn.getcwd() .. "/", "file")
		end,
	},
}
