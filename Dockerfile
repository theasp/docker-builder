FROM debian:stretch
RUN set -ex; \
  sed -re 's/ main/ main contrib non-free/' /etc/apt/sources.list; \
  apt-get -q update; \
  DEBIAN_FRONTEND=noninteractive apt-get apt-get install --quiet --yes --install-suggests \
    build-essential \
    debhelper \
    devscripts \
    dh-make \
    fakeroot \
    git \
    gnupg2 \
    pbuilder \
    rsync \
    sudo
