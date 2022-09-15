# syntax=docker/dockerfile:1.4
FROM debian:11-slim
RUN <<EOF
apt-get update -y
apt-get upgrade -y
apt-get install --no-install-recommends -y \
    clang-11 python3 \
    make patch patchelf bash \
    tar gzip unzip bzip2 xz-utils \
    file gnupg2 git \
    ca-certificates passwd
apt-get autoremove -y
apt-get clean -y
rm -rf /var/lib/apt/lists/*
useradd -m scc
EOF
USER scc
ARG SCC_OPT=/home/scc/opt
WORKDIR ${SCC_OPT}
COPY . sysu-scc-spack-repo
ENV SCC_SETUP_ENV=${SCC_OPT}/sysu-scc-spack-repo/share/sysu-scc-spack-repo/setup-env.sh
RUN $(dirname ${SCC_SETUP_ENV})/init-env.sh
