"BASE DIR: ~/.config/nvim
nmap <F5> :vne<BAR>te<CR>
nmap <C-p> :FZF<CR>
nmap <F12> :set nu!<CR>

tmap <Esc> <C-\><C-n>

set noincsearch hls
au Vimenter * :NoMatchParen
"au FileType php set sw=4 ts=4 et
"au Filetype php nmap <F6> :up<Bar>!php -l %<CR>
au Filetype markdown,html,yaml,javascript set sw=2 ts=2

"let g:vue_pre_processors = []
"https://github.com/junegunn/vim-plug (~/.config/nvim/autoload/)
call plug#begin('~/.config/nvim/plugged')
"file name fuzzy searh
Plug 'junegunn/fzf', {'frozen': 1}
"text support
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
"coding help
Plug 'mattn/emmet-vim', {'for': ['css', 'sass', 'vue']}
"syntax enhance
"Plug 'pangloss/vim-javascript', {'for': ['javascript']}
"Plug 'posva/vim-vue', {'for': ['vue']}
call plug#end()
"au Filetype html EmmetInstall
