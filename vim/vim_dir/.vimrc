
""""""""""""""""""""""""""""""
"General
""""""""""""""""""""""""""""""
"Get out of VI's compatible mode..
set nocompatible

set tags=./tags,./../tags,./../../tags,./../../../tags,./../../../../tags,./../../../../../tags,./../../../../../../tags,./../../../../../../../tags,./../../../../../../../../tags,./../../../../../../../../../tags,./../../../../../../../../../../tags,./../../../../../../../../../../../tags,./../../../../../../../../../../../../tags,./../../../../../../../../../../../../../tags,./../../../../../../../../../../../../../../tags

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

"Have the mouse enabled all the time:
set mouse=

set path+=**

set wildmenu

set nu

"Set mapleader
let mapleader = ","
let g:mapleader = ","

"Enable syntax hl
syntax enable

"Highlight search things
set hls

"Set font to Monospace 11pt
set guifont=Monospace\ 11

"Hide menu bar & tool bar of GVim
set guioptions-=m
set guioptions-=T
""""""""""""""""""""""""""""""
"Indent
""""""""""""""""""""""""""""""
"Auto indent
set ai

"Smart indet
set si

"C-style indeting
set cindent

set softtabstop=2
set expandtab
set shiftwidth=2

" 设置winmanager
let g:winManagerWindowLayout = "BufExplorer,FileExplorer"
let g:winManagerWidth = 30
nmap <silent> <leader>wm :WMToggle<cr>
let g:AutoOpenWinManager = 0

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

""""""""""""""""""""""""""""""
"Cscope
""""""""""""""""""""""""""""""
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=0
	"set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
	    cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
	    cs add $CSCOPE_DB
	endif
	set csverb
endif
nmap <leader>cs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ct :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ce :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>ci :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>cd :cs find d <C-R>=expand("<cword>")<CR><CR>

""""""""""""""""""""""""""""""
"Fast saving & quiting
""""""""""""""""""""""""""""""
nmap <silent> <leader>w :w!<cr>
nmap <silent> <leader>q :q<cr>
nmap <silent> <leader>qf :q!<cr>
nmap <silent> <leader>wq :w!<cr>:qall<cr>
nmap <silent> <leader>qq :qall<cr>

""""""""""""""""""""""""""""""
"Fast saving & loading session
""""""""""""""""""""""""""""""
nmap <silent> <leader>ms :mksession! ~/.vim/last.vim<cr>
nmap <silent> <leader>ss :source ~/.vim/last.vim<cr>

"Fast reloading of the .vimrc
nmap <leader>s :w<cr>:source ~/.vimrc<cr>
""Fast editing of .vimrc
nmap <leader>e :e! ~/.vimrc<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" "Turn backup off
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""
" Tag setting
""""""""""""""""""""""""""""""
nmap <cr> <C-]>
nmap <F7> :ts <C-R>=expand("<cword>")<CR><CR>

""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""
nmap <silent> <leader>tl :TlistToggle<cr>
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l

let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Sort_Type = "name"
let Tlist_WinWidth = 40
let Tlist_Use_SingleClock = 1
let Tlist_Auto_Open = 0

set nocp
filetype plugin on
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest


""""""""""""""""""""""""""""""
" "Enable folding, I find it very useful
""""""""""""""""""""""""""""""
"syn region myFold start="{" end="}" transparent fold
"syn sync fromstart
"set foldmethod=syntax
set nofen
set fdl=0

""""""""""""""""""""""""""""""
"Auto complete
""""""""""""""""""""""""""""""
set complete-=i

""""""""""""""""""""""""""""""" 
"lookupfile setting
""""""""""""""""""""""""""""""
let g:LookupFile_MinPatLength = 2
let g:LookupFile_PreserveLastPattern = 0
let g:LookupFile_PreservePatternHistory = 1
let g:LookupFile_AlwaysAcceptFirst = 1
let g:LookupFile_AllowNewFiles = 0
let g:LookupFile_EnableRemapCmd = 0
if filereadable("./filenametags")
	let g:LookupFile_TagExpr = '"./filenametags"'
endif
nmap <silent> <leader>lt :LUTags<cr>
nmap <silent> <leader>lb :LUBufs<cr>
nmap <silent> <leader>lw :LUWalk<cr>
nmap <silent> <F2> :LUBufs<cr>
nmap <silent> <F3> :exec "LUWalk" expand('%:p:h').'/'<cr>
nmap <silent> <F4> :exec "LUTags" expand("<cword>")<cr>

""""""""""""""""""""""""""""""" 
"Tab setting
""""""""""""""""""""""""""""""
nmap <leader>ta :tab 
nmap <silent> <leader>te :tabe<cr>
nmap <silent> <leader>ts :tab sp<cr>
nmap <silent> <leader>tc :tabc<cr>
nmap <silent> <leader>to :tabo<cr>
nmap <silent> <leader>tn :tabn<cr>
nmap <silent> <leader>tp :tabp<cr>
nmap <silent> <leader>tr :tabr<cr>

map <silent> <S-Tab> :tabp<cr>
map <silent> <Tab> :tabn<cr>

""""""""""""""""""""""""""""""" 
"quick fix
""""""""""""""""""""""""""""""
autocmd FileType c,cpp nmap <leader><space> :w!<cr>:make<cr>

autocmd BufNewFile,BufRead *.java set formatprg=astyle



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Edit current dir
map <F6> :e %:p:h<cr>

nmap <leader>m :marks<cr>

nmap <leader>j :ju<cr>

nmap <leader>/ ^i//<esc>

map <silent> <F8> :%s/	/    /g<cr>
map <silent> <F9> :%s/\s\+$//g<cr>
vmap <silent> <F9> :s/\s\+$//g<cr>

nmap <leader>rg :%s/^\s\+//<cr>:%s/  .*$//<cr>:%s/^/#修正 {{issue_title(/<cr>:%s/$/)}}/<cr>

" use NERD_commenter instead of my own shortcuts
if 0
" C++ Compiler
autocmd FileType cu,cpp,c,cc,h,hpp nnoremap aa :s*^\s\+\\|^*\0//*<cr>:noh<cr>

" Python Interpreter
autocmd FileType python nnoremap aa :s*^\s\+\\|^*\0#*<cr>:noh<cr>

"map aa :s*^\s\+\\|^*\0//*<cr>:noh<cr>
map au :s*\(^\s\+\\|^\)//*\1*<cr>:noh<cr>

map as :%s/\(.*\) \(.*\) \(.*\)/\1 \3 \2/
else 

" <leader>ca will select the comment style!!!

" comment current line
"   or comment 10 lines using 10cc
"   or comment selected lines
map cc <leader>cc
" undo comment
map cu <leader>cu
" conflict with system keys
"map cm <leader>cm
" /*
"  *
"  */
map cs <leader>cs
" comment from current cursor to the end of the line
" testaaaa -> test/*aaaa*/
" conflict with system keys
"map c$ <leader>c$
"
" comment at the end of the line
" test; -> test; //
map cA <leader>cA
endif

nmap <leader>lg oandroid.util.Log.e("gavinchen", "");<esc>2hi
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  personal settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/




"used for add code or delete/update code
"for java & C/C++
map <leader>fj o<ESC>0i/* Gavinchen:<Esc>:read !git config --get user.name<CR>kJ<Del>$a on:<Esc>:read !date -R <CR><ESC>kJ$o<ESC>0i * # TODO: replace this line with your comment<CR><Esc>0a */<CR><Esc>0i// End of Gavinchen:<Esc>:read !git config --get user.name<CR>kJ<Del>k
vmap <leader>fj xO<Esc>0i/* Gavinchen:<CR><Esc>k:read !git config --get user.name<CR>kJi<Del><Esc>$a on:<CR><Esc>k:read !date -R <CR><ESC>kJ$o<ESC>0i * # TODO: replace this line with your comment<Esc>gp<Esc>0a */<CR><Esc>0i// End of Gavinchen:<Esc>:read !git config --get user.name<CR>kJJ<Del>k
"for perl
map <leader>fp o<ESC>0i# Gavinchen:<Esc>:read !git config --get user.name<CR>kJ<Del>$a on:<Esc>:read !date -R <CR><ESC>kJ$o<ESC>0i# TODO: replace this line with your comment<CR><CR><Esc>0i# End of Gavinchen:<Esc>:read !git config --get user.name<CR>kJ<Del>k
vmap <leader>fp xO<Esc>0i# Gavinchen:<CR><Esc>k:read !git config --get user.name<CR>kJi<Del><Esc>$a on:<CR><Esc>k:read !date -R <CR><ESC>kJ$o<ESC>0i# TODO: replace this line with your comment<CR><ESC>0i=begin<Esc>gp<Esc>0a=end<CR><Esc>0a=cut<CR><CR><Esc>0i# End of Gavinchen:<Esc>:read !git config --get user.name<CR>kJJ<Del>k
"for shell
map <leader>fs o<ESC>0i# Gavinchen:<Esc>:read !git config --get user.name<CR>kJ<Del>$a on:<Esc>:read !date -R <CR><ESC>kJ$o<ESC>0i# TODO: replace this line with your comment<CR><CR><Esc>0i# End of Gavinchen:<Esc>:read !git config --get user.name<CR>kJ<Del>k
vmap <leader>fs xO<Esc>0i# Gavinchen:<CR><Esc>k:read !git config --get user.name<CR>kJi<Del><Esc>$a on:<CR><Esc>k:read !date -R <CR><ESC>kJ$o<ESC>0i# TODO: replace this line with your comment<CR><ESC>0i: INGORED UP TO << '--END-COMMENT--'<Esc>gp<Esc>0a--END-COMMENT--<CR><CR><Esc>0i# End of Gavinchen:<Esc>:read !git config --get user.name<CR>kJJ<Del>k
"for makefile
map <leader>fm o<ESC>0i# Gavinchen:<Esc>:read !git config --get user.name<CR>kJ<Del>$a on:<Esc>:read !date -R <CR><ESC>kJ$o<ESC>0i# TODO: replace this line with your comment<CR><CR><Esc>0i# End of Gavinchen:<Esc>:read !git config --get user.name<CR>kJ<Del>k
vmap <leader>fm xO<Esc>0i# Gavinchen:<CR><Esc>k:read !git config --get user.name<CR>kJi<Del><Esc>$a on:<CR><Esc>k:read !date -R <CR><ESC>kJ$o<ESC>0i# TODO: replace this line with your comment<CR><ESC>0iifdef 0<Esc>gp<Esc>0aendif<CR><CR><Esc>0i# End of Gavinchen:<Esc>:read !git config --get user.name<CR>kJJ<Del>k
"for xml
map <leader>fx o<ESC>0i<!-- Gavinchen:<Esc>:read !git config --get user.name<CR>kJ<Del>$a on:<Esc>:read !date -R <CR><ESC>kJ$o<ESC>0i# TODO: replace this line with your comment<CR><Esc>0a--><CR><CR><Esc>0i<!-- End of Gavinchen:<Esc>:read !git config --get user.name<CR>$a --><Esc>kJ<Del>k
vmap <leader>fx xO<Esc>0i<!-- Gavinchen:<CR><Esc>k:read !git config --get user.name<CR>kJi<Del><Esc>$a on:<CR><Esc>k:read !date -R <CR><ESC>kJ$o<ESC>0i# TODO: replace this line with your comment<Esc>gp<Esc>0a--><CR><CR><Esc>0i<!-- End of Gavinchen:<Esc>:read !git config --get user.name<CR>$a --><Esc>kJJ<Del>k
