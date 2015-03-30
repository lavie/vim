#!/bin/bash

echo "Configuring Vim..."
cd ~/.vim
git submodule update --init --recursive

vim +PluginInstall +qall
