# Check out git repos and put in place symlinks

if [[ `which git` == "" ]]; then
    echo "git is not installed"
    exit 1
fi

cd ~
mkdir -p git

for type in dotfiles misc personal; do
    if [[ $type == "dotfiles" ]]; then
        pushd ~/git

        if [[ -e "$type" ]]; then
            echo "$type git directory already exists"
            exit 45
        fi
        git clone git@github.com:esheldon/misc.git
        popd

        echo "  setting symlinks"

        rm -f .dotfiles

        rm -f .dotfiles
        ln -vfs git/dotfiles .dotfiles

        ln -vfs .dotfiles/python/pythonrc .pythonrc

        ln -vfs .dotfiles/ack/ackrc .ackrc

        rm -f .vim
        ln -vfs .dotfiles/vim .vim
        ln -vfs .dotfiles/vim/vimrc .vimrc

        ln -vfs .dotfiles/bash/bashrc .bashrc
        ln -vfs .dotfiles/bash/bash_profile .bash_profile
        ln -vfs .dotfiles/inputrc .inputrc
        ln -vfs .dotfiles/X/Xdefaults .Xdefaults
        ln -vfs .dotfiles/X/Xmodmap .Xmodmap
        ln -vfs .dotfiles/screen/screenrc .screenrc
        ln -vfs .dotfiles/multitailrc .multitailrc

        ln -vfs .dotfiles/git/gitignore .gitignore
        ln -vfs .dotfiles/git/gitconfig .gitconfig
        ln -vfs .dotfiles/conda/condarc .condarc

        if [ ! -e .ssh ]; then
            mkdir .ssh
            chmod og-rx .ssh
        fi
        ln -vfs ${HOME}/.dotfiles/ssh/config .ssh/config

        mkdir -p .config/xfce4/terminal
        rm -f .config/xfce4/terminal/terminalrc
        cp .dotfiles/xfce/rohan/terminal/terminalrc .config/xfce4/terminal/

        mkdir -p .config/matplotlib
        rm -f .config/matplotlib/matplotlibrc
        cp .dotfiles/matplotlib/matplotlibrc .config/matplotlib/

        mkdir -p .ipython/profile_default
        rm -f .ipython/profile_default/ipython_config.py
        ln -s ~/.dotfiles/ipython/ipython_config.py .ipython/profile_default/

    elif [[ $type == "misc" ]]; then
        pushd ~/git

        if [[ -e "$type" ]]; then
            echo "$type git directory already exists"
            exit 45
        fi
        git clone git@github.com:esheldon/misc.git
        popd

        echo "  setting symlinks"


        rm -f help
        ln -vfs git/misc/help

        rm -f .fonts
        ln -vfs .dotfiles/fonts .fonts

    elif [[ $type == "personal" ]]; then
        pushd ~/git

        if [[ -e "$type" ]]; then
            echo "$type git directory already exists"
            exit 45
        fi
        git clone git@github.com:esheldon/personal.git
        popd

        echo "  setting symlinks"

        rm -f personal
        ln -vfs git/personal

    else
        echo "unknown type: $type"
    fi

done

