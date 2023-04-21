-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({
	preview = {
		lines_above = 0,
		lines_below = 10,
	},
	-- keybinds for navigation in lspsaga window
	scroll_preview = { scroll_down = "<C-u>", scroll_up = "<C-d>" },
	-- use enter to open file with definition preview
	-- definition = {
	-- 	edit = "<CR>",
	-- },
	finder = {
		keys = {
			expand_or_jump = "<CR>",
			vsplit = "vs",
			split = "sp",
		},
	},
	ui = {
		colors = {
			normal_bg = "#022746",
		},
	},
})
