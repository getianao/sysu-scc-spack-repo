# Copyright 2013-2022 Lawrence Livermore National Security, LLC and other
# Spack Project Developers. See the top-level COPYRIGHT file for details.
#
# SPDX-License-Identifier: (Apache-2.0 OR MIT)

from spack import *


class PyAltairDataServer(PythonPackage):
    """A background data server for Altair charts."""

    homepage = "https://altair-viz.github.io/"
    url = "https://github.com/altair-viz/altair_data_server/archive/refs/tags/v0.4.1.tar.gz"

    version('0.4.1', sha256="bb8ff4e7a3c567a22ef873369660d1adcb87268324188546f4e333ec00c68363")

    depends_on('python@3.6:')
    depends_on('py-altair', type="run")
    depends_on('py-portpicker', type="run")
    depends_on('py-tornado', type="run")
