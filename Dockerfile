FROM debian:stretch
RUN set -ex; \
  sed -i -r -e 's/ main/ main contrib non-free/' /etc/apt/sources.list; \
  apt-get -q update; \
  DEBIAN_FRONTEND=noninteractive apt-get install --quiet --yes --install-suggests \
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
