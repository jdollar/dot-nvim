#!/usr/bin/env bash

install_plugins() {
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  nvim +PlugClean! +PlugInstall! +qall --noplugin
}

pkg.link() {
  fs.link_file "platforms/common/after" "$HOME/.config/nvim/after"

  case $(os.platform) in
    osx)
      fs.link_file "platforms/osx/init.vim" "$HOME/.config/nvim/init.vim"
      ;;
    linux)
      fs.link_file "platforms/common/init.vim" "$HOME/.config/nvim/init.vim"
      ;;
  esac

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
  rm -r "$HOME/.config/nvim"

  hooks.unlink
}
