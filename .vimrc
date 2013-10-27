set ts=3 ai sw=3 wrap et ruler nrformats=hex
"set vb t_vb=
set bg=dark
try
   colorscheme strobe
catch /^Vim\%((\a\+)\)\=:E185/
   colorscheme slate
endtry
syntax enable
set history=100
set viminfo='100,f1,:200,/200

set shortmess=aOt
set backspace=indent,eol,start
set showcmd
set lazyredraw
set showmatch

set showfulltag

set hlsearch
"set incsearch
"highlight Search term=reverse cterm=bold ctermfg=7 ctermbg=4

" case for search
set ignorecase infercase smartcase

set scrolloff=2 sidescrolloff=2
set wildmenu
set wildignore+=*.o,*.so,*.swp
set suffixes+=.a
set wildignore+=*/.git/*,*/.svn/*

set virtualedit=block

if match($TERM, "screen")!=-1
  set term=xterm
endif

if &term =~ '^screen'
  " tmux will send xterm-style keys when its xterm-keys option is on
  execute "set <Up>=\e[A"
  execute "set <Down>=\e[B"
  execute "set <Right>=\e[C"
  execute "set <Left>=\e[D"
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

set autoindent
inoremap # X<BS>#

" autocmd for file type loading
if has("autocmd")
  autocmd FileType * setlocal formatoptions-=r formatoptions-=o
  augroup puppet " 
    autocmd BufRead,BufNewFile *.pp
          \ set tabstop=2 shiftwidth=2 softtabstop=2 |
          \ set smartindent
  augroup END
  augroup ruby " 
    autocmd BufRead,BufNewFile *.rb,*.erb
          \ set tabstop=2 shiftwidth=2 softtabstop=2 |
          \ set smartindent
  augroup END
  augroup perl " 
    autocmd BufRead,BufNewFile *.p[lm]
          \ set tabstop=3 shiftwidth=3 softtabstop=3 |
          \ set smartindent |
          \ set filetype=perl
  augroup END
  augroup cpp " 
    autocmd BufRead,BufNewFile *.[hic]pp
          \ set tabstop=3 shiftwidth=3 softtabstop=3 |
          \ set cindent cino={1s nowrap |
          \ set filetype=cpp
  augroup END
  augroup html " 
    autocmd BufNewFile *.html
          \ 0put ='<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.1//EN\" \"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd\">' |
          \ $put ='<html xml:lang=\"en\" xmlns=\"http://www.w3.org/1999/xhtml\">' |
          \ $put ='  <head>' |
          \ $put ='    <title></title>' |
          \ $put ='    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />' |
          \ $put ='    <link href=\"\" rel=\"stylesheet\" type=\"text/css\" />' |
          \ $put ='    <style type=\"text/css\">' |
          \ $put ='    </style>' |
          \ $put ='  </head>' |
          \ $put ='  <body>' |
          \ $put ='  </body>' |
          \ $put ='</html>' |
          \ $put ='<!-- vim: set sw=2 sts=2 et tw=80 : -->' |
          \ set sw=2 sts=2 et tw=80 | norm G
  augroup END
  " Transparent editing of gpg encrypted files.
  " By Wouter Hanegraaff <wouter@blub.net>
  augroup encrypted
    au!

    " Set the shell to bash to allow using bash STDERR redirection
    autocmd BufReadPre,FileReadPre      *.gpg set shell=/bin/bash
    " First make sure nothing is written to /.viminfo while editing
    " an encrypted file.
    autocmd BufReadPre,FileReadPre      *.gpg set viminfo=
    " We don't want a swap file, as it writes unencrypted data to disk
    autocmd BufReadPre,FileReadPre      *.gpg set noswapfile
    " Switch to binary mode to read the encrypted file
    autocmd BufReadPre,FileReadPre      *.gpg set bin
    autocmd BufReadPre,FileReadPre      *.gpg let ch_save = &ch|set ch=2
    autocmd BufReadPost,FileReadPost    *.gpg %!gpg --decrypt 2> /dev/null
    " Switch to normal mode for editing
    autocmd BufReadPost,FileReadPost    *.gpg set nobin
    autocmd BufReadPost,FileReadPost    *.gpg let &ch = ch_save|unlet ch_save
    autocmd BufReadPost,FileReadPost    *.gpg execute ":doautocmd BufReadPost " . expand("%:r")

    " Convert all text to encrypted text before writing
    autocmd BufWritePre,FileWritePre    *.gpg   %!gpg -ae 2>/dev/null
    " Undo the encryption so we are back in the normal text, directly
    " after the file has been written.
    autocmd BufWritePost,FileWritePost    *.gpg   u
  augroup END
endif

" buffer/window stuff
set hidden

"  Go to buffers with S-left/right and ^w ,. 
nmap <silent> <S-Left>  :bprev<CR>
nmap <silent> <S-Right> :bnext<CR>

"  Movement between windows with ^hjkl 
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-Left> <C-w>h
nmap <C-Down> <C-w>j
nmap <C-Up> <C-w>k
nmap <C-Right> <C-w>l

" v_K is really really annoying; disable 
vmap K k

"nnoremap <esc> :noh<return><esc>

" Delete a buffer but keep layout with ^w! 
if has("eval")
  command! Kwbd enew|bw #
  nmap     <C-w>!   :Kwbd<CR>
endif

" handle cap versions -- causes delay on showing the :
"nnoremap  :W        :w
"nnoremap  :Q        :q

hi link mailHeaderKey Identifier
hi link mailHeaderEmail String
hi link mailSubject Label
