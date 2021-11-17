#!/bin/bash

settingsFile="/home/pi/musicManPlayMode.txt"
source $settingsFile

echo 'musicManPlayMode="remote"' > $settingsFile

sleep 3s
killall vlc
cvlc https://nitrocast.nitrosolutions.co.uk/radio/8000/radio.mp3 &
