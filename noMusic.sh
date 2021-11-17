#!/bin/bash

settingsFile="/home/pi/musicManPlayMode.txt"
source $settingsFile

echo 'musicManPlayMode="none"' > $settingsFile

killall vlc
pkill vlc
