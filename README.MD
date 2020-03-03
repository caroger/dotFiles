# dotFiles

This fold stores the configuration files for VS Code and Vim for the ease of using and updating the same configurations across different desktops.

---

## Download Repo

```bash
cd ~
git clone 
```



## Install Source Code Pro Font

```bash
chmod +x install-source-code-pro

./install-source-code-pro.sh
```

## VS Code User Config

```bash
ln -s ~/dotFiles/settings.json ~/.config/Code/User/settings.json
```

## Vim

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

```bash
mkdir ~/.vim/plugged
```

```bash
ln -s ~/dotFiles/vimrc ~/.vim/vimrc
```


