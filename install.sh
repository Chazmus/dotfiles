#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2022 chaz.bailey <chaz.bailey@C02YJ1MVJGH8>
#
# Distributed under terms of the MIT license.

import os
import shutil


"""
Install the dotfiles in this directory
"""

target_dir = os.path.expanduser("~")
print("Deploying dotfiles to " + target_dir)
source_dir = os.path.join(os.path.dirname(__file__), "dots")
dotfiles_to_deploy = os.listdir(source_dir)

def uniquify(path):
    filename, extension = os.path.splitext(path)
    counter = 1
    while os.path.exists(path):
        path = filename + "-" + str(counter) + extension
        counter += 1
    return path

backup_dotfiles = uniquify(os.path.join(target_dir, "dotfiles_old"))

for filename in dotfiles_to_deploy:
    source_file = os.path.join(source_dir, filename)
    destination = os.path.join(target_dir, filename)
    print("Checking if dotfile already exists")
    print(destination)
    print(os.path.exists(destination))
    if os.path.exists(destination):
        if not os.path.exists(backup_dotfiles):
            print("Creating backup dotfiles directory at: " + backup_dotfiles)
            os.makedirs(backup_dotfiles)
        
        print("Moving " + destination + " to backup dotfiles directory")
        shutil.move(destination, backup_dotfiles)
    print("Creating symlink from " + filename)
    os.symlink(source_file, destination, target_is_directory=False)



