-- local status, _ = pcall(vim.cmd, "colorscheme novum")
-- if not status then
--   print("color scheme not found!")
--   return
-- end

local status, theme = pcall(require, "onenord")
if not status then
	print("color scheme not found!")
	return
end

theme.setup()

-- local material_status, _ = pcall(vim.cmd, "colorscheme material")
-- if not material_status then
-- 	print("color scheme not found!")
-- 	return
-- end
