# Copyright 2013-2022 Lawrence Livermore National Security, LLC and other
# Spack Project Developers. See the top-level COPYRIGHT file for details.
#
# SPDX-License-Identifier: (Apache-2.0 OR MIT)

from spack import *


class Cutlass(CMakePackage, CudaPackage):
    """CUDA Templates for Linear Algebra Subroutines"""

    homepage = "https://github.com/NVIDIA/cutlass"
    git = homepage+".git"
    url = "https://github.com/NVIDIA/cutlass/archive/refs/tags/v2.9.0.tar.gz"

    version('master', branch='master')
    version(
        '2.9.0', sha256="ccca4685739a3185e3e518682845314b07a5d4e16d898b10a3c3a490fd742fb4")
    version('2.8.0', sha256="1938F0E739646370A59BA1F5E365BE4C701E8D9E0B9B725D306622E9AAFA6B2A".lower())
    variant('cuda', default=True, description='Build with CUDA')
    conflicts('~cuda')

    def setup_build_environment(self, env):
        env.set('CUDACXX', join_path(self.spec["cuda"].prefix, "bin", "nvcc"))

    def cmake_args(self):
        cmake_args = []
        define = CMakePackage.define
        cuda_arch = self.spec.variants['cuda_arch'].value
        if len(cuda_arch):
            cmake_args.append(
                define("CUTLASS_NVCC_ARCHS", ";".join(cuda_arch)))
        return cmake_args
