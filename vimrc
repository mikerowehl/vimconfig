" Need to install supertab and nerdtree plugins
call pathogen#infect()
call pathogen#helptags()

set nocompatible

" Fixup, set filetype = txt if we don't know the filetype
autocmd BufEnter * if &filetype == "" | setlocal ft=txt | endif

:set softtabstop=4
:set shiftwidth=4
:set tabstop=4
:set et
:set ai
:set si
:set hlsearch
:set incsearch
:set ignorecase
:set smartcase
:set showcmd
:set ruler
" :set cursorline
:set mouse=

:set background=dark
:syntax on

set backspace=indent,eol,start
set matchpairs+=<:>
set vb t_vb=
set completeopt=menu

filetype plugin indent on
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

autocmd FileType scala setlocal omnifunc=scalacomplete#CompleteTags
autocmd FileType scala setlocal tabstop=8

" Enable spell checking for text files
autocmd FileType txt,markdown setlocal spell spelllang=en_us

augroup filetypedetect 
  au BufNewFile,BufRead *.pig set filetype=pig syntax=pig 
augroup END 

autocmd FileType ruby,Rakefile set sw=2 ts=2

map <up> <ESC>:NERDTreeToggle<RETURN>
map <left> <ESC>:tabp<RETURN>
map <right> <ESC>:tabn<RETURN>
map <down> <ESC>:TagbarToggle<RETURN>

if has("gui_running")
    colorscheme desert
    set gfn=Inconsolata:h10
    set guioptions=egmrt
endif

function! Openrtb()
    map <C-F12> :!/usr/local/bin/ctags -R -f /Users/miker/metaresolver/meta/openrtb/tags /Users/miker/metaresolver/meta/openrtb
    set tags=/Users/miker/metaresolver/meta/openrtb/tags
endfunction

" map <F8> :!/usr/local/bin/ctags -R -f /Users/miker/metaresolver/meta/openrtb/tags /Users/miker/metaresolver/meta/openrtb<CR>

let g:tagbar_type_scala = {
    \ 'ctagstype' : 'Scala',
    \ 'kinds'     : [
        \ 'p:packages:1',
        \ 'V:values',
        \ 'v:variables',
        \ 'T:types',
        \ 't:traits',
        \ 'o:objects',
        \ 'a:aclasses',
        \ 'c:classes',
        \ 'r:cclasses',
        \ 'm:methods'
    \ ]
\ }
