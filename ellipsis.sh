#!/usr/bin/env bash

pkg.link() {
  fs.link_file init.vim

  fs.link_file "$PKG_PATH" "$ELLIPSIS_HOME/.config/nvim"
}

pkg.install() {
  git submodule init
  git submodule update

}

pkg.pull() {
  git.pull

  nvim +PluginClean! +PluginInstall! +qall
}

pkg.unlink() {
  rm "$ELLIPSIS_HOME/.config/nvim"

  hooks.unlink
}
