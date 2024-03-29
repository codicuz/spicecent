FROM centos:latest

LABEL maintainer="Codicus" description="Centos Spice"

RUN yum -y install epel-release; \
  yum -y update; \
  yum -y install mc nmon iproute telnet vim i3* rxvt-unicode xorg-x11-server-Xorg xorg-x11-xinit xorg-x11-drv-evdev xorg-x11-drv-mouse xorg-x11-drv-libinput xorg-x11-server-Xspice; \
  yum clean all

COPY ["rootfs", "/"]

HEALTHCHECK --interval=60s --timeout=15s \
 CMD ss -lntp | grep -q ':5900'

CMD ["xinit", "/usr/bin/i3", "--", "/usr/bin/X", "-config", "/etc/X11/spice-xorg.conf", ":0"]
