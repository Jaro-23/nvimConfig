return {
	"stevearc/conform.nvim",
	dependecies = { "mason.nvim" },
	lazy = true,
	cmd = "ComformInfo",
	keys = {
		{
			"<leader>ll",
			function()
				require("conform").format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
			end,
			mode = { "n", "v" },
			desc = "Format file or region (in view mode)",
		},
	},

	init = function()
		LazyVim.on_very_lazy(function()
			LazyVim.format.register({
				name = "conform.nvim",
				priority = 100,
				primary = true,
				format = function(buf)
					require("conform").format({ bufnr = buf })
				end,
				sources = function(buf)
					local ret = require("conform").list_formatters(buf)
					return vim.tbl_map(function(v)
						return v.name
					end, ret)
				end,
			})
		end)
	end,

	opts = {
		default_format_opts = {
			timeout_ms = 500,
			async = false,
			quiet = false,
			lsp_format = "fallback",
		},

		formatters_by_ft = {
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptrust = { "prettier" },
			typescriptrust = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			markdown = { "prettier" },
			c = { "clang_format" },
			cpp = { "clang_format" },
			lua = { "stylua" },
			python = { "isort", "black" },
		},

		formatters = {
			clang_format = {
				prepend_args = function()
					return {
						"--style=file",
						"--fallback-style=LLVM",
					}
				end,
			},
		},
	},
}
