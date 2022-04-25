export SCC_DEFAULT_COMPILER=gcc@7.5.0
. $(dirname ${SCC_SETUP_ENV})/../../../spack/share/spack/setup-env.sh
spack env create sysu-scc $(dirname ${SCC_SETUP_ENV})/../../spack.yaml
spack env activate -p sysu-scc
