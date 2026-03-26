-- Custom code snippets for different purposes

-- Prevent LSP from overwriting treesitter color settings
-- https://github.com/NvChad/NvChad/issues/1907
vim.hl.priorities.semantic_tokens = 95 -- Or any number lower than 100, treesitter's priority level

-- Appearance of diagnostics
vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
		spacing = 4,
		-- Add a custom format function to show error codes
		format = function(diagnostic)
			local code = diagnostic.code and string.format("[%s]", diagnostic.code) or ""
			return string.format("%s %s", code, diagnostic.message)
		end,
	},
	underline = false,
	update_in_insert = true,
	severity_sort = true,
	float = {
		source = true, -- Or "if_many"
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.INFO] = " ",
			[vim.diagnostic.severity.HINT] = "󰌵 ",
		},
	},
	-- Make diagnostic background transparent
	vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", {
		bg = "NONE",
		fg = "#ff6c6b",
	}),

	vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", {
		bg = "NONE",
		fg = "#ECBE7B",
	}),

	vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", {
		bg = "NONE",
		fg = "#51afef",
	}),

	vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", {
		bg = "NONE",
		fg = "#98be65",
	}),
})

-- Remove background highlight applied by LSP when cursor is on a symbol
-- This prevents words from being highlighted across the file
vim.api.nvim_set_hl(0, "LspReferenceText", {})
vim.api.nvim_set_hl(0, "LspReferenceRead", {})
vim.api.nvim_set_hl(0, "LspReferenceWrite", {})

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.hl.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})
