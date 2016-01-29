FROM debian:jessie
MAINTAINER Robin Dietrich <me@invokr.org>

ENV DEBIAN_FRONTEND=noninteractive
ENV MPD_DEFAULT_PERM="read,add,control,admin"
ENV MPD_ADMIN_PASS="changeme"
ENV MPD_STREAM_PORT=8000

# Upgrade base system
RUN apt-get update -y && apt-get upgrade -y && apt-get install mpd wget -y

# Install dockerize and dumb init
RUN wget https://github.com/jwilder/dockerize/releases/download/v0.2.0/dockerize-linux-amd64-v0.2.0.tar.gz \
 && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-v0.2.0.tar.gz && rm *.gz \
 && wget https://github.com/Yelp/dumb-init/releases/download/v1.0.0/dumb-init_1.0.0_amd64 \
 && mv dumb-init_1.0.0_amd64 /usr/local/bin/dumb-init \
 && chmod +x /usr/local/bin/dumb-init

# MPD Folders
RUN mkdir /mpd /run/mpd && chown -R mpd /mpd /run/mpd /var/lib/mpd

# Add mpd config and init
ADD config/mpd.conf /etc/mpd.conf.tpl
ADD scripts/init.sh /init

# Export mpd and http stream ports
EXPOSE 6600
EXPOSE 8000

CMD ["/usr/local/bin/dumb-init", "/init"]
