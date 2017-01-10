# Formatters
npm install -g csscomb@3.1.7
npm install -g prettydiff@99.0.1
npm install -g js-beautify@1.6.2 # for css-beautify
pip install yapf==0.14.0

# Linter(s)
if ! hash vint 2>/dev/null; then
    pip install vim-vint
fi

# Make sure neovim is installed
if ! hash nvim 2>/dev/null; then
    echo "installing neovim"
    if [[ $OS == 'linux' ]]; then
        echo "installing nvim on linux"
        sudo add-apt-repository -y ppa:neovim-ppa/unstable
        sudo apt-get update
        sudo apt-get install -y neovim
    elif [[ $OS == 'mac' ]]; then
        echo "install nvim on mac"
        brew install neovim
    fi
else
    echo "neovim already installed"
fi

# Vader
if [ ! -d "$HOME/.vim/plugged/vader.vim" ]; then
    git clone https://github.com/junegunn/vader.vim.git ~/.vim/plugged/vader.vim
fi
