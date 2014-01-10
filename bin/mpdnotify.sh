#!/bin/bash

mpdinfo=`ncmpcpp --now-playing`
twmnc -t "Now Playing: " -c "$mpdinfo"
