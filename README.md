# vimrc
my vim learnings and settings most preferrably optimized for me.

Modules used -
  - url = https://github.com/jonathanfilip/vim-lucius.git
  - url = https://github.com/scrooloose/syntastic.git
  - url = https://github.com/plasticboy/vim-markdown.git
  - url = https://github.com/godlygeek/tabular.git

vimrc should be cloned into .vim folder.

clone
-----
remove or rename any existing .vim, .vimrc folder/files

```bash
cd; git clone https://github.com/saneax/mythings .vim
```

populate module
---------------

```bash
cd ~/.vim
git submodule init
git submodule update
cd
ln -s .vim/.vimrc .vimrc
```





