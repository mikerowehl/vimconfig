" Suppress load of neocomplete on this system
let g:loaded_neocomplete = 1

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

autocmd FileType octave setlocal omnifunc=syntaxcomplete#Complete

" Enable spell checking for text files
autocmd FileType txt,markdown setlocal spell spelllang=en_us

augroup filetypedetect 
  au BufNewFile,BufRead *.pig set filetype=pig syntax=pig 
  au BufNewFile,BufRead *.go set filetype=go syntax=go 
  au BufNewFile,BufRead Vagrantfile set filetype=ruby syntax=ruby 
  au BufNewFile,BufRead volofile,*.json set filetype=javascript syntax=javascript 
  au BufRead,BufNewFile *.m,*.oct set filetype=octave 
augroup END 

autocmd FileType ruby,Rakefile set sw=2 ts=2

map <up> <ESC>:NERDTreeToggle<RETURN>
map <left> <ESC>:tabp<RETURN>
map <right> <ESC>:tabn<RETURN>
map <down> <ESC>:TagbarToggle<RETURN>

" let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

if has("gui_running")
    colorscheme solarized
    set gfn=Inconsolata:h10
    set guioptions=egmrt
else
    colorscheme desert
endif

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

" Insert a random error number on F8 while in insert mode.
" For use with https://github.com/amattn/deeperror
:imap <F8> <C-R>=system('~/bin/errorno.sh')<C-M>
