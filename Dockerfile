FROM ubuntu:rolling

RUN apt-get update && apt-get install -y avahi-daemon avahi-utils

RUN sed -i 's%#enable-dbus=yes%enable-dbus=no%' /etc/avahi/avahi-daemon.conf

COPY ./avahi/nsswitch.conf /etc/nsswitch.conf
COPY ./avahi/afpd.service /etc/avahi/services/afpd.service

ENTRYPOINT avahi-daemon