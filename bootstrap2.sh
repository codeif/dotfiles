#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

function doIt() {
    rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "bootstrap2.sh" \
        --exclude "README.md" --exclude "LICENSE-MIT.txt" -avh --no-perms . ~;
    mkdir -p ~/.vim/autoload && curl -LSo ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim;
}

rm -rf .vim
mkdir -p .vim/bundle/

curl -LSo tmp.zip https://codeload.github.com/preservim/nerdtree/zip/master && \
unzip tmp.zip && \
rm tmp.zip && \
mv nerdtree-master .vim/bundle/nerdtree && \

curl -LSo tmp.zip https://codeload.github.com/ctrlpvim/ctrlp.vim/zip/master && \
unzip tmp.zip && \
rm tmp.zip && \
mv ctrlp.vim-master .vim/bundle/ctrlp.vim && \

curl -LSo tmp.zip https://codeload.github.com/maciakl/vim-neatstatus/zip/master && \
unzip tmp.zip && \
rm tmp.zip && \
mv vim-neatstatus-master .vim/bundle/vim-neatstatus


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
unset REPLY
