call plug#begin('~/.vim/plugged')

" leave some space in between
" Initialize plugin system
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
"Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'morhetz/gruvbox'
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4' }
Plug 'nvim-pack/nvim-spectre'
"Plug 'folke/tokyonight.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'mxw/vim-jsx'
Plug 'mileszs/ack.vim'
Plug 'f-person/git-blame.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'mechatroner/rainbow_csv'
call plug#end()

" ack and ripgrep
" " ack.vim --- {{{

" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'

" Auto close the Quickfix list after pressing '<enter>' on a list item
" let g:ack_autoclose = 1

" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
cnoreabbrev Ack Ack!

" Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>/ :Ack!<Space>
" }}}

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>


" we will add keybinds below this comment.

"Changing default NERDTree arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:ag_default_opts = '--nofilename'

" ignore case
set ic
" Fold lines
set foldmethod=indent
set foldlevel=99
set iskeyword+=#
nnoremap <leader>zz :set foldlevel=1<CR>
nnoremap <leader>za :set foldlevel=99<CR>
" Terminal Integrated
" " set
"
lua require("toggleterm").setup()
" Load the plugin

" Theme
" Activate the Tokyo Night theme
" colorscheme tokyonight
colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
" (activating jsx highlighting) set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact

" vim airline settings
let g:airline#extensions#tabline#enabled = 1

" Prettier
" command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" relative path clipboard
:command Rpath :let @+ = expand("%")

" Integrated Terminal toggle
nnoremap <leader>t ::ToggleTerm size=40 dir=~${pwd} direction=float name=desktop<CR>
" global search nvim spectre
nnoremap <leader>S :lua require("spectre").toggle()<CR>
nnoremap <leader>sw :lua require("spectre").open_visual({select_word=true})<CR>
vnoremap <leader>sw <esc>:lua require("spectre").open_visual()<CR>
nnoremap <leader>sp :lua require("spectre").open_file_search({select_word=true})<CR>
 
" Icons
set encoding=UTF-8
set guifont=DroidSansMono\ Nerd\ Font\ 11

" Nerdtree find current file

" Map Ctrl+N to NERDTreeFind
nnoremap <C-n> :NERDTreeFind<CR>

"autocmd BufEnter * lcd %:p:h
nnoremap <C-t> :NERDTreeToggle<CR>
    vmap ++ <plug>NERDCommenterToggle
    nmap ++ <plug>NERDCommenterToggle
    " open NERDTree automatically
    "autocmd StdinReadPre _ let s:std_in=1
    "autocmd VimEnter _ NERDTree
    let g:NERDTreeGitStatusWithFlags = 1
    "let g:WebDevIconsUnicodeDecorateFolderNodes = 1
    "let g:NERDTreeGitStatusNodeColorization = 1
    "let g:NERDTreeColorMapCustom = {
    "\ "Staged" : "#0ee375",
     "\ "Modified" : "#d9bf91",
     "\ "Renamed" : "#51C9FC",
     "\ "Untracked" : "#FCE77C",
     "\ "Unmerged" : "#FC51E6",
     "\ "Dirty" : "#FFBD61",
     "\ "Clean" : "#87939A",
     "\ "Ignored" : "#808080"
     "\ }
    let g:NERDTreeIgnore = ['^node_modules$']
    " vim-prettier
    "let g:prettier#quickfix*enabled = 0
    "let g:prettier#quickfix_auto_focus = 0
    " prettier command for coc
    command! -nargs=0 Prettier :CocCommand prettier.formatFile
    " run prettier on save
    "let g:prettier#autoformat = 0
    "autocmd BufWritePre *.js,_.jsx,_.mjs,_.ts,_.tsx,_.css,_.less,_.scss,_.json,_.graphql,_.md,_.vue,_.yaml,\_.html PrettierAsync
    " ctrlp
    let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
    " j/k will move virtual lines (lines that wrap)
    noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
    noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
    set number
    set smarttab
    set cindent
    set tabstop=2
    set shiftwidth=2
    " always uses spaces instead of tab characters
    set expandtab
    " \***\* for nord time something **\*\*\*\*\*
    " sync open file with NERDTree
    " " Check if NERDTree is open or active
    "function! IsNERDTreeOpen()
    " return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
    "endfunction
    " Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
    " file, and we're not in vimdiff
    "function! SyncTree()
    " if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    " NERDTreeFind
    " wincmd p
    " endif
    "endfunction
    " Highlight currently open buffer in NERDTree
    "autocmd BufEnter \* call SyncTree()
    "\***\* end here **\*\*\*\*\*\*\*\*
    " coc config
    let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-tsserver',
    \ 'coc-eslint',
    \ 'coc-prettier',
    \ 'coc-json',
    \ ]
    " from readme
    " if hidden is not set, TextEdit might fail.
    set updatetime=300
    " don't give |ins-completion-menu| messages.
    set shortmess+=c
    " always show signcolumns
    set signcolumn=yes
    set signcolumn=yes
    " Use tab for trigger completion with characters ahead and navigate.
    " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
    inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
    endfunction
    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()
    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
    " Coc only does snippet and additional edit on confirm.
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    " Or use `complete_info` if your vim support it, like:
    " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    " Use `[g` and `]g` to navigate diagnostics
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)
    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    " Use K to show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    function! s:show_documentation()
    if (index(['vim','help'], &filtype) >= 0)
    execute 'h '.expand('<cword>')
    else
    call CocAction('doHover')
    endif
    endfunction
    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold \* silent call CocActionAsync('highlight')
    " Remap for rename current word
    nmap <F2> <Plug>(coc-rename)
    " Remap for format selected region
    xmap <leader>f <Plug>(coc-format-selected)
    nmap <leader>f <Plug>(coc-format-selected)
    augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end
    " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
    xmap <leader>a <Plug>(coc-codeaction-selected)
    nmap <leader>a <Plug>(coc-codeaction-selected)
    " Remap for do codeAction of current line
    nmap <leader>ac <Plug>(coc-codeaction)
    " Fix autofix problem of current line
    nmap <leader>qf <Plug>(coc-fix-current)
    " Create mappings for function text object, requires document symbols feature of languageserver.
    xmap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap if <Plug>(coc-funcobj-i)
    omap af <Plug>(coc-funcobj-a)
    " Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
    nmap <silent> <C-d> <Plug>(coc-range-select)
    xmap <silent> <C-d> <Plug>(coc-range-select)
    " Use `:Format` to format current buffer
    command! -nargs=0 Format :call CocAction('format')
    " Use `:Fold` to fold current buffer
    command! -nargs=? Fold :call CocAction('fold', <f-args>)
    " use `:OR` for organize import of current buffer
    command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
    " Add status line support, for integration with other plugin, checkout `:h coc-status`
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
    " Using CocList
    " Show all diagnostics
    nnoremap <silent> <space>a :<C-u>CocList diagnostics<cr>
    " Manage extensions
    nnoremap <silent> <space>e :<C-u>CocList extensions<cr>
    nnoremap <silent> <space>c :<C-u>CocList commands<cr>
    " Find symbol of current document
    nnoremap <silent> <space>o :<C-u>CocList outline<cr>
    " Search workspace symbols
    nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent> <space>j :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> <space>k :<C-u>CocPrev<CR>
    " Resume latest coc list
    nnoremap <silent> <space>p :<C-u>CocListResume<CR>
    " Alternative way to save
    nnoremap <C-s> :w<CR>
    " Alternative way to quit
    nnoremap <C-M> :wq<CR>e
    " Fuzzy finder CtrlP
    nnoremap <silent> <Space>f :CtrlP<CR>
    nnoremap <silent> <Space>m :CtrlPMixed<CR>
    nnoremap <silent> <Space>r :CtrlPMRU<CR>
    " FZF key bindings
    nnoremap <C-p> :FZF<CR>
    let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-i': 'split',
    \ 'ctrl-v': 'vsplit' }
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>
    nnoremap gp :silent %!prettier --stdin-filepath %<CR>
