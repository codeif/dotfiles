#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;
git submodule init
git submodule update
# http://stackoverflow.com/questions/5828324/update-git-submodule-to-latest-commit-on-origin
git submodule foreach git pull origin master

function doIt() {
    rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
        --exclude "README.md" --exclude "LICENSE-MIT.txt" -avh --no-perms . ~;
    mkdir -p ~/.vim/autoload && curl -LSo ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim;
    # source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt;
else
    read -r -p "This may overwrite existing files in your home directory. Are you sure? (Y/n) ";
    if [[ ! $REPLY =~ ^[Nn]$ ]]; then
        doIt;
    fi;
fi;
unset doIt;
unset REPLY;

# git user
read -p "是否设置git user? (Y/n) ";
echo "";
if [[ ! $REPLY =~ ^[Nn]$ ]]; then
    git config --global user.name codeif
    git config --global user.email me@codeif.com
fi
unset REPLY

# git proxy
read -p "是否为github.com设置git代理？(y/N)";
if [[ $REPLY =~ ^[Yy]$ ]]; then
    git config --global http.https://github.com.proxy http://127.0.0.1:10812
fi
