#!/bin/sh

echo "Resetting Webstorm on Mac..."
rm -rf ~/Library/Preferences/WebStorm*/eval
sed -i  '' '/evlsprt/d' ~/Library/Preferences/WebStorm*/options/other.xml
rm -f ~/Library/Preferences/com.apple.java.util.prefs.plist
rm -f ~/Library/Preferences/com.jetbrains.*.plist
rm -f ~/Library/Preferences/jetbrains.*.*.plist
echo "Done."
