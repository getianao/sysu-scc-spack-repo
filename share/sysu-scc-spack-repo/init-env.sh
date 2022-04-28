git clone \
    -c feature.manyFiles=true \
    -b releases/latest \
    --depth=1 \
    https://github.com/spack/spack \
    $(dirname ${SCC_SETUP_ENV})/../../../spack
rm -rf $(dirname ${SCC_SETUP_ENV})/../../../spack/.git
. ${SCC_SETUP_ENV}
spack repo add --scope=site $(dirname ${SCC_SETUP_ENV})/../..
spack compiler add --scope=site
spack env create sysu-scc $(dirname ${SCC_SETUP_ENV})/../../spack.yaml
. ${SCC_SETUP_ENV}
spack install -y ${SCC_DEFAULT_COMPILER} && spack gc -y && spack clean -ab
spack compiler add --scope=site $(spack location -i ${SCC_DEFAULT_COMPILER})
spack config --scope=site add "packages:all:compiler:[${SCC_DEFAULT_COMPILER}]"
