return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},

		version = "*",

		opts = {
			keymap = {
				preset = "none",

				["<C-n>"] = { "select_next", "fallback" },
				["<C-p>"] = { "select_prev", "fallback" },

				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },

				["<C-y>"] = { "accept", "fallback" },

				["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },

				["<Tab>"] = {
					function(cmp)
						if cmp.is_visible() then
							return cmp.select_next()
						end
					end,
					"snippet_forward",
					"fallback",
				},

				["<S-Tab>"] = {
					function(cmp)
						if cmp.is_visible() then
							return cmp.select_prev()
						end
					end,
					"snippet_backward",
					"fallback",
				},

				["<C-l>"] = { "snippet_forward", "fallback" },
				["<C-h>"] = { "snippet_backward", "fallback" },
			},

			appearance = {
				nerd_font_variant = "mono",
				use_nvim_cmp_as_default = true,
			},

			completion = {
				-- Instant documentation like VS Code
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 0,
					window = {
						border = "rounded", -- This adds the border you want
						winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
					},
				},
				-- Modern ghost text preview
				ghost_text = { enabled = true },

				-- VS Code style: Rounded windows and specific column layout
				menu = {
					border = "rounded",
					draw = {
						columns = {
							{ "kind_icon", "label", gap = 1 },
							{ "kind" },
						},
					},
				},
			},

			-- Documentation window is now nested under completion.documentation
			-- but general window settings like signature go here:
			signature = {
				enabled = true,
				window = { border = "rounded" },
			},
			snippets = {
				preset = "luasnip",
			},

			sources = {
				default = { "lsp", "snippets", "buffer", "path" },
			},
		},

		opts_extend = { "sources.default" },
	},
}
