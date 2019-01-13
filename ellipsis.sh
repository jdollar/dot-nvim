#!/usr/bin/env bash

install_plugins() {
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  nvim +PlugClean! +PlugInstall! +qall --noplugin
}

pkg.link() {
  fs.link_rfile "platforms/common" "$HOME/.config/nvim"
  install_plugins
}

pkg.install() {
  [ ! -d "$HOME/.config/nvim" ] && mkdir -p "$HOME/.config/nvim"
}

pkg.pull() {
  git.pull

  nvim +PlugClean! +PlugUpdate! +qall --noplugin
}

pkg.unlink() {
  rm -rf "$HOME/.config/nvim"

  hooks.unlink
}
