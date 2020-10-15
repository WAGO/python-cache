FROM python:3.8 as base
ARG HOST_IP=registry.mylan

ENV HOME /root
ENV LD_LIBRARY_PATH=/usr/lib/arm-linux-gnueabihf/hdf5/serial/

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

COPY install-certificates.sh /
RUN chmod +x /install-certificates.sh
RUN /install-certificates.sh
RUN pip install "devpi-client>=2.3.0"
RUN devpi use http://${HOST_IP}:3141/root/public --set-cfg
# RUN pip config set --global global.index-url http://${HOST_IP}:3141/app/dev/+simple
# RUN pip config set --global global.extra-index-url https://www.piwheels.org/simple,https://pypi.org/simple
RUN pip config set --global install.trusted-host ${HOST_IP}

COPY resources /usr/bin
RUN chmod +x /usr/bin/docker-entrypoint.sh
RUN chmod +x /usr/bin/collect-wheels.sh
RUN chmod +x /usr/bin/publish-wheels.sh

FROM scratch as final
LABEL maintainer = Wago <dirk.meihoefer@wago.com>
LABEL description="Python wheel builder"
COPY --from=base / /
ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "bash" ]