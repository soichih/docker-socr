FROM ubuntu:16.04
MAINTAINER Soichi Hayashis <hayashis@iu.edu>

EXPOSE 5900
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    vim curl unzip tightvncserver xfce4 \
    tcsh libglu1-mesa libgomp1 libjpeg62 mesa-utils 

#Install SOCR binary
RUN curl http://www.socr.ucla.edu/jars/SOCR/SOCR_1.2_bin.zip > /tmp/socr.zip && unzip /tmp/socr.zip -d /socr && rm /tmp/socr.zip

RUN apt-get install -y openjdk-8-jre

RUN apt-get install -y lxde
ADD startvnc.sh /
ADD xstartup /root/.vnc/xstartup
CMD ["/startvnc.sh"]
ENV USER=root X11VNC_PASSWORD=override

