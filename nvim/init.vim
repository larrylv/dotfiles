set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

luafile ~/.config/nvim/lua/nvim-treesitter.lua
luafile ~/.config/nvim/lua/nvim-treesitter-context.lua
