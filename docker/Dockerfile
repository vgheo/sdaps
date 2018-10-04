# dependencies copied from the PPA build :
# https://github.com/sdaps/sdaps/blob/stable/debian/control
#
# Refernces:
#  https://docs.docker.com/develop/develop-images/multistage-build/#use-multi-stage-builds
#  https://blogs.msdn.microsoft.com/jamiedalton/2018/05/17/windows-10-docker-gui/
#

FROM ubuntu:14.04.3

RUN apt-get update 

RUN apt-get install -y git

RUN apt-get install -y \
	python2.7 python2.7-dev libtiff5-dev \
 pkg-config python-distutils-extra python-pkg-resources python-cairo-dev \
 libcairo2-dev libglib2.0-dev debhelper \
 python-imaging python-reportlab python-zbar python-pdftools \
 texlive texlive-generic-recommended pgf  \
 latex-beamer pdftk \
 texlive-lang-english texlive-latex-extra texlive-science
 
 RUN apt-get install -y \
 python2.7-cairo python2.7-gi  python-gi-cairo
  
 
# suggests
# RUN apt-get install -y \
# 	libtiff-tools imagemagick sane-util
 	
WORKDIR /app

RUN git clone --recursive --branch 1.2.1 https://github.com/sdaps/sdaps

WORKDIR /app/sdaps
RUN ./setup.py build


# stage 2 - runtime
FROM ubuntu:14.04.3

RUN apt-get update

RUN apt-get install -y \
 python2.7-cairo python2.7-gi python-imaging libtiff5-dev \
 python-reportlab python-zbar python-gi-cairo python-pdftools \
 texlive texlive-generic-recommended pgf  \
 latex-beamer pdftk \
 texlive-lang-english texlive-latex-extra texlive-science

WORKDIR /app
COPY --from=0 /app/sdaps .  

WORKDIR /work
ENTRYPOINT ["/app/sdaps/sdaps.py"]
