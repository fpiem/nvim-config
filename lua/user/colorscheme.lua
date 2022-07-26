vim.cmd [[
try
  set termguicolors
  let g:material_style = "darker"
  let g:tokyonight_style = "night"
  let g:catppuccin_flavour = "macchiato"

let g:onedark_config = {
    \ 'style': 'warmer',
\}


  colorscheme onedark

catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
