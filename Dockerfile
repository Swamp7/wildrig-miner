FROM nvidia/cuda:12.2.2-devel-ubuntu20.04

RUN rm -f /etc/apt/sources.list.d/cuda.list

RUN apt-get update \
    && apt-get -y install --no-install-recommends wget ca-certificates xz-utils \
    && mkdir -p /wildrig \
    && wget -O /tmp/wildrig.tar.xz https://github.com/andru-kun/wildrig-multi/releases/download/0.48.0/wildrig-multi-linux-0.48.0.tar.xz \
    && tar -xJf /tmp/wildrig.tar.xz -C /wildrig \
    && rm /tmp/wildrig.tar.xz \
    && chmod +x /wildrig/wildrig-multi \
    && ln -sf libcuda.so.1 /lib/x86_64-linux-gnu/libcuda.so \
    && ln -sf libnvidia-ml.so.1 /lib/x86_64-linux-gnu/libnvidia-ml.so \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /wildrig

ENTRYPOINT ["./wildrig-multi"]
