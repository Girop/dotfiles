call plug#begin()
	Plug 'morhetz/gruvbox'
	Plug 'tpope/vim-fugitive'
call plug#end()

nnoremap <space> <nop>
let mapleader = " "

"Color section
set termguicolors
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = "medium"
let g:gruvbox_italic = 0
let g:gruvbox_bold = 0
filetype plugin indent on

"different cursor style for insert and normal modes - warning: may not work properly on some term-emulators
let &t_SI = "\<esc>[6 q"
let &t_SR = "\<esc>[4 q"
let &t_EI = "\<esc>[2 q"
	
set nocompatible "use vim defaults instead of vi ones
set belloff=all "disable bell on invalid movement
set encoding=utf-8
set number relativenumber "line numbering
set nowrap 
set timeoutlen=1000 ttimeoutlen=0 "tmux compatibility
set updatetime=200 "gotta go fast
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smartindent autoindent "tabs are *very* smart now, emit spaces
set incsearch hlsearch "seeing results of search instantly
set ignorecase smartcase "more pleasant search
set showmode showmatch
set history=1000
set backspace=indent,eol,start " backspace through anything
set scrolloff=5 sidescroll=1 sidescrolloff=8 display+=lastline "more lines visible when scrolling
set nobackup nowritebackup noswapfile "there are supposedly some problems with those
set autoread 
set path+=** wildmenu "find files recursively
set hidden "stupid confirmation pop-up is gone
set cursorline
setlocal spell spelllang=en_us

"vimrc itself related
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>es :so $MYVIMRC<cr>

"pane movement
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap sv <c-w>v
nnoremap ss <c-w>s
nnoremap sq :wq!<cr>

" Fast escape from insert mode
inoremap jk <esc> 

"swap current and previous buffer
nnoremap <leader><leader> <c-^> 

"reset highlight
nnoremap <leader>h <cmd>nohlsearch<cr>

"put word in " and ' respectively
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

"general atocmds
augroup GeneralGroup
    autocmd!
    autocmd bufnewfile * silent write
	autocmd textchanged,textchangedi <buffer> silent write
augroup END

"improved netrw
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_liststyle=3

"Center view when jumping up/down
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

"Moving sections when in V mode
vnoremap J :m'>+1<CR>gv=gv
vnoremap K :m'<-2<CR>gv=gv

"Stay on current position when collapsing lines
nnoremap J mzJ`z

"Centering of stuff
nnoremap n nzzzv
nnoremap N Nzzzv



"--- status bar --- recreated thanks to some reddit user
set laststatus=2 "set the status bar (2 means always)
set noshowmode "disable showmode - i.e. don't show mode texts like --insert-- in current statusline.
let g:currentmode={
            \ 'n'  : 'normal ',
            \ 'v'  : 'visual ',
            \ 'V'  : 'v·line ',
            \ 'Vb' : 'v·block ',
            \ 'i'  : 'insert ',
            \ 'R'  : 'replace ',
            \ 'r'  : 'replace ',
            \ 'vr' : 'v·replace ',
            \ 'f'  : 'finder ',
            \ 'c'  : 'command ',
            \ 't'  : 'terminal ',
            \ 's'  : 'select ',
            \ '!'  : 'shell '
            \}

" define the icons for specific file types
function! GetFileTypeIcon()
    let l:filetype = &filetype
    if l:filetype == 'python'
        return ''
    elseif l:filetype == 'cpp' || l:filetype == 'hpp'
        return ''
    elseif l:filetype == 'c' || l:filetype == 'h'
        return ''
    elseif l:filetype == 'markdown'
        return ''
    elseif l:filetype == 'sh'
        return ''
    elseif l:filetype == 'zsh'
        return ''
    elseif l:filetype == 'tex'
        return ''
    elseif l:filetype == 'vim'
        return ''
    elseif l:filetype == 'conf'
        return ''
    elseif l:filetype == 'txt'
        return '󰯂'
    else
        return '󰈙'
    endif
endfunction

highlight StslineNormalColor ctermbg=172 ctermfg=0 guibg=#000000 guifg=#afafaf
highlight StslineInsertColor  ctermbg=2 ctermfg=0 guibg=#00ff00 guifg=#000000  "
highlight StslineReplaceColor ctermbg=1 ctermfg=15 guibg=#ff0000 guifg=#ffffff "
highlight StslineVisualColor  ctermbg=3 ctermfg=0 guibg=#ffff00 guifg=#000000  "
highlight StslineCommandColor ctermbg=4 ctermfg=15 guibg=#0000ff guifg=#ffffff " 
highlight StslineTerminalColor ctermbg=240 ctermfg=15 guibg=#0000ff guifg=#000000

highlight OrangeFileIcon      ctermbg=236 ctermfg=177 guibg=#FFD700 guifg=#000000     
highlight StatusPercent       ctermbg=0 ctermfg=15 guibg=#000000 guifg=#ffffff  
highlight StatusBuffer        ctermbg=236 ctermfg=220 guibg=#1E1E1E guifg=#FFCC00 
highlight StatusLocation      ctermbg=4 ctermfg=0 guibg=#0000ff guifg=#000000  
highlight StatusModified      ctermbg=0 ctermfg=5 guibg=#000000 guifg=#ff00ff
highlight StatusFilePath      ctermbg=236 ctermfg=167 guibg=#2D2D2D guifg=#E06C75  
highlight StatusGitColour     ctermbg=28 ctermfg=0 guibg=#2BBB4F guifg=#080808
highlight StatusTabs      ctermbg=236 ctermfg=150 guibg=#282C34 guifg=#98C379

highlight TabLineFill     ctermbg=236   ctermfg=167  guibg=#000000 guifg=#ffffff
highlight TabLine         ctermbg=236   ctermfg=8   guibg=#000000 guifg=#808080
highlight TabLineSel      ctermbg=236   ctermfg=167  guibg=#000000 guifg=#ffffff
highlight TabLineModified ctermbg=236   ctermfg=1   guibg=#000000 guifg=#ff0000

" define the function to update the statusline
function! UpdateStatusLine()
  let l:mode = mode()
  let l:mode_symbol = ''  " displays symbol for all modes
  let l:mode_text = get(g:currentmode, l:mode, 'normal')
  
  if l:mode ==# 'i'
    let l:color = 'StslineInsertColor'
  elseif l:mode ==# 'r' || l:mode ==# 'r' || l:mode ==# "\<c-v>"
    let l:color = 'StslineReplaceColor'
  elseif l:mode ==# 'v' || l:mode ==# 'v'
    let l:color = 'StslineVisualColor'
  elseif l:mode ==# 't'
    let l:color = 'StslineCommandColor'
  elseif l:mode ==# 'c' || l:mode ==# '!'
    let l:color = 'StslineCommandColor'
  elseif l:mode ==# 's'
    let l:color = 'StslineCommandColor'
  elseif l:mode ==# 't'
    let l:color = 'StslineNormalColor'
  else
    let l:color = 'StslineNormalColor'
  endif

" Construct the status line
  let &statusline = '%#' . l:color . '#'" Apply box colour
  let &statusline .= ' ' . l:mode_symbol . ' '          " Mode symbol
  let &statusline .= ' ' . l:mode_text . ''" Mode text with space before and after
  let &statusline .= '%{&readonly ? "ReadOnly " : ""}'        " Add readonly indicator 
  let &statusline .= '%#StatusGitColour# %{b:gitbranch}'
  let &statusline .= '%#StatusFilePath#  %F %m %{&modified ? " " : ""}'
  let &statusline .= '%='
  let &statusline .= '%#OrangeFileIcon#  %{GetFileTypeIcon()} '
  let &statusline .= '%#OrangeFileIcon#%{&filetype ==# "" ? "No Type" : &filetype}  '
  let &statusline .= '%#StatusTabs#  %p%% ' 
  let &statusline .= '%#StatusTabs# %-5.( %l/%L, %c%V%) '
endfunction

" update the status line when changing modes
augroup StatusLine
  autocmd!
  autocmd InsertEnter,InsertLeave,WinEnter,BufEnter,CmdlineEnter,CmdlineLeave,CursorHold,CursorHoldI,TextChanged,TextChangedI,ModeChanged * call UpdateStatusLine()
augroup END

" initial status line update
call UpdateStatusLine()
" ----------------------------------------------------------------------------------------------------

function! StatuslineGitBranch()
    let b:gitbranch= ""
    if !&modifiable
        return
    endif
    try
        let l:gitrevparse = system("git branch --show-current")
        if !v:shell_error
            let b:gitbranch="( ".substitute(l:gitrevparse, '\n', '', 'g').") "
        endif
    catch
    endtry
endfunction

augroup GetGitBranch
  autocmd!
  autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
augroup END
"--- end status bar ---
