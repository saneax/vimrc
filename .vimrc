call pathogen#infect()
set background=light
syntax on
filetype on
colorscheme lucius
LuciusBlack


set nocompatible
set t_Co=256
set synmaxcol=120
filetype indent plugin on
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set smarttab
set autoindent
set number
set cursorline
set showmatch
let python_highlight_all = 1
let g:jedi#use_splits_not_buffers = "left"

if version >= 703
  if exists('+colorcolumn')
    set colorcolumn=120
  endif
endif

"set laststatus=2  " always show status line
 if has('statusline')
   set laststatus=2
   " Broken down into easily includeable segments
   set statusline=%<%f\ " Filename
   set statusline+=%w%h%m%r " Options
   " set statusline+=%{fugitive#statusline()} " Git Hotness
   set statusline+=\ [%{&ff}/%Y] " filetype
   set statusline+=\ [%{getcwd()}] " current dir
   set statusline+=%#warningmsg#
   set statusline+=%{SyntasticStatuslineFlag()}
   set statusline+=%*
   let g:syntastic_enable_signs=1
   set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
endif

set ruler
set noshowmode "this disabled the mode display

"status line via syntastics
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_auto_loc_list=1

"extra space highlight (taken from Rushi)
highlight ExtraWhitespace ctermbg=161 guibg=161
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

set incsearch
set hlsearch

set foldmethod=indent
set foldlevel=99

"toggle pasting with indent and without indent
set pastetoggle=<leader>p

"To enable Just puppet-lint and disable the parser uncomment next line
let g:syntastic_puppet_checkers=['puppetlint']

"Tabularize shortcuts for tabularizing with '=' and ':' (most used)
"<leader>a=, <leader>a:

if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif


"This below is taken from http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
"This enables Tabularize option when you press '|'

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" For those with sadly no function keys available
" " toggle spelling use \s
imap <Leader>s <C-o>:setlocal spell! spelllang=en_us<CR>
nmap <Leader>s :setlocal spell! spelllang=en_us<CR>

"spelling shortcuts
"Here are the commands you need to know:
"
"]s — move to the next mispelled word
"[s — move to the previous mispelled word
"zg — add a word to the dictionary
"zug — undo the addition of a word to the dictionary
"z= — view spelling suggestions for a mispelled word


"nerdtree specific settings
let g:NERDTreeDirArrows=0

"Open nerdtree automatically if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"shortcut to open nerdtree
map <C-n> :NERDTreeToggle<CR>

"Close nerdtree, when the last file open is closed.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
set t_ku=[A
set t_kd=[B
set t_kr=[C
set t_kl=[D

