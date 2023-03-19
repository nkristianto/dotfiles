local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- recommended setting from nvim-tree doc
vim.g.loaded = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwlugin = 1

vim.opt.termguicolors = true

nvimtree.setup({
	sort_by = "case_sensitive",
	actions = {
		open_file = { quit_on_open = true },
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	filters = {
		custom = { "^.git$" },
	},
	git = {
		enable = true,
	},
	log = {
		enable = true,
		types = {
			diagnostics = true,
		},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = false,
		debounce_delay = 50,
		icons = {
			hint = "H",
			info = "I",
			warning = "W",
			error = "E",
		},
	},
	renderer = {
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "", -- arrow when folder is closed
					arrow_open = "", -- arrow when folder is open
				},
			},
		},
	},
})
