#!/bin/sh
# env vars to set on login, zsh settings in ~/.zshrc
# read first

# based on BreadOnPenguins setup https://github.com/BreadOnPenguins/dots/blob/master/.zprofile

### make ###
# make will use all threads (faster compilation) except one (system stability)
export MAKEFLAGS="-j$(($(nproc)-1))"

