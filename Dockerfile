FROM centos:latest

RUN yum -y install epel-release; \
  yum -y update; \
  yum -y install mc nmon iproute telnet vim xorg-x11-server-Xorg xorg-x11-xinit xorg-x11-drv-evdev xorg-x11-drv-mouse xorg-x11-drv-libinput xorg-x11-server-Xspice; \
  yum clean all
