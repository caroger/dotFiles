# dotFiles

Remaking dotFiles Repo
---

## VS Code User Configg

```sh
ln -s ~/dotFiles/settings.json ~/.config/Code/User/settings.json
```

## NeoVim

```sh
mkdir ~/.config/nvim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

ln -s ~/dotFiles/init.vim ~/.config/nvim/init.vim

ln -s ~/dotFiles/coc-settings.json ~/.config/nvim/coc-settings.json
```

## ZSH

```sh
sudo apt install zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cd ~/.oh-my-zsh/custom/plugin
git clone https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions
ln -s ~/dotFiles/.zshrc ~/.zshrc
```
