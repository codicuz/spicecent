FROM codicus/spicecent:base

LABEL maintainer="Codicus" description="Centos Spice i3 wm"

RUN yum -y install i3* rxvt-unicode; \
  yum clean all

COPY ["rootfs", "/"]

HEALTHCHECK --interval=60s --timeout=15s \
 CMD ss -lntp | grep -q ':5900'

CMD ["xinit", "/usr/bin/i3", "--", "/usr/bin/X", "-config", "/etc/X11/spice-xorg.conf", ":0"]
