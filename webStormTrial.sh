#!/bin/sh

echo "Resetting Webstorm on Linux..."
cd ~/.WebStorm*
rm config/eval/WebStorm*evaluation.key
rm config/options/options.xml
cd ~/.java/.userPrefs/jetbrains
rm -rf webstorm
echo "Done."
