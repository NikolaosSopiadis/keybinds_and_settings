#!/bin/bash
killall openrgb
sleep 1
nohup openrgb >/dev/null 2>&1 --startminimized &

