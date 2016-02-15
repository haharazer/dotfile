set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
let g:vundle_log_file="./log"
let g:vundle_default_git_proto="git"
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

"------------------
" Code Completions
"------------------
Bundle 'Valloric/YouCompleteMe'
Bundle 'ervandew/supertab'
Bundle 'mattn/emmet-vim'

"-----------------
" Fast navigation
"-----------------
Bundle 'easymotion/vim-easymotion'

"--------------
" Fast editing
"--------------
Bundle 'sjl/gundo.vim'
Bundle 'kana/vim-smartinput'
Bundle 'godlygeek/tabular'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'scrooloose/nerdcommenter' "快速注释

"--------------
" IDE features
"--------------
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-powerline'

"-------------
" Other Utils
" ------------
Bundle 'humiaozuzu/fcitx-status'

"----------------------------------------
" Syntax/Indent for language enhancement
"----------------------------------------
" web backend
Bundle '2072/PHP-Indenting-for-VIm'

" web front end
"Bundle 'othree/html5.vim'
"Bundle 'tpope/vim-haml'
"Bundle 'nono/jquery.vim'
"Bundle 'pangloss/vim-javascript'
"Bundle 'kchmck/vim-coffee-script'
"Bundle 'groenewege/vim-less'
"Bundle 'wavded/vim-stylus'

" markup language
Bundle 'tpope/vim-markdown'

" Scheme
Bundle 'kien/rainbow_parentheses.vim'

"--------------
" Color Scheme
"--------------
Bundle 'rickharris/vim-blackboard'
Bundle 'altercation/vim-colors-solarized'
Bundle 'rickharris/vim-monokai'
Bundle 'tpope/vim-vividchalk'
Bundle 'Lokaltog/vim-distinguished'
Bundle 'chriskempson/vim-tomorrow-theme'

filetype plugin indent on     " required!
