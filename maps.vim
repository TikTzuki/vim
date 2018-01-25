" custom maps
" Author: Viacheslav Lotsmanov

let mapleader = ','

" flying between buffers
" (c) https://bairuidahu.deviantart.com/art/Flying-vs-Cycling-261641977
nnoremap <leader>bl :ls<CR>:b<space>
nnoremap <leader>bd :ls<CR>:bd<space>

nnoremap <leader>r :let @/ = ''<CR>:echo 'Reset search'<CR>

" 'cr' means 'config reload'
nnoremap <leader>cr :source $MYVIMRC<CR>

" nnoremap <leader>n :NERDTreeMirrorToggle<CR>
nnoremap <leader>n  :NERDTreeToggle<CR>
nnoremap <leader>N  :NERDTreeToggle<CR><C-w>p
nnoremap <leader>fn :NERDTreeFind<CR>
nnoremap <leader>fo :NERDTreeFind<CR><C-w>p
nnoremap <leader>fb :NERDTreeFind<CR><C-w>p:TagbarOpen<CR>
nnoremap <leader>t  :TagbarToggle<CR>
nnoremap <leader>u  :GundoToggle<CR>

xmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" UltiSnips map without conflicts
" with own <Tab> maps for visual and select modes.
if has('python3') || has('python')

	function! s:MyUltiExpand()
		call UltiSnips#isExpandable()
		return g:ulti_is_expandable
	endfunction

	inoremap <expr> <Tab> <SID>MyUltiExpand()
		\ ? '<C-R>=UltiSnips#ExpandSnippet()<CR>' : '<Tab>'
endif

function! g:FuzzyGitFileMaps()
	nnoremap <A-p>  :tabnew<CR>:Denite file_rec/git buffer<CR>
	nnoremap <C-p>  :Denite file_rec/git buffer<CR>
endfunction

" Denite
nnoremap <A-p>      :tabnew<CR>:Denite file_rec buffer<CR>
nnoremap <C-p>      :Denite file_rec buffer<CR>
" TODO FIXME denite
" nnoremap <leader>y  :Denite history/yank -default-action=append<CR>
nnoremap ''         :Denite register<CR>
" sl - show lines
nnoremap <leader>sl :Denite line<CR>
" sa - show all
nnoremap <leader>sa :Denite line:buffers<CR>
nnoremap <leader>;  :Denite menu:all<CR>
xnoremap <leader>;  :Denite menu:all<CR>
nnoremap <leader>:  :Denite<Space>
" feels kinda like ctrlspace
nnoremap <leader><Space> :Denite buffer<CR>
nnoremap <Space><leader> :Denite file_mru<CR>

" GitGutter keys
nnoremap <leader>gv :GitGutterPreviewHunk<CR>
nnoremap <Leader>ga :GitGutterStageHunk<CR>
nnoremap <Leader>gr :GitGutterUndoHunk<CR>
nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk

" git status in new tab
nnoremap <leader>gs :tabnew %<CR>:Gstatus<CR><C-w>o
nnoremap <leader>gS :Gstatus<CR><C-w>o

" modes togglers
nnoremap <leader>mw :WrapToggle<CR>
nnoremap <leader>mp :PasteToggle<CR>
nnoremap <leader>ml :ListToggle<CR>
nnoremap <leader>mn :RelativeNumberToggle<CR>
nnoremap <leader>m] :DelimitMateSwitch<CR>
nnoremap <leader>mg :GitGutterToggle<CR>
nnoremap <leader>mc :AutoClearSpacesAtEOFToggle<CR>
nnoremap <leader>mt :AutoTrimSpacesAtEOFToggle<CR>

" some buffer configs
nnoremap <leader>ft :set filetype=
nnoremap <leader>fl :set foldlevel=
nnoremap <leader>fm :set foldmethod=

" some windows things
nnoremap <leader>sww :9999wincmd < \| set winwidth=
nnoremap <leader>swh :9999wincmd - \| set winheight=
nnoremap <leader>swW :set wfw \| 9999wincmd < \| set winwidth=
nnoremap <leader>swH :set wfh \| 9999wincmd - \| set winheight=


" Syntastic
" nnoremap <leader>si :SyntasticInfo<CR>
" nnoremap <leader>sc :SyntasticCheck<CR>
" nnoremap <leader>sr :SyntasticReset<CR>

" Neomake
nnoremap <leader>si :NeomakeInfo<CR>
nnoremap <leader>sc :Neomake<CR>
" nnoremap <leader>sr :<CR>


" show hint
nnoremap <leader>sh :ShowHint<CR>

" short EasyAlign aliases
xnoremap <leader>:  :EasyAlign/:/<CR>
xnoremap <leader>g: :EasyAlign : { 'lm': 0, 'stl': 0 }<CR>
" haskell record syntax (align by '=' inside braces)
xnoremap <leader>=  :EasyAlign/\({.*\\|,.*\)\@<==/<CR>
" haskell alone '='
xnoremap <space>=   :EasyAlign/ = /{'lm':0,'rm':0}<CR>
nnoremap <leader>a  :EasyAlign
xnoremap <leader>a  :EasyAlign
xnoremap <leader>A  :EasyAlign/  /{'lm':0,'rm':0}
	\<left><left><left><left><left><left><left><left><left>
	\<left><left><left><left><left><left><left><left>

" CtrlSF bindings
nmap     <leader>sf <Plug>CtrlSFPrompt
xmap     <leader>sf <Plug>CtrlSFVwordPath
xmap     <leader>sF <Plug>CtrlSFVwordExec
nmap     <leader>sn <Plug>CtrlSFCwordPath
nmap     <leader>sN <Plug>CtrlSFCwordExec
nmap     <leader>sp <Plug>CtrlSFPwordPath
nmap     <leader>sP <Plug>CtrlSFPwordExec
nnoremap <leader>so :CtrlSFOpen<CR>
nnoremap <leader>st :CtrlSFToggle<CR>

" Denite grep/git shotcuts
" (kinda like CtrlSF maps but with 'g' instead of 's')
nnoremap <leader>gf :Denite grep/git:.:-F:''<Left>
xnoremap <leader>gf y:Denite grep/git:.:-F:'<C-R>"'<Left>
xnoremap <leader>gF y:Denite grep/git:.:-F:'<C-R>"'<CR>
nnoremap <leader>gn :Denite grep/git:.:-F:'<C-R>=expand('<cword>')<CR>'<Left>
nnoremap <leader>gN :Denite grep/git:.:-F:'<C-R>=expand('<cword>')<CR>'<CR>
nnoremap <leader>gp :Denite grep/git:.:-F:'<C-R>/'<Left>
nnoremap <leader>gP :Denite grep/git:.:-F:'<C-R>/'<CR>

" CtrlSpace panel open
nnoremap <C-Space> :CtrlSpace<CR>

" Make Hoogle search easier (because I use it very often)
nnoremap <A-f> :Hoogle<space>
xnoremap <A-f> y:Hoogle <C-R>0<CR>gv


" EasyMotion bindings (<Space> for overwin-mode, <Leader> for current window)

"  L----  ('L' - with <leader> or ' ' - without it)
" QWerty  (uppercase means it have map)
" SS----  ('S' - overwin with <space>)

" move anywhere ('q' means 'quick (move)')
nmap q         <Plug>(easymotion-bd-w)
xmap q         <Plug>(easymotion-bd-w)
nmap <Space>q  <Plug>(easymotion-overwin-w)
" doesn't make sense with 'overwin' mode
xmap <Space>q  <Nop>

" move to place with specific symbols
nmap <leader>w <Plug>(easymotion-bd-f2)
xmap <leader>w <Plug>(easymotion-bd-f2)
nmap <Space>w  <Plug>(easymotion-overwin-f2)
" doesn't make sense with 'overwin' mode
xmap <Space>w  <Nop>

" just another hook as `<leader>e` but for single symbol
nmap <leader>e <Plug>(easymotion-bd-f)
xmap <leader>e <Plug>(easymotion-bd-f)
nmap <Space>e  <Plug>(easymotion-overwin-f)
" doesn't make sense with 'overwin' mode
xmap <Space>e  <Nop>

" LL-L  ('L' - with <leader> or ' ' - without it)
" ZXcV  (uppercase means it have map)
" -S--  ('S' - overwin with <space>)

" move over the line
nmap <leader>z <Plug>(easymotion-lineanywhere)
xmap <leader>z <Plug>(easymotion-lineanywhere)

" move between lines
" (also between empty lines with indentation)
nmap <leader>x <Plug>(easymotion-bd-jk)
xmap <leader>x <Plug>(easymotion-bd-jk)
nmap <Space>x  <Plug>(easymotion-overwin-line)
xmap <Space>x  <Nop>

" turn on visual mode and select to specific place
nmap <leader>v v<Plug>(easymotion-bd-w)
nmap <leader>V V<Plug>(easymotion-bd-jk)

" move by direction
nmap <leader>l <Plug>(easymotion-lineforward)
xmap <leader>l <Plug>(easymotion-lineforward)
nmap <leader>h <Plug>(easymotion-linebackward)
xmap <leader>h <Plug>(easymotion-linebackward)
nmap <leader>j <Plug>(easymotion-j)
xmap <leader>j <Plug>(easymotion-j)
nmap <leader>k <Plug>(easymotion-k)
xmap <leader>k <Plug>(easymotion-k)


" quickhl
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
nmap <Space>n <Plug>(quickhl-cword-toggle)


" remove word selection symbols after paste from search
nmap <leader>c/  ds\ds>
" plugs to prevent mess about triggering default 'p' or 'P'
map  <leader>p   <Nop>
map  <leader>P   <Nop>
" paste searched word and clean it
map  <leader>p/  '/phds\ds>
map  <leader>P/  '/Phds\ds>
nmap <leader>po  <A-o>jP
nmap <leader>pO  <A-O>kP
nmap <leader>ppo <A-O>kP

" another alias to system X clipboard
noremap '<Space> "+
" another alias to 'last yank' register
noremap <A-y> "0


" forward version of <C-h> in insert mode
inoremap <C-l> <Del>


" colorscheme stuff
noremap <leader>ss <Esc>:set background=
noremap <leader>sb :BackgroundToggle<CR>
noremap <leader>sB :GruvboxContrastRotate<CR>

nnoremap gy Y:let @0 = substitute(@0, '.', ' ', 'g')<CR>:echo<CR>
nnoremap gY Y:let @0 = substitute(@0, '[^\r\n\t]', ' ', 'g')<CR>:echo<CR>
xnoremap gy y:let @0 = substitute(@0, '.', ' ', 'g')<CR>:echo<CR>
xnoremap gY y:let @0 = substitute(@0, '[^\r\n\t]', ' ', 'g')<CR>:echo<CR>

" walking between windows (hjkl)
nnoremap <C-h>     :wincmd h<CR>
xnoremap <C-h>     <Esc>:wincmd h<CR>
nnoremap <C-j>     :wincmd j<CR>
xnoremap <C-j>     <Esc>:wincmd j<CR>
nnoremap <C-k>     :wincmd k<CR>
xnoremap <C-k>     <Esc>:wincmd k<CR>
nnoremap <C-l>     :wincmd l<CR>
xnoremap <C-l>     <Esc>:wincmd l<CR>
" walking between windows (arrow keys)
nnoremap <C-Left>  :wincmd h<CR>
xnoremap <C-Left>  <Esc>:wincmd h<CR>
nnoremap <C-Right> :wincmd l<CR>
xnoremap <C-Right> <Esc>:wincmd l<CR>
nnoremap <C-Up>    :wincmd k<CR>
xnoremap <C-Up>    <Esc>:wincmd k<CR>
nnoremap <C-Down>  :wincmd j<CR>
xnoremap <C-Down>  <Esc>:wincmd j<CR>
" windows size minimization/maximization/normalization
nnoremap <A-=>     :wincmd =<CR>
nnoremap <A-->     :wincmd _<CR>
nnoremap <A-\>     :wincmd \|<CR>

" walk between windows by alt+arrow keys
nnoremap <A-Left>  zh
xnoremap <A-Left>  zh
nnoremap <A-Right> zl
xnoremap <A-Right> zl
nnoremap <A-Up>    <C-y>
xnoremap <A-Up>    <C-y>
nnoremap <A-Down>  <C-e>
xnoremap <A-Down>  <C-e>

" resizing windows by alt+shift+arrow keys
nnoremap <A-S-Left>  :wincmd <<CR>
xnoremap <A-S-Left>  <Esc>:wincmd <<CR>
nnoremap <A-S-Right> :wincmd ><CR>
xnoremap <A-S-Right> <Esc>:wincmd ><CR>
nnoremap <A-S-Up>    :wincmd +<CR>
xnoremap <A-S-Up>    <Esc>:wincmd +<CR>
nnoremap <A-S-Down>  :wincmd -<CR>
xnoremap <A-S-Down>  <Esc>:wincmd -<CR>

" zoom buffer hack ('fz' means 'full size')
nnoremap <leader>fz :999wincmd ><CR>:999wincmd +<CR>
xnoremap <leader>fz <Esc>:999wincmd ><CR>:999wincmd +<CR>gv

" moving between history in command mode
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" moving tabs
nnoremap <C-S-PageUp>   :tabm-1<CR>
nnoremap <C-S-PageDown> :tabm+1<CR>

" jump by half of screen by pageup/pagedown
nmap <PageUp>     <C-u>
nmap <PageDown>   <C-d>
xmap <PageUp>     <C-u>
xmap <PageDown>   <C-d>
" default jump by pageup/pagedown with shift prefix
nmap <S-PageUp>   <C-b>
nmap <S-PageDown> <C-f>
xmap <S-PageUp>   <C-b>
xmap <S-PageDown> <C-f>

nmap g/        <Plug>(incsearch-easymotion-/)
nmap g?        <Plug>(incsearch-easymotion-?)
nmap <leader>/ <Plug>(incsearch-easymotion-stay)

" get rid off randomly turning ex-mode on
nmap Q  <Nop>
nmap gQ <Nop>

" remap macros key under leader
" default 'q' remapped to easymotion call
noremap <leader>q q

inoremap jk <Esc>
cnoremap jk <C-c>
xnoremap <Tab> <Esc>
snoremap <Tab> <Esc>
tnoremap <Leader><Tab> <C-\><C-n>
tnoremap <Leader><Esc> <C-\><C-n>

" thanks to Minoru for the advice
noremap ; :
" noremap : ;

" thanks to r3lgar for the advice (swap default <leader> and comma)
noremap \ ;
noremap \| ,

" because working with clipboard registers is more important
noremap ' "
noremap " '
noremap "" ''

" custom behavior of big R in visual mode
xnoremap R r<Space>R

" break line but keep same column position for rest of the line
imap <A-CR> <C-o>mp<Esc>`py0`pD`p<A-o>jP`pji
imap <A-'>  <C-o>mp<Esc>`py0`pD`p<A-o>jP`pi
imap <A-\>  <C-o>mp<Esc>`py0`pD`p<A-O>kP`pki
imap <A-]>  <C-o>mp<Esc>`py0`pD`p<A-O>kP`pi

nnoremap <A-o> mpo
	\<Esc>:let __tmp_A_o=@"<CR>S
	\<Esc>:let @"=__tmp_A_o
	\<Esc>:unlet __tmp_A_o<CR>`p
nnoremap <A-O> mpO
	\<Esc>:let __tmp_A_O=@"<CR>S
	\<Esc>:let @"=__tmp_A_O
	\<Esc>:unlet __tmp_A_O<CR>`p
nmap <leader>o <A-o>ji
nmap <leader>O <A-O>ki

imap <A-Space> <Space><Left>


" custom numbers line keys

nmap ! <Plug>(indexed-search-#)
nnoremap g! yiw:let @/ = '\V\<<C-R>0\>'<CR>:ShowSearchIndex<CR>
xnoremap ! :<C-u>call VisualStarSearchSet('?')<CR>?<C-R>=@/<CR><CR>
xnoremap g! :<C-u>call VisualStarSearchSet('?')<CR>
nmap @ <Plug>(indexed-search-*)
nnoremap g@ yiw:let @/ = '\V\<<C-R>0\>'<CR>:ShowSearchIndex<CR>
xnoremap @ :<C-u>call VisualStarSearchSet('/')<CR>/<C-R>=@/<CR><CR>
xnoremap g@ :<C-u>call VisualStarSearchSet('/')<CR>
" noremap ! #
" noremap @ *

" begin/end of line ignoring indentation and trailing whitespaces
noremap # ^
noremap g# g^
noremap $ g_
noremap g$ g$

" default behavior of %
" noremap %

" noremap ^ 0
" we already have 0, I never use this key (^) this way
" let's remap it to '|' that in case was remapped too
noremap ^ \|
noremap g^ g0

" opposite to 0
noremap & $
noremap g& g$

" macros call
noremap * @
noremap g* g@

" swapping j/k with gj/gk
nnoremap j gj
xnoremap j gj
nnoremap k gk
xnoremap k gk
nnoremap gj j
xnoremap gj j
nnoremap gk k
xnoremap gk k

" relative tabnext by default
nnoremap gt :<C-u>exec join(repeat(['tabnext'], v:count1), '\|')<CR>
xnoremap gt :<C-u>exec join(repeat(['tabnext'], v:count1), '\|')<CR>
nnoremap ,gt gt
xnoremap ,gt gt

" because default maps disabled for plugin
nmap / <Plug>(indexed-search-/)
nmap ? <Plug>(indexed-search-?)
nmap n <Plug>(indexed-search-n)zv
nmap N <Plug>(indexed-search-N)zv

nnoremap <A-t> :tabnew<CR>
nnoremap <A-w> :tabclose<CR>

" quick hook for 'IndentText'
xnoremap <A-i> ym0gvc<Esc>`0:call<space>IndentText()<CR>
xnoremap <A-S-i> ym0gvI<Esc>`0:call<space>IndentText()<CR>

inoremap <expr> <A-n> deoplete#manual_complete()

" pasting from default buffer in insert/cmdline mode
inoremap <A-p> <C-r>"
cnoremap <A-p> <C-r>"
inoremap <A-y> <C-r>0
cnoremap <A-y> <C-r>0
