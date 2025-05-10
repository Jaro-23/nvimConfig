vim.api.nvim_create_user_command("ClangTidyFix", function()
	local file = vim.fn.expand("%:p")
	vim.cmd("write")

	vim.fn.jobstart({ "clang-tidy", file, "--fix" }, {
		on_stdout = function(_, data)
			if data and data[1] ~= "" then
				print(table.concat(data, "\n"))
			end
		end,
		on_stderr = function(_, data)
			if data and data[1] ~= "" then
				print("stderr: " .. table.concat(data, "\n"))
			end
		end,
		on_exit = function()
			vim.schedule(function()
				vim.cmd("checktime")
				vim.cmd("edit!")
				print("Clang-Tidy fix applied. Buffer forcefully reloaded.")
			end)
		end,
		stdout_buffered = true,
	})
end, {})
