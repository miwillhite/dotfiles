"AutoClose/            EasyMotion/           highlight.vim/        vim-colors-solarized/ vim-repeat/
"Command-T/            VimClojure/           sparkup/              vim-commentary/       vim-surround/

" easy plugins
call pathogen#infect()

" Enable filetype detection
filetype plugin indent on

" swap files aren't helpful
set noswapfile

" Restore cursor position
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" syntax highlighting
" syntax on
syntax enable

" Scala syntax
au BufRead,BufNewFile *.scala set filetype=scala
au! Syntax scala source ~/.vim/syntax/scala.vim

" never forget yo'self
set history=1000

" hard tabs are for noobs
set softtabstop=2

" ...
set shiftwidth=2

" ...
set tabstop=2

" ... I have no idea
set expandtab

" line numbers on side
set number

" column number/percentage in doc/ line number
set ruler

" highlight my searches
set hlsearch

" colorscheme
colorscheme slate

" highlight current line
au WinEnter * set cursorline
au WinLeave * set nocursorline
hi CursorLine guibg=#111111

" ...
"autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

" highlight that nasty whitespace, keep me files clean
"highlight ExtraWhitespace ctermbg=red guibg=red

highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

" get yo swp outta ma face
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" yay for highlighting
let vimclojure#HighlightBuiltins=1

" who doesn't like rainbows?
let vimclojure#ParenRainbow=1

" kill highlighting by returning the carriage
nnoremap <CR> :nohlsearch<cr>

" macvim
if has("gui_running")
    set go-=T
    set guioptions-=L
    set guioptions-=r
    "set guifont=Inconsolata-dz:h14
end

" Set tab to filename with path
set gtl=%F

" Ignore that nasty node shit
set wildignore+=node_modules/**

" bind control-l to hashrocket
imap <C-l> <Space>=><Space>

" function! SetTabName ()
"   redir @a|:pwd|redir END
"   redir @b|:cd|redir END

"   set gtl=substitute(@a, @b, '', 'g')
"   set gtl=%t
" endfunction
