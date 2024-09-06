vim.api.nvim_create_autocmd('TextYankPost', {
	desc = '',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function ()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_user_command('JaroDebug',function()
	vim.cmd (":! " .. vim.fn.getcwd() .. "/debug.sh")
end,{})

vim.api.nvim_create_user_command('JaroSetup',function()
	vim.cmd (":! " .. vim.fn.getcwd() .. "/setup.sh")
end,{})
