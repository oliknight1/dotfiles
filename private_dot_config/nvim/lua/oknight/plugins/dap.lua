return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
		"mason-org/mason.nvim",
	},
	keys = {
		{
			"<F5>",
			function()
				require("dap").continue()
			end,
			desc = "DAP Continue",
		},
		{
			"<F10>",
			function()
				require("dap").step_over()
			end,
			desc = "DAP Step Over",
		},
		{
			"<F11>",
			function()
				require("dap").step_into()
			end,
			desc = "DAP Step Into",
		},
		{
			"<F12>",
			function()
				require("dap").step_out()
			end,
			desc = "DAP Step Out",
		},
		{
			"<leader>b",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "DAP Toggle Breakpoint",
		},
		{
			"<leader>B",
			function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
			desc = "DAP Conditional Breakpoint",
		},
	},
	config = function()
		local dap = require("dap")
		local ui = require("dapui")

		-- UI setup
		ui.setup()
		dap.listeners.after.event_initialized["dapui_config"] = function()
			ui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			ui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			ui.close()
		end

		require("nvim-dap-virtual-text").setup()

		-- JS debug adapter
		local mason_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter"
		local js_debug_path = mason_path .. "/js-debug/src/dapDebugServer.js"
		dap.adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = { command = "node", args = { js_debug_path, "${port}" } },
		}

		-- Only the attach configuration for external terminal
		local attach_config = {
			type = "pwa-node",
			request = "attach",
			name = "Attach to Node CLI",
			host = "localhost",
			port = 9229, -- must match your --inspect-brk port
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
			outFiles = { "${workspaceFolder}/**/*.ts" },
			skipFiles = { "<node_internals>/**" },
		}

		for _, lang in ipairs({ "typescript", "javascript" }) do
			dap.configurations[lang] = { attach_config }
		end
	end,
}
