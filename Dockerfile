FROM nvidia/cuda:12.2.2-devel-ubuntu20.04

RUN rm -f /etc/apt/sources.list.d/cuda.list

RUN apt-get update \
    && apt-get -y install --no-install-recommends wget ca-certificates ocl-icd-libopencl1 \
    && mkdir -p /wildrig /etc/OpenCL/vendors \
    && echo "libnvidia-opencl.so.1" > /etc/OpenCL/vendors/nvidia.icd \
    && wget -O /tmp/wildrig.tar.gz https://github.com/andru-kun/wildrig-multi/releases/download/0.48.9/wildrig-multi-linux-0.48.9.tar.gz \
    && tar -xzf /tmp/wildrig.tar.gz -C /wildrig \
    && rm /tmp/wildrig.tar.gz \
    && chmod +x /wildrig/wildrig-multi \
    && ln -sf libcuda.so.1 /lib/x86_64-linux-gnu/libcuda.so \
    && ln -sf libnvidia-ml.so.1 /lib/x86_64-linux-gnu/libnvidia-ml.so \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /wildrig

ENTRYPOINT ["./wildrig-multi"]
