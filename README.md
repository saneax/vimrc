# vimrc
my vim learnings and settings most preferrably optimized for me.

Modules used -
  - url = https://github.com/jonathanfilip/vim-lucius.git
  - url = https://github.com/scrooloose/syntastic.git
  - url = https://github.com/plasticboy/vim-markdown.git
  - url = https://github.com/godlygeek/tabular.git
For Python auto completion
  - url = https://github.com/davidhalter/jedi-vim
  (We also need to do pip install jedi before install the jedi-vim plugin on pathogen)

vimrc should be cloned into .vim folder.

clone
-----
remove or rename any existing .vim, .vimrc folder/files

```bash
cd; git clone https://github.com/saneax/vimrc .vim
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





