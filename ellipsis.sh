#!/usr/bin/env bash

install_plugins() {
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  nvim +PlugClean! +PlugInstall! +qall
}

pkg.link() {
  [ ! -d "$HOME/.config/nvim" ] && mkdir -p "$HOME/.config/nvim"

  case $(os.platform) in
    osx)
      fs.link_file "platforms/osx/init.vim" "$HOME/.config/nvim/init.vim"
      fs.link_file "platforms/osx/bundle" "$HOME/.config/nvim/bundle"
      ;;
    linux)
      fs.link_file "platforms/common/init.vim" "$HOME/.config/nvim/init.vim"
      fs.link_file "platforms/common/bundle" "$HOME/.config/nvim/bundle"
      ;;
  esac
}

pkg.install() {
  git submodule init
  git submodule update

  install_plugins
}

pkg.pull() {
  git.pull

  install_plugins
}

pkg.unlink() {
  rm -r "$HOME/.config/nvim"

  hooks.unlink
}
