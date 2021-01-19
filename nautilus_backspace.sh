#!/bin/bash

if [[ $1 == "enable" ]]
then
        echo "Enabling backspace for nautilus"

        mkdir ./nautilus_temp/
        cd ./nautilus_temp/

        git clone https://github.com/riclc/nautilus_backspace &&
        cd ./nautilus_backspace/ &&

        mkdir -p ~/.local/share/nautilus-python/extensions/ &&
        cp ./BackspaceBack.py ~/.local/share/nautilus-python/extensions/ &&

        cd ../../ &&
        rm -rf ./nautilus_temp/

        killall nautilus
        nautilus &
elif [[ $1 == "disable" ]]
then
        echo "Disabling backspace for nautilus"

        rm -r ~/.local/share/nautilus-python/extensions/BackspaceBack.py

        killall nautilus
        nautilus &
else
        echo "Wrong command. Use 'apply' or 'remove'"
fi
