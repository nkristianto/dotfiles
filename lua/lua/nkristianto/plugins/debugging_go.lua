local dap_setup, dap = pcall(require, "dap-go")
if not dap_setup then
	return
end

local dapui_setup, dapui = pcall(require, "dapui")
if not dapui_setup then
	return
end

dapui.setup()
dap.setup()
