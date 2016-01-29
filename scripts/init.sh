#!/bin/bash

mkdir -p /mpd/playlists
mkdir -p /mpd/music

dockerize -template /etc/mpd.conf.tpl > /etc/mpd.conf
mpd --stdout --no-daemon
