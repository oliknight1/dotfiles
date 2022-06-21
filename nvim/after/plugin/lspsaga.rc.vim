lua << EOF
local saga = require 'lspsaga'

saga.init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round",
}


EOF
inoremap <silent><C-k> :Lspsaga signature_help<CR>
noremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>
nnoremap <silent>dn :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent>dp <Cmd>:Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent>K :Lspsaga hover_doc<CR>
nnoremap <silent> <leader>r :Lspsaga rename<CR>
