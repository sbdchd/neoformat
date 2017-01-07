#!/usr/bin/env bash

if [[ $OSTYPE == darwin* ]]; then
    OS='mac'
elif [[ $OSTYPE == linux-gnu* ]]; then
    OS='linux'
else
    OS='unknown'
fi

# Vint
if ! hash vint 2>/dev/null; then
    pip install vim-vint
fi
vint .

# Vader
if [ ! -d "$HOME/.vim/plugged/vader.vim" ]; then
    git clone https://github.com/junegunn/vader.vim.git ~/.vim/plugged/vader.vim
fi

# Make sure neovim is installed
if ! hash nvim 2>/dev/null; then
    if [[ $OS == 'linux' ]]; then
        sudo add-apt-repository -y ppa:neovim-ppa/unstable
        sudo apt-get update
        sudo apt-get install -y neovim
    elif [[ $OS == 'mac' ]]; then
        brew install neovim
    fi
fi

# Run Vader Tests
cd "$( dirname "${BASH_SOURCE[0]}" )" && nvim -u vimrc -c 'Vader! *.vader' > /dev/null

# Run Autocomplete Tests
nvim -u vimrc -c 'source autocomplete_test.vim' > /dev/null

# install formatters
bash install.sh

# run formatter tests
pytest -v test.py
