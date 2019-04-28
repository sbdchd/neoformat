#!/usr/bin/env bash

set -e

# Formatters
npm install -g csscomb@3.1.7
npm install -g prettydiff@99.0.1
npm install -g js-beautify@1.6.2 # for css-beautify
npm install -g typescript@2.0.6
npm install -g typescript-formatter@4.0.1
pip3 install yapf==0.14.0

# Linter(s)
if ! hash vint 2>/dev/null; then
    pip3 install vim-vint
fi

# Vader
if [ ! -d "$HOME/.vim/plugged/vader.vim" ]; then
    git clone https://github.com/junegunn/vader.vim.git ~/.vim/plugged/vader.vim
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export PATH=$PATH:"$DIR"/bin
echo $PATH
