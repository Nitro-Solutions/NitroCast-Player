#!/bin/bash

settingsFile="/home/pi/musicManPlayMode.txt"
source $settingsFile

echo 'musicManPlayMode="local"' > $settingsFile

sleep 3s
killall vlc
cvlc /home/pi/Music/localPlaylist.m3u --loop