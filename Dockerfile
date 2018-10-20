FROM debian:latest
RUN set -ex; \
  sed -i -r -e 's/ main/ main contrib non-free/' /etc/apt/sources.list; \
  sed -r -e 's/^deb /deb-src /' < /etc/apt/sources.list > /tmp/sources.list.new; \
  cat /tmp/sources.list.new >> /etc/apt/sources.list; \
  rm -f /tmp/sources.list.new; \
  apt-get -q update; \
  DEBIAN_FRONTEND=noninteractive apt-get install --quiet --yes \
    build-essential \
    debhelper \
    dpkg-dev \
    devscripts \
    dh-make \
    fakeroot \
    git \
    gnupg2 \
    pbuilder \
    rsync \
    sudo \
    tidy \
    ccache; \
  apt-get build-dep bash; \
  apt-get build-dep slurm-llnl; \
  apt-get clean; \
  rm -rf /var/lib/apt/lists/*
