# Copyright 2013-2022 Lawrence Livermore National Security, LLC and other
# Spack Project Developers. See the top-level COPYRIGHT file for details.
#
# SPDX-License-Identifier: (Apache-2.0 OR MIT)

from spack import *


class PyPortpicker(PythonPackage):
    """A library to choose unique available network ports."""

    homepage = "https://pypi.python.org/pypi/portpicker"

    version('1.5.2', expand=False, url = "https://files.pythonhosted.org/packages/53/47/085215ca086b0e456421158a912d573f162644d6ef7a96de60fbc6dc99b2/portpicker-1.5.2-py3-none-any.whl",sha256="01113f51c3cc63290a44dd7ae6e3eb9f8fe1b8a1f9d7988a897944230c39cd52")

    depends_on('python@3.6:')
