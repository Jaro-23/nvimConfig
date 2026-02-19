local function set_makeprg()
	-- Find CMakeLists.txt upward from current file
	local cmake_root = vim.fs.find("CMakeLists.txt", {
		upward = true,
	})[1]

	if cmake_root then
		local root_dir = vim.fs.dirname(cmake_root)
		vim.opt_local.makeprg = "cmake -S . -B " .. root_dir .. "/build && make -s -C " .. root_dir .. "/build"
	end
end

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = set_makeprg,
})
