# dotFiles

This fold stores the configuration files for VS Code and Vim for the ease of using and updating the same configurations across different desktops.

---

## Download Repo

```sh
cd ~
git clone 
```

## Install Source Code Pro Font

```sh
chmod +x install-source-code-pro.sh
```

```sh
./install-source-code-pro.sh
```

## VS Code User Config

```sh
ln -s ~/dotFiles/settings.json ~/.config/Code/User/settings.json
```

## Vim

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

```sh
mkdir ~/.vim/plugged
```

```sh
ln -s ~/dotFiles/vimrc ~/.vim/vimrc
```

```sh
vim vimrc
:PlugInstall
so %
```
