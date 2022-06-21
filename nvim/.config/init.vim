if has("win32") || has("win64")
	set runtimepath^=~/vimfiles runtimepath+=~/vimfiles
else
	set runtimepath^=~/.vim runtimepath+=~/.vim/after
endif
let &packpath = &runtimepath
if has("win32") || has("win64")
	set runtimepath^=~/vimfiles runtimepath+=~/vimfiles
	source ~/vimfiles/vimrc
else
	source ~/.vim/.vimrc
endif
