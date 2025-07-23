return {
	"williamboman/mason-lspconfig.nvim", -- Mason + LSP config integration
	dependencies = {
		"williamboman/mason.nvim", -- Mason itself
		"neovim/nvim-lspconfig",
	},
	opts = {
		on_attach = function(_, bufnr)
			local function map(mode, keys, func, desc)
				vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
			end

			-- Custom LSP keymaps:
			map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
			map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
			map("n", "<leader>vws", vim.lsp.buf.workspace_symbol, "Workspace Symbol")
			map("n", "<leader>vd", vim.diagnostic.open_float, "Open Diagnostics")
			map("n", "<leader>vca", vim.lsp.buf.code_action, "Code Action")
			map("n", "<leader>vrr", vim.lsp.buf.references, "References")
			map("n", "<leader>vrn", vim.lsp.buf.rename, "Rename Symbol")
			map("i", "<C-h>", vim.lsp.buf.signature_help, "Signature Help")
		end,
	},

	config = function()
		require("mason").setup() -- Initialize mason
		require("mason-lspconfig").setup({
			ensure_installed = {
				"pyright", -- Python
				"rust_analyzer", -- Rust
				"clangd", -- C/C++
				"jdtls", -- Java
				"lua_ls", -- Lua
				"eslint",
			},
		})
	end,
}
