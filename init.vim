call plug#begin()
Plug 'https://github.com/scrooloose/nerdtree.git'
 
" NERDTree -
"One of the most popular plugins out there, it makes a directory explorer you can navigate using your keyboard to easily access your project’s files. It also allows you to easily create, rename, copy and remove files. I find it quite hard to live without this!
Plug 'https://github.com/scrooloose/nerdtree'


" FuzzyFinder
"Sometimes you want to get quick access to a buffer or a file, for this I use this plugin, with <leader-b> and <leader-f> I can bring a dialog where I can quickly open a buffer that was on the background or open a new file faster than using NERDTree. I use it a lot for buffer swapping.
Plug '~/ns9tks-vim-l9-3bb534a720fa'
Plug 'https://github.com/vim-scripts/FuzzyFinder' 

 
" Lightline
"A pretty status bar for Vim, it has lots of nice information on the current file, no reason no to use this really!
Plug 'https://github.com/itchyny/lightline.vim'

" EasyMotion
"Really handy to quickly move though a file, I don’t use it very often as I like to be able to efficiently move the “default” Vim way, but for very long lines or very specific or quick movements it’s awesome, one can get used to this pretty quickly.
Plug 'https://github.com/Lokaltog/vim-easymotion'

"Syntastic
"Syntax`
Plug 'https://github.com/scrooloose/syntastic.git'
 
" Surround
"Some goodies for changing surrounds, a pretty neat overall plugin to have. Surprising Vim doesn’t provide something like this by default.
Plug 'https://github.com/tpope/vim-surround'

" Repeat
Plug 'git://github.com/tpope/vim-repeat.git'
 
" Emmet
"This is the first webdev-oriented plugin, it enables you to expand CSS selectors into HTML markup, also known as Zen Coding. It really makes writing HTML much more painless.
Plug 'https://github.com/mattn/emmet-vim'

 
" JSHint2
"This one is also webdev-oriented, it’s used to perform JSHint validation on Javascript files. I configured it to run every time a *.js file is saved. Something similar could be archieved with something like Gulp or Grunt but I like the integrated solution.
Plug 'https://github.com/Shutnik/jshint2.vim'


"CSS Color
"Another webdev-oriented plugin, this one allows you to see a little preview of the colors specified in the CSS file, for LESS and SASS it might not be a big deal but it’s a nice little feature to have. Quite optional.
"Plug 'https://github.com/skammer/vim-css-color'

"Fugitive
"fugitive.vim: a Git wrapper so awesome, it should be illegal
Plug 'https://github.com/tpope/vim-fugitive.git'

" CTRLP
"Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
"Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'

" Tagbar
" Tagbar: a class outline viewer for Vim

Plug 'https://github.com/majutsushi/tagbar.git'

" Easy tags
" Automated tag generation and syntax highlighting in Vim
Plug 'http://github.com/xolox/vim-misc'
Plug 'https://github.com/xolox/vim-easytags.git'

"Solarized
Plug 'git://github.com/altercation/vim-colors-solarized.git'

" Async-grep
Plug 'https://github.com/arames/vim-async-grep.git'

"Deoplete
" Deoplete is the abbreviation of dark powered neo-completion. It provides an asynchronous keyword completion system in the current buffer. To view the current options, please consult the documentation.


Plug 'https://github.com/Shougo/deoplete.nvim'
Plug 'marijnh/tern_for_vim'
Plug 'https://github.com/othree/jspc.vim.git'
Plug 'https://github.com/carlitux/deoplete-ternjs.git'
Plug 'https://github.com/c9s/perlomni.vim.git'

"eyapp syntax
Plug 'https://github.com/vim-scripts/eyapp.git'

"context_filetype.vim:
"It adds the context filetype feature.
Plug 'https://github.com/Shougo/context_filetype.vim'

"neopairs.vim:
"It inserts the parentheses pairs automatically.
"Plug 'https://github.com/Shougo/neopairs.vim'

"echodoc.vim:
"It prints the documentation you have completed.
Plug 'https://github.com/Shougo/echodoc.vim'

"neoinclude.vim:
"You can completes the candidates from the included files and included path.
Plug 'https://github.com/Shougo/neoinclude.vim'

"FastFold:
"Speed up the updating folds when you use auto completion plugins.
"Plug 'https://github.com/Konfekt/FastFold'

call plug#end()

"------ GENERAL
lang mes C

set shiftwidth=4
set tabstop=4
set expandtab
set shiftround
set softtabstop=4
set nowrap
au FileType javascript setl sw=2 sts=2 ts=2 et

" Tab navigation 
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-=>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i

" Tab replace 
vnoremap <Tab>  :'<,'>><CR>gv
vnoremap <Backspace>  :'<,'><<CR>gv
nnoremap <Tab>  >>
nnoremap <Backspace>  <<

" normal mode only

set mouse=n

tnoremap <Esc> <C-\><C-n>

"------ OmniComplete
let g:deoplete#enable_at_startup = 1
"let g:deoplete#enable_refresh_always=1
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 0  " This do disable full signature type on autocomplete
"let g:deoplete#omni#functions = {}
"let g:deoplete#omni#functions.javascript = ['jspc#omni','tern#Complete' ]

let g:deoplete#sources = {}
let g:deoplete#sources.perl = ['buffer', 'member', 'tag', 'file', 'dictionary', 'omni']
let g:deoplete#sources.javascript = ['buffer', 'ternjs', 'member', 'tag', 'file', 'dictionary', 'omni']
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.javascript = ['.']
let g:deoplete#omni#input_patterns.perl = ['::', '->']

"------

if &filetype == "javascript"
    map <Leader>r <ESC>:TernRename<CR> 
    map <Leader>d <ESC>:TernDef<CR> 
el
    function! AnyRename()
        call inputsave()
        let @z=input("What do you want to rename '" . @z . "' to? ")
        call inputrestore()
    endfunction
    nmap <Leader>r "zyiw:call AnyRename()<cr>mx:silent! norm gd<cr>[{V%:s/<C-R>//<c-r>z/g<cr>`x
en
"------ Solarized
set background=light
"colorscheme solarized
let g:solarized_termcolors=256

"------ NEO DOCS
"set cmdheight=2
let g:echodoc_enable_at_startup = 1

"

"------ ASYNC-GREP
"
" Grep in current directory.
set grepprg=grep\ -RHIn\ --exclude=\".tags\"\ --exclude-dir=\".svn\"\ --exclude-dir=\".git\"\ --exclude-dir=\"node_modules\" 
" Grep for the word under the cursor.
nnoremap K :Grep "\\<<C-r><C-w>\\>" .<CR>
nmap <leader>grep K
" Versions suffixed with `l` for the location list cause vim to wait for keys
" after `grep`. Provide versions with extra characters to allow skipping the
" wait.
nmap <leader>grepc K
nmap <leader>grep<Space> K
nmap <leader>grep<CR> K
" Grep in the current file's path.
nmap <leader>grepd :Grep "\\<<C-r><C-w>\\>" %:p:h<CR>
" Grep for the text selected. Do not look for word boundaries.
vnoremap K "zy:<C-u>Grep "<C-r>z" .<CR>
vmap <leader>grep K
vmap <leader>grepd :Grep "\\<<C-r><C-w>\\>" %:p:h<CR>

" Same as above, but for the location list.
nnoremap <F9> :GrepL "\\<<C-r><C-w>\\>" .<CR>
nmap <leader>grepl <F9>
nmap <leader>grepl<Space> <F9>
nmap <leader>grepl<CR> <F9>
nmap <leader>grepld :GrepL "\\<<C-r><C-w>\\>" %:p:h<CR>
vnoremap <F9> "zy:<C-u>GrepL "<C-r>z" .<CR>
vmap <leader>grepl <F9>
vmap <leader>grepld :GrepL "\\<<C-r><C-w>\\>" %:p:h<CR>


"------ CTRLP
"Change the default mapping and the default command to invoke CtrlP:
"let g:ctrlp_map = '<c-k>'
"let g:ctrlp_cmd = 'CtrlPMixed'

"When invoked, unless a starting directory is specified, CtrlP will set its local working directory according to this variable:
"let g:ctrlp_working_path_mode = 'ra'

"Exclude files or directories using Vim's wildignore:
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

"And/Or CtrlP's own g:ctrlp_custom_ignore:
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

"------ TAGBAR
let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:easytags_file = '~/.config/nvim/tags'
let g:easytags_async = 1
set tags=./tags;
let g:easytags_dynamic_files = 1

map <F8> :TagbarToggle<CR>

"------ SYNTASTIC
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_perl_checker = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_perl_checkers = ['perl']
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

"------ JSHINT2

" show next jshint error
nnoremap <silent><F2> :lnext<CR>
inoremap <silent><F2> <C-O>:lnext<CR>
vnoremap <silent><F2> :lnext<CR>

" show previous jshint error
nnoremap <silent><F3> :lprevious<CR>
inoremap <silent><F3> <C-O>:lprevious<CR>
vnoremap <silent><F3> :lprevious<CR>

"------ LIGHT LINE
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! LightLineFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ' '._ : ''
  endif
  return ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

"------ NERD TREE

"How can I open a NERDTree automatically when vim starts up if no files were specified?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree /home/neo/workspace | endif

"How can I map a specific key or shortcut to open NERDTree?
map <F10> :NERDTreeToggle /home/neo/workspace/<CR>

"How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"------ EASY MOTION
"
 " type `l` and match `l`&`L`
let g:EasyMotion_use_upper = 1
let g:EasyMotion_smartcase = 1


"<Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)



" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

"------ FUZZY FINDER


let g:fuf_coveragefile_globPatterns = [ '~/workspace/Liban/lib/**/*.p[lm]',     '~/workspace/APos/APos/**/*.p[lm]',     '~/workspace/DFOPro/t/**/*.sql',    '~/workspace/DFOPro/shared/**/*.js',   '~/workspace/DFOPro/lib/Poseidon/**/*.p[lm]',    '~/.vim/**/*.vim',     '~/.vim/**/*.p[lm]',    '~/workspace/Liban/t/**/*.sql',    '~/workspace/Liban/t/**/*.yml',    '~/workspace/Liban/t/**/*.sql',     '~/workspace/Liban/**/*.yp', '~/workspace/NodePro/app/**/*.js','~/workspace/NodePro/test/**/*.js','~/workspace/NodePro/*.js','~/workspace/NodeTerminator/**/src/*.js','~/workspace/NodePro/test/**/*.js','~/workspace/NodePro/*.js']
nmap \f :FufCoverageFile<CR>
nmap \o :FufMruFile<CR>
nmap \c :FufChangeList<CR>
nmap \l :FufLine<CR>
nmap \b :FufBuffer<CR>


"inoremap <expr> -> MayComplete('->')
"func MayComplete(str)
"    return a:str."\<C-X>\<C-O>\<C-P>"
"endfunc
"inoremap <expr> . MayComplete('.')

" -----------------------------------
"  dumping Record under cursor (F12)
" -----------------------------------
function! RecordDumper()
	let head = getline(1)
	let line = getline('.')

	let head = strtrans(head)
	let line = strtrans(line)
	let head = substitute(head,"\'", "APOSMAKLOTA","g")
	let line = substitute(line,"\'", "APOSMAKLOTA","g")
	let head = substitute(head,"#", "APOSMAHASZ","g")
	let line = substitute(line,"#", "APOSMAHASZ","g")
	let head = substitute(head,"!", "APOSMAKRZYK","g")
	let line = substitute(line,"!", "APOSMAKRZYK","g")
	execute "!~/.vim/bin/rder.pl \'".head."\' \'".line."\'"
	return ""
endfunction

" -------------------
"  OpenBrother
" -------------------
function! OpenBrother()
	let s:path = expand("%:p")
	let s:ext = expand("%:e")

    let s:from = '/lib/'
    let s:to = '/t/'
	if (s:path =~ "APos") 
        let s:from = 'workspace/APos'
        let s:to = 'workspace/APos/t'
    endif
	if (s:path =~ "DFOPro") 
        let s:from = 'workspace/DFOPro/lib'
        let s:to = 'workspace/DFOPro/t/unit'
    endif

    if (s:ext == 't')
        let s:path = substitute(s:path, s:to, s:from, "")
        let s:path = substitute(s:path, '.t$', "", "")
        if (!filereadable(s:path) && s:path !~ ".pm$") 
		    let s:path = s:path.".pm"
        endif
    elseif (s:ext == 'pm')
        let s:path = substitute(s:path, s:from,s:to,"")
		let s:path = s:path.".t"
        if (! filereadable(s:path)) 
            let s:newpath = substitute(s:path, '.pm.t$', '.t',"")
            if (filereadable(s:newpath))
                echohl("readable ".s:newpath)
                let s:path = s:newpath
            endif
        endif
    end

	let s:cmd = "vsplit ".s:path
	execute s:cmd
	redraw!
endfunction

" ---- smart F5
"autocmd BufNewFile,BufRead *.p? nmap <F5> <Leader>rr
"autocmd BufNewFile,BufRead *.t nmap <F5> <Leader>rr
autocmd BufNewFile,BufRead *.p? nmap <F5> :!/usr/bin/env perl '%'<CR>     
autocmd BufNewFile,BufRead *.t nmap <F5>  :!/usr/bin/env perl '%'<CR> 
autocmd BufNewFile,BufRead *.p? nmap <F6> :!/usr/bin/env perl -cw '%'<CR>     
autocmd BufNewFile,BufRead *.t nmap <F6>  :!/usr/bin/env perl -cw '%'<CR> 
autocmd BufNewFile,BufRead *.js nmap <F5> :w<CR>:!node %<CR>
autocmd BufNewFile,BufRead *.js nmap <F6> :w<CR>
" --- smart F12
autocmd BufNewFile,BufRead *.xml nmap <F12> :%!xmllint --format -<CR>:set ro<CR>
autocmd BufNewFile,BufRead *.txt nmap <F12> :call RecordDumper()<CR>
autocmd BufNewFile,BufRead *.csv nmap <F12> :call RecordDumper()<CR>
autocmd BufNewFile,BufRead *.tsv nmap <F12> :call RecordDumper()<CR>
autocmd BufNewFile,BufRead *.pm nmap <F12> :call OpenBrother()<CR>
autocmd BufNewFile,BufRead *.t nmap <F12> :call OpenBrother()<CR>
