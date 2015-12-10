vimrc
=====

my vimrc script, for my personal purpose.

base on [srockstyle/vimrc](https://github.com/srockstyle/vimrc)

use [Vundle](https://github.com/gmarik/Vundle.vim) as plugin manager

*pre request*
- ctags
*usage*
```bash
$ mkdir -p ~/.vim/bundle
$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
$ vim -u <vimrc path>
:PluginInstall
:GoInstallBinaries
$ cd ~/.vim/bundle/vimproc.vim && make
```
