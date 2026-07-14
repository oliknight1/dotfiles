return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-jest",
	},
	keys = {
		-- Run tests
		{
			"<leader>tt",
			function()
				require("neotest").run.run()
			end,
			desc = "Run nearest test",
		},
		{
			"<leader>tc",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			desc = "Run current file",
		},
		{
			"<leader>td",
			function()
				require("neotest").run.run({ strategy = "dap" })
			end,
			desc = "Debug nearest test",
		},
		{
			"<leader>tD",
			function()
				require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" })
			end,
			desc = "Debug current file",
		},
		{
			"<leader>ts",
			function()
				require("neotest").run.stop()
			end,
			desc = "Stop test run",
		},

		-- Summary panel
		{
			"<leader>tsu",
			function()
				require("neotest").summary.toggle()
			end,
			desc = "Toggle summary",
		},
		{
			"<leader>tso",
			function()
				require("neotest").summary.open()
			end,
			desc = "Open summary",
		},
		{
			"<leader>tsc",
			function()
				require("neotest").summary.close()
			end,
			desc = "Close summary",
		},

		-- Output
		{
			"<leader>to",
			function()
				require("neotest").output.open({ enter = true })
			end,
			desc = "Show test output",
		},
		{
			"<leader>tO",
			function()
				require("neotest").output_panel.toggle()
			end,
			desc = "Toggle output panel",
		},

		-- Navigation between failures
		{
			"]t",
			function()
				require("neotest").jump.next({ status = "failed" })
			end,
			desc = "Next failed test",
		},
		{
			"[t",
			function()
				require("neotest").jump.prev({ status = "failed" })
			end,
			desc = "Previous failed test",
		},

		-- Watch mode
		{
			"<leader>tw",
			function()
				require("neotest").watch.toggle(vim.fn.expand("%"))
			end,
			desc = "Watch current file",
		},

		-- Attach to running test
		{
			"<leader>ta",
			function()
				require("neotest").run.attach()
			end,
			desc = "Attach to nearest test",
		},

		-- Run last test
		{
			"<leader>tl",
			function()
				require("neotest").run.run_last()
			end,
			desc = "Run last test",
		},
	},
	config = function()
		require("neotest").setup({
			output = {
				open_on_run = true,
			},
			output_panel = {
				enabled = true,
				open = "botright vsplit",
			},
			summary = {
				open = "botright vsplit",
			},
			adapters = {
				require("neotest-jest")({
					jestCommand = "npm test --",
					jestArguments = function(defaultArguments, context)
						return defaultArguments
					end,
					jestConfigFile = "custom.jest.config.ts",
					env = { CI = true },
					cwd = function(path)
						return vim.fn.getcwd()
					end,
					isTestFile = require("neotest-jest.jest-util").defaultIsTestFile,
				}),
			},
			consumers = {
				notify = function(client)
					client.listeners.results = function(adapter_id, results, partial)
						for _, result in pairs(results) do
							if result.status == "failed" then
								require("neotest").summary.open({ enter = true })
								break
							end
						end
					end
				end,
			},
		})
	end,
}
