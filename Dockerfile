FROM codicus/spicecent:base

LABEL maintainer="Codicus" description="Centos Spice Cinnamon"

RUN yum -y group install "Cinnamon"; \
  /bin/dbus-uuidgen > /etc/machine-id; \
  yum clean all

COPY ["rootfs", "/"]

HEALTHCHECK --interval=60s --timeout=15s \
 CMD ss -lntp | grep -q ':5900'

CMD ["xinit", "/usr/bin/cinnamon-session", "--", "/usr/bin/X", "-config", "/etc/X11/spice-xorg.conf", ":0"]
