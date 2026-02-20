return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	priority = 1000,
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		require("nvim-treesitter.install").prefer_git = false
		require("nvim-treesitter.install").compilers = { "gcc", "clang" }

		require("nvim-treesitter.configs").setup({
			highlight = { enable = true },
			indent = { enable = true },
			autotag = { enable = true },
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"yaml",
				"html",
				"css",
				"markdown",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"c",
				"c_sharp",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}
