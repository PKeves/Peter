"todo
"noremap <expr> j v:count ? 'j' : 'gj' "noremap <expr> k v:count ? 'k' : 'gk'

"general
set timeoutlen=300

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

"pasting
set clipboard+=unnamed
set go+=a
set nopaste

"search
set gdefault
set ignorecase
set incsearch
set nohlsearch
set smartcase

"insert mode
inoremap jj <c-o>
inoremap <left> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <right> <nop>

"normal mode
"<s-tab> : <c-i>
nnoremap <c-i> <<
nnoremap <tab> >>

"visual mode
"<s-tab> : <c-i>
xnoremap <c-i> <gv
xnoremap <tab> >gv

"normal, visuaul select, operator pending mode  
noremap ! qt
noremap @ @t
noremap - <c-x>
noremap + <c-a>
noremap q ge
noremap Q gE
noremap Y y$
noremap u <c-o>
noremap U <c-i>
noremap [ {
noremap ] }
noremap \ n
noremap | N
noremap <expr> <silent> dd (getline('.') =~ '^$' ? '"_' : '').'dd'
noremap gp "0p
noremap gP "0P
noremap gh 0
noremap gl g_
"go to place where last normal mode was triggered
noremap gn `. 
"go to match (parenthesis or bracket)
noremap gm %  
noremap H ^
noremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'
noremap J <c-d>
noremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
noremap K <c-u>
noremap L $
noremap : ,
noremap ' <c-v> 
noremap <silent> <cr> o<esc>k
"<s-cr> : <c-k>
noremap <silent> <c-k> O<esc>j
noremap vv V
noremap V v$
noremap n *
noremap N #
noremap m mt
noremap M `t
noremap , J
noremap < gJ
noremap <space> /
"<s-space> : <c-x>
noremap <c-x> ?
noremap <left> <nop>
noremap <up> <nop>
noremap <down> <nop>
noremap <right> <nop>
