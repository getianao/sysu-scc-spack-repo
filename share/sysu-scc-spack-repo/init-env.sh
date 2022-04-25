git clone \
    -c feature.manyFiles=true \
    --depth=1 \
    -b releases/latest \
    https://github.com/spack/spack $(dirname ${SCC_SETUP_ENV})/../../../spack
(. $(dirname ${SCC_SETUP_ENV})/../../../spack/share/spack/setup-env.sh &&
    spack compiler add --scope=site &&
    spack repo add --scope=site $(dirname ${SCC_SETUP_ENV})/../../../sysu-scc-spack-repo &&
    spack env create sysu-scc $(dirname ${SCC_SETUP_ENV})/../../../sysu-scc-spack-repo/spack.yaml)
. ${SCC_SETUP_ENV}
spack env deactivate
spack install ${SCC_DEFAULT_COMPILER} && spack gc -y
spack clean -a
spack compiler add --scope=site $(spack location -i ${SCC_DEFAULT_COMPILER})
spack config --scope=site add "packages:all:compiler:[${SCC_DEFAULT_COMPILER}]"
