export SCC_DEFAULT_COMPILER=gcc@7.5.0
. $(dirname ${SCC_SETUP_ENV})/../../../spack/share/spack/setup-env.sh
spack env activate -d $(dirname ${SCC_SETUP_ENV})/../../../sysu-scc-spack-repo -p sysu-scc
