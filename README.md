vimrc
=====

my vimrc script, for my personal purpose.

base on [srockstyle/vimrc](https://github.com/srockstyle/vimrc)

use [Vundle](https://github.com/gmarik/Vundle.vim) as plugin manager

*pre request*
- ctags
- editorconfig
- js-beautify

*usage*
```bash
$ mkdir -p ~/.vim/bundle
$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
$ vim -u <vimrc path> +PluginInstall +GoInstallBinaries +qall
$ cd ~/.vim/bundle/vimproc.vim && make
```

*environment setting*
in ```.bashrc``` or ```.bash_profile```, add
```bash
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim -u ~/vimrc/vimrc'
alias vi='vim'
alias gvim='/Applications/MacVim.app/Contents/MacOS/gvim -U ~/vimrc/gvimrc'

```
