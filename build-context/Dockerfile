FROM python:3.8 as base
ARG HOST_IP=registry.mylan

ENV HOME /root
ENV LD_LIBRARY_PATH=/usr/lib/arm-linux-gnueabihf/hdf5/serial/

COPY resources /
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get autoremove -y \
    && apt-get install -y \
    gcc \
    build-essential \
    zlib1g-dev \
    wget \
    unzip \
    cmake \
    python3-dev \
    gfortran \
    libblas-dev \
    liblapack-dev \
    libatlas-base-dev \
    pkg-config \
    libhdf5-dev \
    && apt-get clean
RUN chmod +x /docker-entrypoint.sh
RUN chmod +x /install-certificates.sh
RUN pip config set --global global.extra-index-url https://www.piwheels.org/simple,http://${HOST_IP}:3141/app/dev/+simple
RUN pip config set --global install.trusted-host ${HOST_IP}

FROM scratch as final
LABEL maintainer = Wago <dirk.meihoefer@wago.com>
LABEL description="Python 3.8 with WAGO certificate for use in corporate network"
COPY --from=base / /
ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "bash" ]