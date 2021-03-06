" Keep Track of Ctags Libraries here
set tags=/home/a9gdkzz/my_tags/tags
"set tags+=
" set tags+=/home/z1127464/Desktop/trunk/simulation/IFS/tags
" set tags+=/scratch/FUEL/std-1.4.13.0/Linux-x86_64-gcc4.4/src/rms/genMath-0.7.0/include/tags
" set tags+=/home/z1127464/Code/tags

" Extra shortcuts for tags
" set things up for vundle
" git clone https://github.com/gmarik/Vundle.vim.git "~/.vim/bundle/Vundle.vim
"
 
" :PluginInstall
 
" resets options, This should automatically occur when a user vimrc is
" found
set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'

"Plugin 'vim-scripts/taglist.vim'

" requred in bash for ctrl+s: stty stop undef # to unmap ctrl-s

" open ipython qtconsole
" run :IPython
"Plugin 'ivanov/vim-ipython'

" toggles comments with gc
Plugin 'tpope/vim-commentary.git'

" switches between header and source
" Plugin 'vim-scripts/a.vim.git'

" syntax
"Plugin 'vim-scripts/scons.vim.git'
"Plugin 'vim-scripts/SWIG-syntax.git'

" opening companion files
" might be better than a.vim?

"Plugin 'derekwyatt/vim-fswitch'
" settings are in .vim/after/plugin/fswitch.vim

" awesome motion commands
Plugin 'Lokaltog/vim-easymotion'

" autocomplete
    " cd ~/.vim/bundle/YouCompleteMe
    " ./install.sh --clang-completer
    " http://susu.github.io/posts/clang-completion-in-vim-with-youcompleteme/
    " sudo apt-get install clang-format-3.6
Plugin 'Valloric/YouCompleteMe'
"Bundle 'majutsushi/tagbar'

" shows multiple files nicely
" <F1> for help doesn't work
" doesn't show vim leader (taglist does)
" required for vim-clang-format
"Bundle 'kana/vim-operator-user.git'

call vundle#end()

filetype plugin indent on

" end vundle stuff
" TODO: move this to c files stuff?
""" clang format options ---------------------------------
" let g:clang_format#command = "clang-format-3.6"
" let g:clang_format#style_options = {
"             \ "AccessModifierOffset" : -4,
"             \ "AllowShortIfStatementsOnASingleLine" : "true",
"             \ "AlwaysBreakTemplateDeclarations" : "true",
"             \ "ColumnLimit" : 110,
"             \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
" autocmd FileType c,cpp,objc nnoremap <buffer><Leader>f :<C-u>ClangFormat<CR>
" autocmd FileType c,cpp,objc vnoremap <buffer><Leader>f :ClangFormat<CR>
" if you install vim-operator-user
" autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
" nmap <Leader>C :ClangFormatAutoToggle<CR>

" "--------- YouCompleteMe options ------------------------
" let g:ycm_register_as_syntastic_checker = 1 "default 1
" let g:Show_diagnostics_ui = 1 "default 1

"will put icons in Vim's gutter on lines that have a diagnostic set.
"Turning this off will also turn off the YcmErrorLine and YcmWarningLine
"highlighting
" let g:ycm_enable_diagnostic_signs = 1  " signs in gutter
" let g:ycm_enable_diagnostic_highlighting = 1
" let g:ycm_always_populate_location_list = 1 "default 0
" let g:ycm_open_loclist_on_ycm_diags = 1 "default 1
" let g:ycm_complete_in_strings = 1 "default 1
" let g:ycm_collect_identifiers_from_tags_files = 1 "default 0
" let g:ycm_global_ycm_extra_conf="~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
" let g:ycm_confirm_extra_conf = 0  "ask before loading, security issue
" let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
" let g:ycm_filetype_whitelist = { '*': 1 }  " only work on certain filetypes?
" let g:ycm_key_invoke_completion = '<C-Space>'

" fixed unreadable #include errors in YCM
" highlight link YcmErrorSection Error
" nnoremap <F11> :YcmForceCompileAndDiagnostics <CR>
"--------- END YouCompleteMe options ------------------------

 

"Allows delete to auto delete tabs, past eol breaks etc"
"Inserts 4 spaces instead of Tab"
set backspace=2 
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smarttab
set expandtab

" autocompletion of file browsing
set wildmenu
set wildmode=longest:list
set title  " show name of file in tab
 

" show white space
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" avoid hitting Esc so much
inoremap jk <C-[>

" imap <silent> <Down> <C-o>gj
" imap <silent> <Up> <C-o>gk
" nmap <silent> <Down> gj
" nmap <silent> <Up> gk

"display line numbers
set number

"sets shortcut to toggle off numbers, F2 toggles paste and nopaste
nnoremap <F2> :set nonumber!<CR>
set pastetoggle=<F2>

" #Map arrows to original jump (CI CO)
nnoremap <C-Left> <C-O>
nnoremap <C-Right> <C-I>

" tab movement mapped to (CI CO)
nnoremap <C-I> :tabprev<CR>
nnoremap <C-O> :tabnext<CR>
nmap <C-K> <C-w><Up>
nmap <C-J> <C-w><Down>
 
nmap <C-L> <C-w><Right>
nmap <C-H> <C-w><Left>

"sp and vsp defaults"
set splitbelow
set splitright

" window resizing
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>
""" MOVE THIS TO PYTHON FILE -------------------
""" python-mode mappings ----------------------------
let g:pymode_doc_key = 'K'
let g:pymode_rope_completion = 0
let g:pymode_rope_lookup_project = 0

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" let g:pymode_folding = 0  " comletely disable folding
" set foldlevelstart=2
"Lint

let g:pymode_lint = 1
" let g:pymode_lint_checker = "pylint, pep8"  " mccabe, pyflakes, others?
let g:pymode_lint_checker = "flake8"  " mccabe, pyflakes, others?
let g:pymode_lint_write = 1  " auto check on save
" let g:pymode_lint_config = '$HOME/.vim/pylint.rc'
let g:pymode_lint_options_pep8 = {'max_line_length': 110}  " if no config file

" then draw the line in the right place
let g:pymode_options_max_line_length = g:pymode_lint_options_pep8['max_line_length']
highlight ColorColumn term=reverse cterm=reverse gui=reverse  " gray

""" easymotion mappings -----------------------------
" let g:EasyMotion_do_mapping = 1 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding
nmap <Space> <Plug>(easymotion-s)
" s2 also an option
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
" somehow these get over written

nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)

" easy way to make vertical splits bigger
" nnoremap <C-n> <C-w>>

" for some reason <C-n> doesn't work

" for interaction with ipython, needs running ipython qtconsole and :IPython
nnoremap <silent> <F4> :silent w <CR>:silent python3 run_this_file()<CR>
inoremap <F4> <ESC>:w <CR>:python3 run_this_file()<CR>

" search options
set incsearch
set hlsearch

" get rid of highlighting
nnoremap <silent><CR> :nohlsearch<CR><CR>


" not sure if these are needed
" highlight NonText guibg=#060606
" highlight Folded guibg=#0A0A0A guifg=#9090D0
" complete options (what does this set?)
set completeopt=menu,menuone

" leader key
let mapleader=","

" Spellcheck trigger
"nmap <silent> <leader>sp :set spell!<CR>

" Key mapping for simple .vimrc editing
nmap <silent> <leader>ev :tabe $MYVIMRC<CR>

" Source .vimrc file
" map <leader>sv :source $MYVIMRC<CR>

" Open tag bar
map <silent> <leader>l :TagbarToggle<CR>

" Open taglist, does multiple buffers

" map <silent> <leader>; :TlistToggle<CR>

" Run ctags - read by YCM
map <leader>tg :! ctags -R .<CR>
map <leader>fp :PymodeLintAuto<CR>

" file types to recognize
au BufNewFile,BufRead SCons* set filetype=scons
au BufNewFile,BufRead CMake* set filetype=cmake
au BufNewFile,BufRead *.i set filetype=swig
au BufNewFile,BufRead *.swig set filetype=swig
au bufnewfile,bufread *.ino set filetype=c  " arduino files
autocmd BufRead,BufNewFile *.launch setfiletype roslaunch
autocmd FileType scons set commentstring=#\ %s
autocmd FileType cmake set commentstring=#\ %s
autocmd FileType cpp set commentstring=//\ %s
autocmd FileType swig set commentstring=//\ %s
autocmd FileType c set commentstring=//\ %s

"  a.vim settings
"  prevent opening file if not found
let g:alternateNoDefaultAlternate=1

" allow sudo write
cmap w!! w !sudo tee > /dev/null %

" close menu (doesn't work on everything)
autocmd CursorMovedI *  if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif

" Execution
nnoremap  df :exec 'w' <cr> :exec '! python3 %' <cr>
nnoremap <buffer> ! :exec '! python3 %' <cr>
nnoremap <buffer> @ :exec 'w' <cr>
nnoremap <buffer> > <C-w>>
nnoremap <buffer> < <C-w><

" command R !./%
map <leader>a oassert(False)<ESC>
" map <leader>z ostd::cout <<
" imap <leader>x <Space> << std::endl;<ESC>
map <leader>w oraw_input("break")<ESC>
map <leader>st oimport pdb<ESC>opdb.set_trace()<ESC>
command! -nargs=1 SS let @/ = '\V'.escape(<q-args>, '\')

"color scheme
colorscheme monokai
"colorscheme dracula

" colorscheme Desert
"
""COMMENT GC FUNCTIONALITY
""Maintainer:   Tim Pope <http://tpo.pe/>
"" Version:      1.3
"" GetLatestVimScripts: 3695 1 :AutoInstall: commentary.vim
"if exists("g:loaded_commentary") || &cp || v:version < 700
"  finish
"endif
"let g:loaded_commentary = 1
"
"function! s:surroundings() abort
"  return split(get(b:, 'commentary_format', substitute(substitute(
"        \ &commentstring, '\S\zs%s',' %s','') ,'%s\ze\S', '%s ', '')), '%s', 1)
"endfunction
"function! s:strip_white_space(l,r,line) abort
"  let [l, r] = [a:l, a:r]
"  if stridx(a:line,l) == -1 && stridx(a:line,l[0:-2]) == 0 && a:line[strlen(a:line)-strlen(r[1:]):-1] == r[1:]
"    return [l[0:-2], r[1:]]
" endif
"  return [l, r]
"endfunction
"
"function! s:go(type,...) abort
"  if a:0
"    let [lnum1, lnum2] = [a:type, a:1]
"  else
"    let [lnum1, lnum2] = [line("'["), line("']")]
"  endif
"  let [l_, r_] = s:surroundings()
"  let uncomment = 2
"
"  for lnum in range(lnum1,lnum2)
"    let line = matchstr(getline(lnum),'\S.*\s\@<!')
"    let [l, r] = s:strip_white_space(l_,r_,line)
"    if line != '' && (stridx(line,l) || line[strlen(line)-strlen(r) : -1] != r)
"      let uncomment = 0
"    endif
"  endfor
"
"  for lnum in range(lnum1,lnum2)
"    let line = getline(lnum)
"    if strlen(r) > 2 && l.r !~# '\\'
"      let line = substitute(line,
"            \'\M'.r[0:-2].'\zs\d\*\ze'.r[-1:-1].'\|'.l[0].'\zs\d\*\ze'.l[1:-1],
"            \'\=substitute(submatch(0)+1-uncomment,"^0$\\|^-\\d*$","","")','g')
"    endif
"
"    if uncomment
"      let line = substitute(line,'\S.*\s\@<!','\=submatch(0)[strlen(l):-strlen(r)-1]','')
"    else
"      let line = substitute(line,'^\%('.matchstr(getline(lnum1),'^\s*').'\|\s*\)\zs.*\S\@<=','\=l.submatch(0).r','')
"    endif
"    call setline(lnum,line)
"  endfor
"
"  let modelines = &modelines
"  try
"    set modelines=0
"    silent doautocmd User CommentaryPost
"  finally
"    let &modelines = modelines
"  endtry
"endfunction
"
"function! s:textobject(inner) abort
"  let [l_, r_] = s:surroundings()
"  let [l, r] = [l_, r_]
"  let lnums = [line('.')+1, line('.')-2]
"  for [index, dir, bound, line] in [[0, -1, 1, ''], [1, 1, line('$'), '']]
"    while lnums[index] != bound && line ==# '' || !(stridx(line,l) || line[strlen(line)-strlen(r) : -1] != r)
"      let lnums[index] += dir
"      let line = matchstr(getline(lnums[index]+dir),'\S.*\s\@<!')
"      let [l, r] = s:strip_white_space(l_,r_,line)
"    endwhile
"  endfor
"
"  while (a:inner || lnums[1] != line('$')) && empty(getline(lnums[0]))
"    let lnums[0] += 1
"  endwhile
"
"  while a:inner && empty(getline(lnums[1]))
"    let lnums[1] -= 1
"  endwhile
"
"  if lnums[0] <= lnums[1]
"    execute 'normal! 'lnums[0].'GV'.lnums[1].'G'
"  endif
"
"endfunction
"
"xnoremap <silent> <Plug>Commentary     :<C-U>call <SID>go(line("'<"),line("'>"))<CR>
"nnoremap <silent> <Plug>Commentary     :<C-U>set opfunc=<SID>go<CR>g@
"nnoremap <silent> <Plug>CommentaryLine :<C-U>set opfunc=<SID>go<Bar>exe 'norm! 'v:count1.'g@_'<CR>
"onoremap <silent> <Plug>Commentary        :<C-U>call <SID>textobject(0)<CR>
"nnoremap <silent> <Plug>ChangeCommentary c:<C-U>call <SID>textobject(1)<CR>
"nmap <silent> <Plug>CommentaryUndo <Plug>Commentary<Plug>Commentary
"command! -range -bar Commentary call s:go(<line1>,<line2>)
"
"if !hasmapto('<Plug>Commentary') || maparg('gc','n') ==# ''
"  xmap gc  <Plug>Commentary
"  nmap gc  <Plug>Commentary
"  omap gc  <Plug>Commentary
"  nmap gcc <Plug>CommentaryLine
"  if maparg('c','n') ==# ''
"    nmap cgc <Plug>ChangeCommentary
"  endif
"  nmap gcu <Plug>Commentary<Plug>Commentary
"endif

" vim:set et sw=2:

"
" Like windo but restore the current window.
function! WinDo(command)
  let currwin=winnr()
  execute 'windo ' . a:command
  execute currwin . 'wincmd w'
endfunction
com! -nargs=+ -complete=command Windo call WinDo(<q-args>)

" Like tabdo but restore the current tab.
function! TabDo(command)
  let currTab=tabpagenr()
  execute 'tabdo ' . a:command
  execute 'tabn ' . currTab
endfunction
com! -nargs=+ -complete=command Tabdo call TabDo(<q-args>)

" opens variable definition
map <C-\> <CR>:exec("tj ".expand("<cword>"))<CR>
nmap <leader>v :vsp <CR>:exec("tj ".expand("<cword>"))<CR>
"Hack to allow expansion over multiple words with period.  expands current
"word with period allowed to be part of current word (for files mainly).
map <leader>sv :vsp<CR>:set iskeyword+=.<CR>:let myword=expand('<cword>')<CR>:set iskeyword-=.<CR>:exec("tj ".expand(myword))<CR>
map <leader>t :tabe <CR>:exec("tj ".expand("<cword>"))<CR>

"opens header or cpp through ctags"
map <leader>p :vsp \| exec("tj ".expand('%:t:r') . '.hpp')<CR>
map <leader>h :vsp \| exec("tj ".expand('%:t:r') . '.h')<CR>
map <leader>c :vsp \| exec("tj ".expand('%:t:r') . '.cpp')<CR>

map <leader><leader>m :vsp \| exec("tj ".expand('<cword>') . '.msg')<CR>
map <leader><leader>h :vsp \| exec("tj ".expand('<cword>') . '.h')<CR>
map <leader><leader>a :vsp \| exec("tj ".expand('<cword>') . '.action')<CR>
map <leader><leader>p :vsp \| exec("tj ".expand('<cword>') . '.hpp')<CR>
map <leader><leader>c :vsp \| exec("tj ".expand('<cword>') . '.cpp')<CR>
map <leader><leader>sr :vsp \| exec("tj ".expand('<cword>') . '.srv')<CR>
map <leader><leader>l :vsp \| exec("tj ".expand('<cword>') . '.launch')<CR>

nnoremap <leader>s :call SetIsKeyWordWithPeriod()<cr>
let g:periodiskeyword=0

function! SetIsKeyWordWithPeriod()
    if g:periodiskeyword == 0
        set iskeyword+=.
        let g:periodiskeyword=1
        echo "Period IS keyword!"
    else
        set iskeyword-=.
        let g:periodiskeyword=0
        echo "Period IS NOT keyword!"
    endif
  endfunction


"Moves vsp to new window
map <leader>n <C-w>T <CR>

"diffthis
map <leader>dt :diffthis <CR>
map <leader>do :diffoff <CR>

" set paste
map <leader>sp :set paste <CR>
map <leader>np :set nopaste <CR>

" fix indentation
map <leader>fi =a{ <CR>

"Copy to clipboard (Only in gvim)
map <leader>y "+y

" Prevents pasting from yaking replaced content
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction

function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction
" NB: this supports "rp that replaces the selection by the contents of @r
vnoremap <silent> <expr> p <sid>Repl()
set nowrap

" swaps apostrophe and backtick for marking purposes
nnoremap ' `
nnoremap ` '
onoremap ' `
onoremap ` '

"
" oo adds line underneath - rethink these
" nnoremap oo o<Esc>k
" nnoremap OO O<Esc>j
"

" Get rid of ^M
