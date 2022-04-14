"=====================
"======= Plugins
"=====================
call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'gcmt/wildfire.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yegappan/taglist'
Plug 'mg979/vim-visual-multi'
Plug 'connorholyday/vim-snazzy'
Plug 'kevinhwang91/rnvimr'
Plug 'mg979/vim-xtabline'
Plug 'mbbill/undotree'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'mzlogin/vim-markdown-toc'
Plug 'Chiel92/vim-autoformat'
Plug 'liuchengxu/vista.vim'
Plug 'brooth/far.vim'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/calendar.vim'
Plug 'lambdalisue/suda.vim'

call plug#end()


"=====================
"======= coc extensions
"=====================
let g:coc_global_extensions =['coc-marketplace', 
                             \ 'coc-vimlsp', 
                             \ 'coc-clangd', 
                             \ 'coc-yaml', 
                             \ 'coc-explorer', 
                             \ 'coc-lists', 
                             \ 'coc-python', 
                             \ 'coc-tasks', 
                             \ 'coc-tsserver',
                             \ 'coc-snippets',
                             \ 'coc-translator',
                             \ ]

"=====================
"======= coc config
"=====================                           
" TextEdit might fail if hidden is not set.
set hidden

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-P> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)


"=====================
"======= 配色方案
"=====================
color snazzy
"let g:SnazzyTransparent = 0.5

"=====================
"======= 改键
"=====================
map S :w<CR>
map s <nop>
map Q :q<CR>
map R :source $MYVIMRC<CR>
noremap J 5j
noremap K 5k
noremap H 5h
noremap L 5l
noremap = nzz
noremap - Nzz

"=====================
"=======自用配置
"=====================
set number                            "显示行号
set relativenumber                    "相对行号
set wildmenu                          "下方显示候选项
set cursorline                        "高亮当前行
"set cursorcolumn                      "高亮当前列
set wrap                              "自动换行
set showcmd                           "显示命令
set hlsearch                          "高亮显示
exec "nohlsearch"
set incsearch                         "搜索时高亮
set ignorecase                        "忽略搜索时大小写
set smartcase                         "智能大小写搜索
set scrolloff=5                       "上下保留5行
set autoread                          "自动读取外部更改
syntax on                             "代码高亮

"=====================
"=======他人配置
"=====================
set nocompatible                      "不使用VI的兼容模式（启用后可能会导致问题）
set backspace=indent,eol,start        "允许用退格键删除字符
set confirm                           "没有保存或文件只读时弹出确认
set shortmess=atI                     "启动时隐去援助提示
set novisualbell                      "不要闪烁
set tabstop=4                         "tab缩进深度
set shiftwidth=4                      "自动缩进深度
set expandtab
set smarttab
set cindent                           "c文件自动缩进
set autoindent                        "自动对齐
set smartindent                       "智能缩进
set showmatch                         "显示匹配
set ruler                             "显示标尺，就是在右下角显示光标位置
set laststatus=2                      "启动显示状态行
autocmd InsertLeave * se nocul        "浅色显示当前行
set fillchars=vert:/                  "被分割窗口之间显示空白
set fillchars=stl:/ 
set fillchars=stlnc:/
set guioptions-=m                     "禁止显示菜单和工具条
set guioptions-=T
set laststatus=2                      "总是显示状态栏
let g:Powerline_colorscheme='solarized256'  "设置状态栏主题风格
syntax keyword cppSTLtype initializer_list
set encoding=utf-8                    "编码设置

set pyxversion=3
set pyx=3

"=====================
"=======Taglist
"=====================
filetype on
let Tlist_Ctags_Cmd ='/usr/local/bin/ctags'
