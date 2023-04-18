#!/bin/bash

# stow global stow packages, that require root privileges to run
stow -R -d ./special wrappedhl_desktop -t /usr/share/wayland-sessions/
stow -R -d ./special httpd_conf -t /opt/lampp/etc/
