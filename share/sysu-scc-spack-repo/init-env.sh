git clone \
    -c feature.manyFiles=true \
    --depth=1 \
    -b releases/latest \
    https://github.com/spack/spack ${SCC_OPT}/spack
(. ${SCC_OPT}/spack/share/spack/setup-env.sh &&
    spack compiler add --scope=site &&
    spack repo add --scope=site ${SCC_OPT}/sysu-scc-spack-repo &&
    spack env create sysu-scc ${SCC_OPT}/sysu-scc-spack-repo/spack.yaml)
${SCC_SETUP_ENV}
spack env deactivate
spack install ${SCC_DEFAULT_COMPILER} && spack gc -y
spack clean -a
spack compiler add --scope=site $(spack location -i ${SCC_DEFAULT_COMPILER})
spack config --scope=site add "packages:all:compiler:[${SCC_DEFAULT_COMPILER}]"