# syntax=docker/dockerfile:1.4
FROM debian:11
RUN <<EOF
echo 'deb http://deb.debian.org/debian bullseye contrib non-free' | tee -a /etc/apt/sources.list.d/debian.extend.list
echo 'deb http://deb.debian.org/debian bullseye-updates contrib non-free' | tee -a /etc/apt/sources.list.d/debian.extend.list
echo 'deb http://security.debian.org/debian-security bullseye-security contrib non-free' | tee -a /etc/apt/sources.list.d/debian.extend.list
echo 'deb http://ftp.debian.org/debian bullseye-backports contrib non-free' | tee -a /etc/apt/sources.list.d/debian.extend.list
apt update -y
apt upgrade -y
apt install --no-install-recommends -y \
    gcc-10 g++-10 \
    make patch patchelf bash \
    tar gzip unzip bzip2 xz-utils \
    file gnupg2 git \
    python3 python3-dev python3-distutils \
    docker.io # nvidia-driver
apt clean -y
useradd scc
EOF
USER scc
WORKDIR /home/scc
COPY . /home/scc/sysu-scc-spack-repo
ENV SYSU_OPT=/home/scc \
    SYSU_DEFAULT_COMPILER=gcc@7.5.0
RUN <<EOF
git config --global http.sslverify false
git config --global https.sslverify false
git clone \
    -c feature.manyFiles=true \
    --depth=1 \
    -b releases/latest \
    https://github.com/spack/spack
source ${SYSU_OPT}/spack/share/spack/setup-env.sh
spack repo add --scope=site sysu-scc-spack-repo
spack compiler add --scope=site
spack install ${SYSU_DEFAULT_COMPILER} && spack gc -y
spack compiler add --scope=site $(spack location -i ${SYSU_DEFAULT_COMPILER})
spack config --scope=site add "packages:all:compiler:[${SYSU_DEFAULT_COMPILER}]"
spack clean -a
EOF
