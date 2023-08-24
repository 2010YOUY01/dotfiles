echo "Creat symlinks"
path=$(dirname "$0")
path=$(realpath "$path")

mkdir $HOME/.config
mkdir $HOME/.config/nvim

# oh-my-zsh theme
ln -s $path/yyt.zsh-theme $HOME/.oh-my-zsh/themes/yyt.zsh-theme
ln -s $path/key-bindings.zsh $HOME/.oh-my-zsh/lib/key-bindings.zsh
ln -s $path/completion.zsh $HOME/.oh-my-zsh/lib/completion.zsh
ln -s $path/.tmux.conf $HOME/.tmux.conf
ln -s $path/.zshrc $HOME/.zshrc
# Editor
ln -s $path/.vimrc $HOME/.config/nvim/init.vim
ln -s $path/coc-settings.json $HOME/.config/nvim/coc-settings.json
ln -s $path/.vimrc $HOME/.vimrc
