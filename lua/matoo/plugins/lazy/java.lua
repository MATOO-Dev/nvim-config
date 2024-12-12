return {
	"nvim-jdtls",
	ft = "java",
	after = function()
		local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
		local workspace_dir = vim.loop.os_homedir() .. "/.cache/jdtls/workspace/" .. project_name
		local jdtls_path = vim.fn.exepath("jdtls")
		local extendedClientCapabilities = require("jdtls").extendedClientCapabilities
		extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
		local jda_path = nixCats("vscode-extensions.vscjava.vscode-java-debug")
		local jda_server_jar = vim.fn.glob(
			jda_path
				.. "/share/vscode/extensions/vscjava.vscode-java-debug/server/com.microsoft.java.debug.plugin-*.jar"
		)
		local bundles = {}
		if jda_server_jar then
			vim.list_extend(bundles, vim.split(jda_server_jar, "\n"))
		end
		local config = {
			cmd = {
				"java",
				"-Declipse.application=org.eclipse.jdt.ls.core.id1",
				"-Dosgi.bundles.defaultStartLevel=4",
				"-Declipse.product=org.eclipse.jdt.ls.core.product",
				"-Dlog.protocol=true",
				"-Dlog.level=ALL",
				"-Xmx1g",
				"--add-modules=ALL-SYSTEM",
				"--add-opens",
				"java.base/java.util=ALL-UNNAMED",
				"--add-opens",
				"java.base/java.lang=ALL-UNNAMED",
				"-javaagent:" .. jdtls_path .. "lombok.jar",
				"-jar",
				vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher:*.jar"),
				"-configuration",
				jdtls_path .. "/config_linux",
				"-data",
				workspace_dir,
			},
			capabilities = require("matoo.lsps.init").GetCapabilities(),
			root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew" }),
			settings = {
				java = { updateBuildConfiguration = "interactive" },
				eclipse = { downloadSources = true },
				format = { enabled = true },
				implementationsCodeLens = { enabled = true },
				inlayHints = { parameterNames = { enabled = "all" } },
				maven = { downloadSources = true },
				references = { includeDecompiledSources = true },
				referencesCodeLens = { enabled = true },
				redhat = { telemetry = { enabled = false } },
				signatureHelp = { enabled = true },
				extendedClientCapabilities = extendedClientCapabilities,
			},
			init_options = { bundles = bundles },
		}
		require("jdtls").start_or_attach(config)
	end,
}
