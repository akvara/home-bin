#!/bin/sh

echo "Resetting Webstorm"
rm $HOME/Library/Preferences/jetbrains.webstorm.*.plist
rm $HOME/Library/Preferences/WebStorm2019.*/eval/*.key
sed -i'' -e '/evlsprt/d' $HOME/Library/Preferences/WebStorm2019.1/options/other.xml
