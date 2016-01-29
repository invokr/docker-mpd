Docker MPD
==========

![](https://badge.imagelayers.io/invokr/mpd:latest.svg)
![](https://img.shields.io/docker/pulls/invokr/mpd.svg)

MPD docker container. Streams via http and allows you to set default permissions as well
as an admin password.

The `/mpd` folder should contain the `music` and `playlists` subdirectory.

Running the container
----------------------

    docker pull invokr/mpd
    docker run -name mpd -d -p 8000:8000 -p 6600:6600 -v mpd:/mpd -e MPD_DEFAULT_PERM="" -e MPD_ADMIN_PASS="pw" -e MPD_STREAM_PORT=8000 invokr/mpd
