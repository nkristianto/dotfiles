local attach_to_buffer = function(output_bufnr, command)
	vim.api.nvim_create_autocmd("BufWritePost", {
		group = vim.api.nvim_create_augroup("TestAutosave", { clear = true }),
		-- pattern = "main,go",
		callback = function()
			local append_data = function(_, data)
				if data then
					vim.api.nvim_buf_set_lines(output_bufnr, -1, -1, false, data)
				end
			end

			vim.api.nvim_buf_set_lines(output_bufnr, 0, -1, false, { "main.go output:" })
			vim.fn.jobstart(command, {
				stdout_buffered = true,
				on_stdout = append_data,
			})
		end,
	})
end

attach_to_buffer(6, { "go", "run", "main.go" })
