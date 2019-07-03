#!/bin/sh

rm ~/.WebStorm*/config/eval/WebStorm*evaluation.key
rm ~/.WebStorm*/config/options/options.xml
rm -rf ~/.java/.userPrefs/jetbrains/webstorm
rm -rf ~/Library/Preferences/WebStorm2018.*/eval
sed -i -- '/evlsprt/d' ~/Library/Preferences/WebStorm2018.3/options/options.xml

open ~/Library/Preferences/com.apple.java.util.prefs.plist
