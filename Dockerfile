FROM nvidia/cuda:12.2.2-devel-ubuntu20.04

# WildRig is OpenCL-based — request the OpenCL capability so nvidia-container-toolkit
# mounts the NVIDIA OpenCL ICD (libnvidia-opencl.so.1) into the container at runtime.
ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility,opencl

RUN rm -f /etc/apt/sources.list.d/cuda.list

RUN apt-get update \
    && apt-get -y install --no-install-recommends wget ca-certificates xz-utils ocl-icd-libopencl1 \
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
