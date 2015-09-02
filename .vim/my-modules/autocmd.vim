"autocmd commands
"Author: Viacheslav Lotsmanov

if has('autocmd')
	
	autocmd FileType nerdtree setlocal et ts=2 sts=2 sw=2
	
	autocmd BufNewFile,BufRead *.json.example set ft=json
	autocmd BufNewFile,BufRead *.gyp set ft=json
	autocmd BufNewFile,BufRead *.yaml.example set ft=yaml
	autocmd BufNewFile,BufRead Makefile set noexpandtab
	
	" because some custom `indentexpr`s has annoying issues
	autocmd FileType
		\ ls,coffee,stylus,jade,html
		\ set indentexpr=
	
	autocmd BufWritePre * call ClearSpacesAtEOF()
	
	autocmd CmdwinEnter * call PreventIndentTrimHackOff()
	autocmd CmdwinLeave * call PreventIndentTrimHackOn()
endif

"vim: set noet :
