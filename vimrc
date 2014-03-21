syntax on
set incsearch
set expandtab
set termencoding=utf-8
set encoding=utf-8
set smarttab
set ts=4
set shiftwidth=4
set shiftround
set number
set bs=2 "for macports vim
set t_Co=256
set background=dark
set tags=tags;$HOME/.tags
set notimeout
set nocompatible
set ttimeout
set ttimeoutlen=10
set ttyfast
set directory=~/.vim/tmp/swap
set backupdir=~/.vim/tmp/backup
set undodir=~/.vim/tmp/undo
set backup
set undofile
set undolevels=1000
set undoreload=10000
set hidden
colorscheme molokai

set wildmode=longest:full
set wildmenu

set foldmethod=indent
set foldlevel=10
set foldlevelstart=20
set foldnestmax=2

set nowrap

call pathogen#infect()
filetype on
filetype plugin on
filetype plugin indent on

" Tabs
map <silent> <C-T> :tabnew<CR>
map <silent> <kPageUp> :tabprevious<CR>
map <silent> <kPageDown> :tabnext<CR>
map <silent> <C-J> :tabprevious<CR>
map <silent> <C-K> :tabnext<CR>
imap <silent> <C-T> <ESC>:tabnew<CR>i
imap <silent> <C-W> <ESC>:tabclose<CR>i
imap <silent> <kPageUp> <C-O>:tabprevious<CR>
imap <silent> <kPageDown> <C-O>:tabnext<CR>
map <silent> <C-H> :tabfirst<CR>
imap <silent> <C-H> <C-O>:tabfirst<CR>

nnoremap <silent> <F7> :TagbarToggle<CR> 
nnoremap <silent> <F8> :TlistToggle<CR> 
nnoremap <silent> <F3> :NERDTreeToggle<CR> 

" Syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol         = '✗'
let g:syntastic_style_error_symbol   = '✗'
let g:syntastic_warning_symbol       = '⚠'
let g:syntastic_style_warning_symbol = '⚠'

let c_no_curly_error   = 1
let g:localrc_filename = '.lvimrc'

" Powerline
let g:Powerline_symbols = 'fancy'
set laststatus=2

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" vim-latex
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:Tex_ViewRule_pdf='/usr/bin/open -a Preview'

let g:tagbar_autofocus = 1

"Share code on sprunge
command -range=% Share silent <line1>,<line2>write !curl -s -F "sprunge=<-" http://sprunge.us | head -n 1 | tr -d '\r\n ' | pbcopy
"command -range=% Share silent <line1>,<line2>write !curl -s -F "sprunge=<-" http://sprunge.us | head -n 1 | tr -d '\r\n ' | DISPLAY=:0.0 xclip

"Generate .gitignore via gitignore.io
function CallGitignore(langs)
    if a:langs == "list"
        echo system("curl -s http://www.gitignore.io/api/list")
    else
        botright :new
        execute ':silent read !curl -s http://www.gitignore.io/api/' . a:langs
    endif
endfunction
command -nargs=1 Ignorify call CallGitignore(<f-args>)

function CallVimShell()
    botright :15split
    VimShell
endfunction

command Shell call CallVimShell()

" aliases (shameless stolen form vimmeh)
autocmd VimEnter * call DoAliases()
function! DoAliases()
    Alias W w
    Alias Wq wq
    Alias Wqall wqall
    Alias Q q
    Alias Qw wq
    Alias Qall qall
endfunction


autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType python let b:did_ftplugin = 1
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

let g:jscomplete_use = ['dom', 'moz', 'xpcom', 'es6th']

autocmd InsertLeave * set nocursorline
autocmd InsertEnter * set cursorline

let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.so$', '\.o$', '\.la$', '\.a$', '\.class$', '\~$', '\.beam$', '^Mnesia.', 'deps/', '\.hi$', 'vendor/']

let g:neocomplcache_enable_at_startup = 1
if !exists('g:neocomplcache_omni_functions')
    let g:neocomplcache_omni_functions = {}
endif
if !exists('g:neocomplcache_force_omni_patterns')
    let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_overwrite_completefunc = 1
let g:neocomplcache_omni_functions['python'] = 'jedi#complete'
let g:neocomplcache_force_omni_patterns.python = '[^. \t]\.\w*'
set ofu=syntaxcomplete#Complete


let g:Tlist_Use_Right_Window = 1

" no matter your colorscheme, you'll have a vertical bar when you split.
hi VertSplit ctermfg=59 ctermbg=59 cterm=NONE guifg=#555552 guibg=#555552 gui=NONE
set fillchars+=vert:\ 


"highlight column 80
hi ColorColumn ctermbg=234 ctermfg=Gray guibg=#404040
command SkinnyMargin set cc=73
command WideMargin set cc=80
command NoMargin set cc=

"GitGutter
let g:gitgutter_eager = 0
au VimEnter * GitGutterEnable

let g:clang_exec = "/opt/local/bin/clang"
let g:clang_library_path = "/opt/local/libexec/llvm-3.5/lib"

"python-mode
let g:pymode_rope_vim_completion = 0
let g:pymode_rope_guess_project = 0
let g:pymode_virtualenv = 1
"jedi-vim
let g:jedi#popup_select_first = 0
let g:jedi#popup_on_dot = 0
"
"Startify
let g:startify_skiplist = [
             \ 'COMMIT_EDITMSG',
             \ $VIMRUNTIME .'/doc',
             \ 'bundle/.*/doc' ,
             \ 'vimpager'
             \ ]
let g:startify_show_sessions = 1
let g:startify_show_files = 1


runtime! macros/matchit.vim
