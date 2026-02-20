local function set_makeprg()
	-- Find CMakeLists.txt upward from current file
	local cmake_root = vim.fs.find("CMakeLists.txt", {
		upward = true,
	})[1]

	if cmake_root then
		local root_dir = vim.fs.dirname(cmake_root)
		vim.opt_local.makeprg = "cmake --build " .. root_dir .. "/build "
		vim.opt_local.errorformat = "%E%f:%l:%c: error: %m,"
			.. "%E%f:%l: error: %m,"
			.. "%E%f:%l:%c: fatal error: %m,"
			.. "%E%f:%l: fatal error: %m,"
			.. "%W%f:%l:%c: warning: %m,"
			.. "%W%f:%l: warning: %m,"
			.. "%I%f:%l:%c: note: %m,"
			.. "%I%f:%l: note: %m,"
			.. "%-G%.%#"
	end
end

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = set_makeprg,
})
