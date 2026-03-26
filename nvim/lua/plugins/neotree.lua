return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		keys = {
			{ "<leader>e", ":Neotree toggle<CR>", desc = "Toggle Explorer" },
			{ "<leader>o", ":Neotree reveal<CR>", desc = "Reveal current file" },
			{ "\\", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
		},
		-- lazy = false, -- neo-tree will lazily load itself
		cmd = "NeoTree", -- lazy load when command is used
		opts = {
			filesystem = {
				filtered_items = {
					visible = true,
				},
			},
		},
	},
}
