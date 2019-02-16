# How to install

1. clone repository
```bash
git clone https://github.com/jwkang/vim.git ~/vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

2. copy .vimrc (optianl - backup your vimrc)
```bash
cp ~/vim/.vimrc ~/
```

3. run install script
```bash
pushd ~/vim; ./install_my_vimrc.sh; popd
```

4. Install pakcages (ctags, cscope)
```bash
sudo apt-get install ctags cscope -y
```
5. Copy mkscope.sh to `/usr/bin/`
```
sudo cp ~/vim/mkscope.sh /usr/bin
```

# Summery
```
git clone https://github.com/jwkang/vim.git ~/vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp ~/.vimrc ~/.vimrc.old;cp ~/vim/.vimrc ~/
pushd ~/vim; ./install_my_vimrc.sh; popd
sudo apt-get install ctags cscope -y
sudo cp ~/vim/mkscope.sh /usr/bin
```
