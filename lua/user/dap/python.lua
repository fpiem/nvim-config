local status_ok, dap_python = pcall(require, "dap-python")
if not status_ok then
	return
end

-- Python installation which contains the `debugpy` module
dap_python.setup("/home/francesco/miniconda3/envs/debugpy/bin/python3")

