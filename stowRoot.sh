#!/bin/sh

# stow global stow packages, that require root privileges to run
stow -d ./special wrappedhl_desktop -t /usr/share/wayland-sessions/
stow -d ./special httpd_conf -t /opt/lampp/etc/
