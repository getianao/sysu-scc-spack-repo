# sysu-scc-spack-repo

[Spack](https://spack.readthedocs.io/en/stable/repositories.html) package repository maintained by Student Cluster Competition Team @ Sun Yat-sen University.

## How to use

```bash
git clone https://github.com/SYSU-SCC/sysu-scc-spack-repo
spack repo add --scope=site sysu-scc-spack-repo

# A Simple Test
spack env create sysu-scc sysu-scc-spack-repo/spack.yaml
spack env activate -p sysu-scc
spack install
spack load hpl-ai
cp $(spack location -i hpl-ai)/bin/HPL.dat HPL.dat
OMP_NUM_THREADS=2 $(which mpirun) -n 4 xhpl_ai
```

## License

This project is part of Spack. Spack is distributed under the terms of both the
MIT license and the Apache License (Version 2.0). Users may choose either
license, at their option.

All new contributions must be made under both the MIT and Apache-2.0 licenses.

See LICENSE-MIT, LICENSE-APACHE, COPYRIGHT, and NOTICE for details.

SPDX-License-Identifier: (Apache-2.0 OR MIT)

LLNL-CODE-811652
