#!/usr/bin/env bash

pkg.link() {
  case $(os.platform) in
    osx)
      fs.link_files "platforms/osx" "$HOME/.config/nvim"
      ;;
  esac
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
  rm "$HOME/.config/nvim"

  hooks.unlink
}
