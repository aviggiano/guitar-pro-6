FROM 32bit/ubuntu:16.04

# Install libs
RUN apt-get update
RUN apt-get install -y \
  wget libportaudio2:i386 gtk2-engines:i386 \
  libcrypto++9v5:i386 libpulse0:i386 \
  libsm6:i386 gksu libgl1-mesa-dri:i386 \
  libgl1-mesa-glx:i386
# Install libs not in apt-get
RUN wget -O libssl.deb http://security.ubuntu.com/ubuntu/pool/universe/o/openssl098/libssl0.9.8_0.9.8o-7ubuntu3.2.14.04.1_i386.deb
RUN dpkg -i libssl.deb
RUN wget -O libportaudio0.deb http://mirrors.kernel.org/ubuntu/pool/universe/p/portaudio/libportaudio0_18.1-7.1_i386.deb
RUN dpkg -i libportaudio0.deb
RUN wget -O gp6.deb https://www.guitar-pro.com/download.php?idfile=gp6_linux
RUN dpkg -i gp6.deb || true
# Fix broken things
RUN apt-get install -y -f
# Retry install
RUN dpkg -i gp6.deb

ENV PULSE_SERVER /run/pulse/native
CMD /opt/GuitarPro6/launcher.sh

