# Copyright 2013-2022 Lawrence Livermore National Security, LLC and other
# Spack Project Developers. See the top-level COPYRIGHT file for details.
#
# SPDX-License-Identifier: (Apache-2.0 OR MIT)

from spack import *


class SysuLang(CMakePackage):
    """A mini, simple and modular Compiler for SYsU (a tiny C language)."""

    homepage = "https://github.com/arcsysu/SYsU-lang"
    git = homepage+".git"

    maintainers = ['wu-kan']

    version('main',  branch='main')

    depends_on('flex', type='build')
    depends_on('bison', type='build')
    depends_on('llvm+clang', type='link')
