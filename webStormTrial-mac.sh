#!/bin/sh

echo "Resetting Webstorm"
rm $HOME/Library/Preferences/jetbrains.webstorm.*.plist
rm $HOME/Library/Preferences/WebStorm2018.*/eval/*.key
sed -i'' -e '/evlsprt/d' $HOME/Library/Preferences/WebStorm2018.2/options/other.xml
