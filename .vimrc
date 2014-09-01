syntax on
"colo evening
color ron
set hlsearch
set incsearch
set ic
set smartcase		" Do smart case matching
set autoindent
set number
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoread
set autowriteall
"set encoding=gbk
"set termencoding=gbk
set foldmethod=syntax
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set autowrite		" Automatically save before commands like :next and :make
"set mouse=a		" Enabme mouse usage (all modes) in terminals
let &termencoding=&encoding
set fileencodings=ucs-bom,utf8,gbk,latin1


if has("autocmd")
	autocmd FileType xml,html,c,cs,java,perl,shell,bash,cpp,python,vim,php,ruby,thrift,html set number
	autocmd FileType xml,html,c,cs,java,perl,shell,bash,cpp,python,vim,php,ruby,thrift,html set expandtab
	autocmd FileType xml,html,c,cs,java,perl,shell,bash,cpp,python,vim,php,ruby,thrift,html set ts=4
	autocmd FileType xml,html,c,cs,java,perl,shell,bash,cpp,python,vim,php,ruby,thrift,html set sw=4

	"autocmd FileType c,cpp,java,python TlistOpen
endif "has("autocmd")

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")

  function! RemoveTrailingSpace()
      if $VIM_HATE_SPACE_ERRORS != '0' &&
              \(&filetype == 'c' || &filetype == 'cpp' ||&filetype == 'python' || &filetype == 'vim')
          normal m`
          silent! :%s/\s\+$//e
          normal ``
      endif
  endfunction

  "au BufWritePre *                  call RemoveTrailingSpace()
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = '/usr/bin/ctags'	"设定linux系统中ctags程序的位置
"let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_WinWidth = 40
"let Tlist_Enable_Fold_Column = 0	"不要显示折叠树

set tags=./tags,./TAGS,tags,TAGS,~/kxfang/crawler/src/tags,../tags

:filetype plugin indent on

:set fileformat=unix

au BufRead,BufNewFile *.thrift            set filetype=thrift
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
au BufRead,BufNewFile *.py set filetype=python
au BufRead,BufNewFile *.html              setfiletype htmldjango

augroup python_prog
au!
fun! Python_fold()
  execute 'syntax clear pythonStatement'
  execute 'syntax keyword pythonStatement break continue del'
  execute 'syntax keyword pythonStatement except exec finally'
  execute 'syntax keyword pythonStatement pass print raise'
  execute 'syntax keyword pythonStatement return try'
  execute 'syntax keyword pythonStatement global assert'
  execute 'syntax keyword pythonStatement lambda yield'
  execute 'syntax match pythonStatement /\<def\>/ nextgroup=pythonFunction skipwhite'
  execute 'syntax match pythonStatement /\<class\>/ nextgroup=pythonFunction skipwhite'
  execute 'syntax region pythonFold start="^\z(\s*\)\%(class\|def\)" end="^\%(\n*\z1\s\)\@!" transparent fold'
  execute 'syntax sync minlines=2000 maxlines=4000'
  set autoindent
  set foldmethod=syntax
  "set foldopen=all foldclose=all
  set foldtext=substitute(getline(v:foldstart),'\\t','\ \ \ \ ','g')
  set fillchars=vert:\|,fold:\
  set tabstop=4 shiftwidth=4 nowrap guioptions+=b
endfun
autocmd FileType python call Python_fold()
augroup END

"""""""""""""""""""""""""""""""
" python syntax options

let python_highlight_all = 1
"""""""""""""""""""""""""""""""

let g:pydiction_location = "/home/hufei/.vim/ftplugin/pydiction/complete-dict"

function! SetDiffEnviron()
  set diff
  set scrollbind
  set scrollopt=ver,jump,hor
  set nowrap
  set fdm=diff
endfunction
:command! SetDiffEnviron call SetDiffEnviron()
