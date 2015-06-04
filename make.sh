#!/bin/bash
############################
# ./make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="asoundrc profile Xdefaults zshrc bashrc vimrc xinitrc"    # list of files/folders to symlink in homedir
configfiles="awesome fontconfig ibus"

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
if [ -d $olddir ]; then
    rm -rf $olddir
fi
mkdir -p $olddir/local/share
mkdir -p $olddir/config
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

for file in $configfiles; do
    if [ -e ~/.config/$file ]; then
        ehco "Moving matched dotfile $file from ~/.config to $olddir/config"
        mv ~/.config/$file $olddir/config/$file
    fi
    echo "Creating symlink to config/$file in ~/.config"
    ln -s $dir/config/$file ~/.config/$file
done

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
