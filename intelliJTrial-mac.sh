#!/bin/sh

rm ~/Library/Preferences/jetbrains.idea.*.plist
rm ~/Library/Preferences/IntelliJIdea2018.3/eval/*.key
sed -i'' -e '/evlsprt/d' ~/Library/Preferences/IntelliJIdea2018.3/options/other.xml
