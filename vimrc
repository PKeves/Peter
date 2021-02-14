"improve:
"? to match gb im vscode vim | hint : nnoremap <silent> u :let @/=expand('<cword>')<cr>cgn

"todo:
"noremap <expr> j v:count ? 'j' : 'gj' "noremap <expr> k v:count ? 'k' : 'gk'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"auto
"autosave
autocmd TextChanged,TextChangedI <buffer> silent write
augroup auto_comment
	au!
	au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

"general
colorscheme delek
"autocomplete with dictionary words when spell check is on
set complete+=kspellset autoindent
"always use vertical diffs
set diffopt+=vertical
set encoding=utf-8
set showcmd
set timeoutlen=300
syntax on

"indentation
set autoindent
set backspace=2
set copyindent
set expandtab
set preserveindent
set shiftround
set shiftwidth=2
set smartindent
set tabstop=2

"paste
set clipboard+=unnamed
set go+=a
set nopaste

"search
set gdefault
set ignorecase
set incsearch
set nohlsearch
set smartcase

"ui
set number
set numberwidth=1
set relativenumber
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"insert mode
inoremap <tab> <c-r>=Smart_TabComplete()<cr>
inoremap <c-w> <esc>:q!<cr>
inoremap jj <esc>ciw
inoremap jk <esc>cc
inoremap <left> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <right> <nop>

"normal mode
nnoremap = ==
nnoremap u J
nnoremap gu gJ
nnoremap < <<
nnoremap > >>

"normal, visuaul select, operator pending mode
noremap ! qt
noremap @ @t
noremap - <c-x>
noremap + <c-a>
noremap q <c-o>zz
noremap Q <c-i>zz
noremap <c-w> :q!<cr>
noremap Y y$
noremap U <c-v>
noremap <c-p> "0p
"<s-c-p> : <c-k>
noremap <c-k> "0P
noremap <bslash> nzz
noremap \| Nzz
noremap <expr> <silent> dd (getline('.') =~ '^$' ? '"_' : '').'dd'
noremap gm `.zz
noremap H ^
noremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'
noremap J <c-d>
noremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
noremap K <c-u>
noremap L $
noremap : ,
noremap <silent> <cr> :<c-u>call append(line("."),   repeat([""], v:count1))<cr>
"<s-cr> : <c-t>
noremap <silent> <c-t> :<c-u>call append(line(".")-1, repeat([""], v:count1))<cr>
noremap <c-Z> u
"<s-c-z> : <c-r>
noremap <c-y> <c-r>
noremap vv V
noremap V v$
noremap n *zz
noremap N #zz
noremap m mt
noremap M `tzz
noremap / :%s/\<<c-r>=expand('<cword>')<cr>\>//gc<Left><Left><Left>
noremap ? :
noremap <space> /
"<s-space> :  c-l>
noremap <c-l> ?
noremap <left> <nop>
noremap <up> <nop>
noremap <down> <nop>
noremap <right> <nop>

"visual mode
xnoremap =  =gv
xnoremap <  <gv
xnoremap >  >gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<c-X>\<c-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<c-X>\<c-F>"                         " file matching
  else
    return "\<c-X>\<c-O>"                         " plugin matching
  endif
endfunction
