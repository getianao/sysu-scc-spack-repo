# Copyright 2013-2022 Lawrence Livermore National Security, LLC and other
# Spack Project Developers. See the top-level COPYRIGHT file for details.
#
# SPDX-License-Identifier: (Apache-2.0 OR MIT)

from spack import *


class PyAltairViewer(PythonPackage):
    """Viewer for Altair and Vega-Lite visualizations."""

    homepage = "https://altair-viz.github.io/"
    url = "https://github.com/altair-viz/altair_viewer/archive/refs/tags/v0.4.0.tar.gz"

    version('0.4.0', sha256="f4619d716fe4a99deb3968926c3f3384eb3aa90fd1ce804bdd7c0d9b5649e475")

    depends_on('python@3.6:')
    depends_on('py-altair', type="run")
    depends_on('py-altair_data_server@0.4.0:', type="run")
