# Copyright 2013-2022 Lawrence Livermore National Security, LLC and other
# Spack Project Developers. See the top-level COPYRIGHT file for details.
#
# SPDX-License-Identifier: (Apache-2.0 OR MIT)

from spack import *


class PyAltairSaver(PythonPackage):
    """Altair extension for saving charts in a variety of formats."""

    homepage = "https://altair-viz.github.io/"
    url = "https://github.com/altair-viz/altair_saver/archive/refs/tags/v0.5.0.tar.gz"

    version('0.5.0', sha256="3ec2b81676e1c76ba3802ba9a611debae2e994c8bd3979c745b285650de5f100")

    depends_on('python@3.6:')
    depends_on('py-altair', type="run")
    depends_on('py-altair_data_server@0.4.0:', type="run")
    depends_on('py-altair_viewer', type="run")
    depends_on('py-selenium', type="run")
