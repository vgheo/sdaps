
# dependencies can be seen in the PPA build :
# https://launchpadlibrarian.net/329160654/buildlog_ubuntu-trusty-amd64.sdaps_1.2.0-1_BUILDING.txt.gz
# https://github.com/sdaps/sdaps/blob/master/debian/control

FROM ubuntu:16.04

RUN apt-get update 

RUN apt-get install -y git

RUN apt-get install -y \
 python3 python3-dev libtiff5-dev \
 pkg-config python3-distutils-extra python3-pkg-resources python3-cairo-dev \
 libcairo2-dev libglib2.0-dev \
 python3-pil python3-reportlab zbar-tools

RUN apt-get install -y \
 texlive texlive-generic-recommended texlive-pictures \
 texlive-latex-recommended \
 texlive-lang-english texlive-latex-extra texlive-science

RUN apt-get install -y \
 python3-cairo python3-gi python3-pil \
 python3-reportlab python3-gi-cairo \
 gir1.2-gtk-3.0 gir1.2-poppler-0.18 python3-opencv

# runtime
RUN apt-get install -y \
 python3-cairo python3-gi python3-pil \
 python3-reportlab python3-gi-cairo zbar-tools

WORKDIR /app

RUN git clone --branch master https://github.com/sdaps/sdaps

WORKDIR /app/sdaps
RUN ./setup.py build

