#!/bin/bash

settingsFile="/home/pi/musicManPlayMode.txt"
source $settingsFile

siteFile="/home/pi/musicManSiteName.txt"
source $siteFile


#####
# Check if we can reach Google.
# If we cannot then check if it is ment to be remote music and switch to local music. That way we have music playing!
#####

if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
  echo "IPv4 is up"

else
  echo "IPv4 is down"
  if [ $musicManPlayMode == "remote" ]; then
    echo "Stopping music just now... til we get a connection"
    /home/pi/music-man/noMusic.sh
  fi
fi

#####
# Check if we can see VLC
# If we cannot then check what is ment to be playing... and play it!
#####

if pgrep -x "vlc" > /dev/null; then
  echo "Running"
else
  echo "Stopped... should we be playing music?"
  if [ $musicManPlayMode == "remote" ]; then
    curl -X POST --data-urlencode "payload={\"channel\": \"itoffice\", \"username\": \"Jarvis\", \"text\": \"🎵 Hey guys 🤔.... the music at ${siteName} has stopped. Let me get on that...\"}" https://chat.racetrackpitstop.co.uk/hooks/q44Rr8zr7AqWB6xTi/8D4WYnnEZGmZojtPncG9vmcqyajbT3dRJCz98fAtMKGuTB4n
    echo "Ment to be playing remote music.. starting that up now"
    sleep 3s
    curl -X POST --data-urlencode "payload={\"channel\": \"itoffice\", \"username\": \"Jarvis\", \"text\": \"🎵 All fixed. I've started playing music again!\"}" https://chat.racetrackpitstop.co.uk/hooks/q44Rr8zr7AqWB6xTi/8D4WYnnEZGmZojtPncG9vmcqyajbT3dRJCz98fAtMKGuTB4n
    /home/pi/music-man/remoteMusic.sh &
  elif [ $musicManPlayMode == "none" ]; then
    curl -X POST --data-urlencode "payload={\"channel\": \"itoffice\", \"username\": \"Jarvis\", \"text\": \"🎵 Hey guys 🤔.... the music at ${siteName} has stopped. Let me get on that...\"}" https://chat.racetrackpitstop.co.uk/hooks/q44Rr8zr7AqWB6xTi/8D4WYnnEZGmZojtPncG9vmcqyajbT3dRJCz98fAtMKGuTB4n
    echo "Ment to be playing remote music.. starting that up now"
    sleep 3s
    curl -X POST --data-urlencode "payload={\"channel\": \"itoffice\", \"username\": \"Jarvis\", \"text\": \"🎵 All fixed. I've started playing music again!\"}" https://chat.racetrackpitstop.co.uk/hooks/q44Rr8zr7AqWB6xTi/8D4WYnnEZGmZojtPncG9vmcqyajbT3dRJCz98fAtMKGuTB4n
    /home/pi/music-man/remoteMusic.sh &
  elif [ $musicManPlayMode == "local" ]; then
    curl -X POST --data-urlencode "payload={\"channel\": \"itoffice\", \"username\": \"Jarvis\", \"text\": \"🎵 Hey guys 🤔.... the music at ${siteName} has stopped. Let me get on that...\"}" https://chat.racetrackpitstop.co.uk/hooks/q44Rr8zr7AqWB6xTi/8D4WYnnEZGmZojtPncG9vmcqyajbT3dRJCz98fAtMKGuTB4n
    echo "Ment to be playing local music.. starting that up now"
    sleep 3s
    curl -X POST --data-urlencode "payload={\"channel\": \"itoffice\", \"username\": \"Jarvis\", \"text\": \"🎵 All fixed. I've started playing music again!\"}" https://chat.racetrackpitstop.co.uk/hooks/q44Rr8zr7AqWB6xTi/8D4WYnnEZGmZojtPncG9vmcqyajbT3dRJCz98fAtMKGuTB4n
    /home/pi/music-man/localMusic.sh &
  else
    echo "Not ment to be playing anything... we good!"
  fi
fi
