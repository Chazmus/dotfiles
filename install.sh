#!/bin/bash

#############################
# For installing my dotfiles
#############################

########## Variables#######

dir=~/dotfiles
olddir=~/dotfiles_old
files="zshrc"

###########################

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# Install my vim config from github
cd ~
git clone --recursive https://github.com/chazmus/vim-config .vim
echo "Moving vimrc into ~/dotfiles_old"
mv ~/.vimrc ~/dotfiles_old
echo "Creating vimrc symlink"
ln -s ~/.vim/vimrc ~/.vimrc


