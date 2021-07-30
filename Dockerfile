FROM ubuntu:20.04
ARG DEBIAN_FRONTEND="noninteractive"
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    ccache \
    cmake \
    device-tree-compiler \
    dfu-util \
    file \
    libpython3.8-dev \
    g++-multilib \
    gcc \
    gcc-multilib \
    git \
    gperf \
    libsdl2-dev \
    make \
    ninja-build \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-tk \
    python3-wheel \
    tzdata \
    wget \
    xz-utils \
    ssh-client \
    && rm -rf /var/lib/apt/lists/*
RUN pip3 install -r https://raw.githubusercontent.com/zephyrproject-rtos/zephyr/master/scripts/requirements.txt && \
    pip3 install -r https://raw.githubusercontent.com/zephyrproject-rtos/mcuboot/master/scripts/requirements.txt && \
    pip3 install west
RUN wget -O archive.tar.bz2 "https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/gcc-arm-none-eabi-9-2019-q4-major-x86_64-linux.tar.bz2?revision=108bd959-44bd-4619-9c19-26187abf5225&la=en&hash=E788CE92E5DFD64B2A8C246BBA91A249CB8E2D2D" && \
    echo fe0029de4f4ec43cf7008944e34ff8cc archive.tar.bz2 > /tmp/archive.md5 && md5sum -c /tmp/archive.md5 && rm /tmp/archive.md5 && \
    tar xf archive.tar.bz2 -C /opt && \
    rm archive.tar.bz2
RUN mkdir -p /.ccache && chmod 777 /.ccache && mkdir /builds && chmod 777 /builds
ENV ZEPHYR_TOOLCHAIN_VARIANT=gnuarmemb
ENV GNUARMEMB_TOOLCHAIN_PATH=/opt/gcc-arm-none-eabi-9-2019-q4-major/
WORKDIR /builds
