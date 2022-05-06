# syntax=docker/dockerfile:1.4
FROM debian:11
RUN <<EOF
apt update -y
apt upgrade -y
apt install --no-install-recommends -y \
    apt-transport-https ca-certificates \
    software-properties-common \
    sudo passwd docker.io # nvidia-driver
apt-add-repository non-free
apt-add-repository contrib
apt update -y
apt upgrade -y
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
WORKDIR ~
ENV SCC_SETUP_ENV=~/sysu-scc-spack-repo/share/sysu-scc-spack-repo/setup-env.sh
COPY . sysu-scc-spack-repo
RUN <<EOF
sysu-scc-spack-repo/share/sysu-scc-spack-repo/init-env.sh
EOF
