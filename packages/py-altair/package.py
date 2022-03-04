# Copyright 2013-2022 Lawrence Livermore National Security, LLC and other
# Spack Project Developers. See the top-level COPYRIGHT file for details.
#
# SPDX-License-Identifier: (Apache-2.0 OR MIT)

from spack import *


class PyAltair(PythonPackage):
    """Declarative statistical visualization library for Python"""

    homepage = "https://altair-viz.github.io/"
    url = "https://github.com/altair-viz/altair/archive/refs/tags/v4.2.0.tar.gz"

    version('4.2.0', sha256="EE28A56D4D7EF7A089D5B7F47F2555C66E5A47786D16DF5B274648D25550E1AB".lower())

    depends_on('python@3.6:')
    depends_on('py-entrypoints', type="run")
    depends_on('py-jsonschema', type="run")
    depends_on('py-numpy', type="run")
    depends_on('py-pandas', type="run")
    depends_on('py-toolz', type="run")
    depends_on('py-jinja2', type="run")
