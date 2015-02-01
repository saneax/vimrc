call pathogen#infect()
set background=dark
syntax on
filetype on
colorscheme lucius
LuciusWhite


filetype indent plugin on
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set smarttab
set autoindent

if version >= 703
  if exists('+colorcolumn')
    set colorcolumn=120
  endif
endif

set laststatus=2  " always show status line
set ruler
set noshowmode

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*$
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_auto_loc_list=1

highlight ExtraWhitespace ctermbg=161 guibg=161
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

set incsearch
set hlsearch


"To enable Just puppet-lint and disable the parser uncomment next line
let g:syntastic_puppet_checkers=['puppetlint']

