#!/usr/bin/env bash

pkg.link() {
  fs.link_file vimrc

  fs.link_file "$PKG_PATH" "$ELLIPSIS_HOME/.config/vim"
  fs.link_file "$PKG_PATH" "$ELLIPSIS_HOME/.config/nvim"
}

pkg.install() {
  git submodule init
  git submodule update
}
