# Neo**vim** configuration for Mac arm64

## features

- goes well with [Alacritty](https://github.com/alacritty/alacritty)
- plugin manager: [lazy.nvim](https://github.com/folke/lazy.nvim)

## zsh

```zsh
brew --version
```
Homebrew 4.3.1

```zsh
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile

source ~/.zprofile
```

```zsh
brew install neovim

brew list --versions neovim
```
neovim 0.9.5

```zsh
brew install ripgrep

brew list --versions ripgrep
```
ripgrep 14.1.0

```zsh
brew tap homebrew/cask-fonts

brew install --cask font-hasklug-nerd-font

brew list --cask --versions font-hasklug-nerd-font
```
font-hasklug-nerd-font 3.2.1

```zsh
brew install --cask alacritty

brew list --cask --versions alacritty
```
alacritty 0.13.2

```zsh
echo "alias vim=nvim" >> ~/.zshrc

echo 'alias vimc='\''cd "$HOME/.config/nvim"'\''' >> ~/.zshrc

source ~/.zshrc
```

```zsh
cd $HOME/.config

git clone https://github.com/cb-g/nvim
```

launch:
```zsh
vimc

vim .
```

delete/reset:
```zsh
rm -rf $HOME/.config/nvim
rm -rf $HOME/.local/share/nvim
rm -rf $HOME/.local/state/nvim
```

## references 

- [CadeMichael](https://github.com/CadeMichael/nvim)
- [cpow](https://github.com/cpow/neovim-for-newbs/)
- [agalea91](https://github.com/agalea91/zazencodes-youtube/tree/main/src/neovim-lazy-ide-2024)
- [ThePrimeagen](https://github.com/ThePrimeagen/init.lua/tree/249f3b14cc517202c80c6babd0f9ec548351ec71)