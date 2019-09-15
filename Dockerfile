FROM centos:latest as base

LABEL maintainer="Codicus" description="Centos Spice"

RUN yum -y install epel-release; \
  yum -y update; \
  yum -y install mc nmon iproute telnet vim i3* rxvt-unicode xorg-x11-server-Xorg xorg-x11-xinit xorg-x11-drv-evdev xorg-x11-drv-mouse xorg-x11-drv-libinput xorg-x11-server-Xspice; \
  echo "exec i3" >> /root/.xinitrc

COPY ["rootfs", "/"]

HEALTHCHECK --interval=60s --timeout=15s \
 CMD ss -lntp | grep -q ':5900'

CMD ["xinit", "/root/.xinitrc", "--", "/usr/bin/X", ":1"]

