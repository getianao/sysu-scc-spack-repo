# Copyright 2013-2021 Lawrence Livermore National Security, LLC and other
# Spack Project Developers. See the top-level COPYRIGHT file for details.
#
# SPDX-License-Identifier: (Apache-2.0 OR MIT)

from spack import *
import glob

class GpgpuSim(MakefilePackage):

    homepage = "https://github.com/gpgpu-sim/gpgpu-sim_distribution"
    git = homepage
    url      = "https://github.com/gpgpu-sim/gpgpu-sim_distribution/archive/refs/tags/v4.0.1.tar.gz"

    version('4.0.1', tag='v4.0.1')

    depends_on('makedepend', type=('build'))
    depends_on('sed', type=('build'))
    depends_on('bison', type=('build'))
    depends_on('flex', type=('build'))
    depends_on('zlib', type=('link'))
    depends_on('cuda@:11.0.99', type=('build', 'link', 'run'))
    depends_on('gl', type=('link'))

    def edit(self, spec, prefix):
        # fix <https://github.com/gpgpu-sim/gpgpu-sim_distribution/issues/221>
        cuda_sim_Makefile = FileFilter('src/cuda-sim/Makefile')
        cuda_sim_Makefile.filter(
            '> \$\(OUTPUT_DIR\)/ptx_parser_decode\.def',
            ' | sed \'s/"end of file"/end of file/\' '+
            ' | sed \'s/"invalid token"/invalid token/\' '+
            '> $(OUTPUT_DIR)/ptx_parser_decode.def')
        for mf in glob.glob("**/*akefile", recursive=True)+glob.glob("**/*.mk", recursive=True):
            m = FileFilter(mf)
            m.filter('gcc', 'cc -fno-reorder-blocks-and-partition')
            m.filter('g++', 'c++ -fno-reorder-blocks-and-partition')
    
    def install(self, spec, prefix):
        mkdirp(join_path(prefix, 'gpgpu-sim_distribution'))
        install_tree(self.stage.source_path, join_path(prefix, 'gpgpu-sim_distribution'))
        
    def setup_build_environment(self, env):
        env.set('CUDA_INSTALL_PATH', self.spec['cuda'].prefix)
        env.set('GPGPUSIM_ROOT', self.stage.source_path)
        env.set('GPGPUSIM_POWER_MODEL', self.stage.source_path+'/src/gpuwattch/')
        env.set('GPGPUSIM_SETUP_ENVIRONMENT_WAS_RUN', '1')

    def setup_run_environment(self, env):
        env.set('CUDA_INSTALL_PATH', self.spec['cuda'].prefix)


