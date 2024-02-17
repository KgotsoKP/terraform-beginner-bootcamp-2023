#!/usr/bin/env bash

# Check if the alias already exists in the .bash_profile
grep -q 'alias tf="terraform"' ~/.bash_profile

# $? is a special variable in bash that holds the exit status of the last command
if [ $? -ne 0 ]; then
    echo 'alias tf="terraform"' >> ~/.bash_profile
    echo 'Alias added successfully.'
else
    echo 'Alias already exists in the .bash_profile.'
fi

source ~/.bash_profile
