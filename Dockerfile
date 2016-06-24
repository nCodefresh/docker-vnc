# Firefox over VNC
FROM ubuntu:latest

# make sure the package repository is up to date
#RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

# Install vnc, xvfb in order to create a 'fake' display and firefox
RUN apt-get install -y x11vnc xvfb firefox
RUN mkdir ~/.vnc

#ENV VNC_PASSWORD $VNC_PASSWORD

# Setup a password
#RUN x11vnc -storepasswd $VNC_PASSWORD ~/.vnc/passwd
# Autostart firefox (might not be the best way to do it, but it does the trick)
#RUN bash -c 'echo "firefox" >> /.bashrc'

RUN mkdir -p /src
WORKDIR /src
COPY . /src

EXPOSE 5900

RUN chmod -R +x .
CMD ["/src/init-vnc.sh"]
