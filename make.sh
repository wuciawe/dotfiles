#!/bin/bash
############################
# ./make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="xmodmap gemrc profile Xdefaults zshrc bashrc vimrc xinitrc tmux.conf aria2 makepkg.conf yaourtrc"    # list of files/folders to symlink in homedir
# delete asoundrc since using pulseaudio instead

configfiles="awesome fontconfig ibus powerline"

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
if [ -d $olddir ]; then
    rm -rf $olddir
fi
mkdir -p $olddir/local/share
mkdir -p $olddir/config
mkdir -p $olddir/vim
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    if [ -e ~/.$file ]; then
        echo "Moving any existing dotfile $file from ~ to $olddir"
        mv ~/.$file $olddir/$file
    fi
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done


if [ ! -e ~/.config ]; then
    echo "Creating ~/.config dir"
    mkdir -p ~/.config
fi
for file in $configfiles; do
    if [ -e ~/.config/$file ]; then
        echo "Moving matched dotfile $file from ~/.config to $olddir/config"
        mv ~/.config/$file $olddir/config/$file
    fi
    echo "Creating symlink to config/$file in ~/.config"
    ln -s $dir/config/$file ~/.config/$file
done


if [ ! -e ~/.local ]; then
    echo "Creating ~/.local dir"
    mkdir -p ~/.local
fi
if [ -e ~/.local/share/systemd ]; then
    echo "Moving ~/.local/share/systemd to $olddir/local/share"
    mv ~/.local/share/systemd $olddir/local/share/systemd
fi
echo "Creating symlink to local/share/systemd in ~/.local/share"
ln -s $dir/local/share/systemd ~/.local/share/systemd

if [ -e ~/.local/bin ]; then
    echo "Moving ~/.local/bin to $olddir/local"
    mv ~/.local/bin $olddir/local/bin
fi
echo "Creating symlink to local/bin in ~/.local"
ln -s $dir/local/bin ~/.local/bin


if [ ! -e ~/.vim ]; then
    echo "Creaing ~/.vim dir"
    mkdir -p ~/.vim
fi
if [ -e ~/.vim/colors ]; then
    echo "Moving ~/.vim/colors to $olddir/vim"
    mv ~/.vim/colors $olddir/vim/colors
fi
echo "Creating symlink to vim/colors in ~/.vim"
ln -s $dir/vim/colors ~/.vim/colors
