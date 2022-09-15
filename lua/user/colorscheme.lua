vim.cmd [[
try
  set termguicolors

let g:onedark_config = {
    \ 'style': 'darker',
\}
colorscheme onedark

catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
