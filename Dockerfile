FROM centos:latest

LABEL maintainer="Codicus" description="Centos Spice"

RUN yum -y install epel-release; \
  yum -y update; \
  yum -y install mc nmon iproute telnet vim xorg-x11-server-Xorg xorg-x11-xinit xorg-x11-drv-evdev xorg-x11-drv-mouse xorg-x11-drv-libinput xorg-x11-server-Xspice; \
  yum -y groups install "Cinnamon"; \
  /bin/dbus-uuidgen > /etc/machine-id; \
  yum clean all

COPY ["rootfs", "/"]

HEALTHCHECK --interval=60s --timeout=15s \
 CMD ss -lntp | grep -q ':5900'

RUN useradd user

USER user

CMD ["xinit", "/usr/bin/cinnamon-session", "--", "/usr/bin/X", "-config", "/etc/X11/spice-xorg.conf", ":0"]
