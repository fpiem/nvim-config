local null_ls_status_ok, neodim = pcall(require, "neodim")
if not null_ls_status_ok then
	return
end

require("neodim").setup({
	alpha = 0.66,
	hide = {
		signs = false,
	},
})
