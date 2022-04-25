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
    tar unzip bzip2 xz-utils \
    file gnupg2 git ca-certificates \
    python3 python3-dev python3-distutils \
    docker.io # nvidia-driver
apt clean -y
useradd scc
EOF
USER scc
ENV SCC_OPT=/home/scc/opt \
    SCC_SETUP_ENV='. /home/scc/opt/sysu-scc-spack-repo/share/sysu-scc-spack-repo/setup-env.sh'
WORKDIR ${SCC_OPT}
COPY . sysu-scc-spack-repo
RUN <<EOF
${SCC_OPT}/sysu-scc-spack-repo/share/sysu-scc-spack-repo/init-env.sh
EOF
