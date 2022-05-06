# syntax=docker/dockerfile:1.4
FROM debian:11
RUN <<EOF
apt update -y
apt upgrade -y
apt install --no-install-recommends -y \
    apt-transport-https ca-certificates \
    software-properties-common \
    sudo passwd
apt-add-repository non-free
apt-add-repository contrib
apt update -y
apt upgrade -y
# apt install --no-install-recommends -y docker.io nvidia-driver
apt install --no-install-recommends -y \
    gcc-10 g++-10 \
    make patch patchelf bash \
    tar unzip bzip2 xz-utils \
    file gnupg2 git \
    python3 python3-dev python3-distutils
apt clean -y
useradd -m scc
EOF
USER scc
ARG SCC_OPT=/home/scc/opt
WORKDIR ${SCC_OPT}
COPY . sysu-scc-spack-repo
ENV SCC_SETUP_ENV=${SCC_OPT}/sysu-scc-spack-repo/share/sysu-scc-spack-repo/setup-env.sh
RUN $(dirname ${SCC_SETUP_ENV})/init-env.sh
