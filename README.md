# My dotfiles

## 安装

执行下面的命令

    git clone https://github.com/wasw100/dotfiles.git
    cd dotfiles
    ./bootstrap.sh

## 项目中使用到的代码

- 同步脚本参照: [bootstrap](https://github.com/mathiasbynens/dotfiles/blob/master/bootstrap.sh)

- 插件管理: [vim-pathogen](https://github.com/tpope/vim-pathogen)



## submodule中包含下面的库

- 目录树插件: [nerdtree](https://github.com/scrooloose/nerdtree)

## git

- 默认没设置config user.email, uer.name, 可以根据git提示设置全局的或者项目的user.name和user.email

## shell中显示git分支(https://github.com/jimeh/git-aware-prompt)

## 删除submodule

    git submodule deinit -f -- .vim/bundle/jedi-vim
    git rm -f .vim/bundle/jedi-vim/
    rm -rf .git/modules/.vim/bundle/jedi-vim/
