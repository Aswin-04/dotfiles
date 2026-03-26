return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
		"jayp0521/mason-null-ls.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting

		require("mason-null-ls").setup({
			ensure_installed = {
				"stylua", -- Lua
				"clang-format", -- C, C++
				"ruff", -- Python
				"prettier", -- Json, Yaml, Markdown
			},
			automatic_installation = true,
		})

		local sources = {
			-- 1. Lua (StyLua)
			formatting.stylua,

			-- 2. C & C++ (Set to 2-space indentation)
			formatting.clang_format.with({
				extra_args = { "-style={IndentWidth: 2, TabWidth: 2, UseTab: Never}" },
			}),

			-- 3. Python (Ruff)
			require("none-ls.formatting.ruff_format"),

			-- 4. JSON, YAML, Markdown (Prettier)
			formatting.prettier.with({
				filetypes = { "json", "yaml", "markdown" },
			}),

			formatting.google_java_format,
		}

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			sources = sources,
			on_attach = function(client, bufnr)
				if client:supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr, async = false })
						end,
					})
				end
			end,
		})
	end,
}
