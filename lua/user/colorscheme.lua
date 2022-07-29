vim.cmd [[
try
  set termguicolors

  let g:material_style = "darker"
  let g:tokyonight_style = "night"
  let g:catppuccin_flavour = "mocha"
  let g:onedark_config = {
      \ 'style': 'warmer',
  \}

  colorscheme dracula

catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
