# sysu-scc-spack-repo

[Spack](https://spack.readthedocs.io/en/v0.16.2/repositories.html) package repository maintained by Student Cluster Competition Team @ Sun Yat-sen University.

## How to use

```bash
git clone https://github.com/SYSU-SCC/sysu-scc-spack-repo
spack repo add --scope=site sysu-scc-spack-repo

# A Simple Test

spack install \
    sysu-scc-spack-repo.hpl-ai@2.3d \
    blaspp@2021.04.01+openmp \
    openblas@0.3.15 threads=openmp \
    openmpi@3.1.6
spack load hpl-ai
cp `spack location --install-dir hpl-ai`/bin/HPL.dat HPL.dat
mpirun -n 4 -x OMP_NUM_THREADS=2 xhpl_ai
```

## License

This project is part of Spack. Spack is distributed under the terms of both the
MIT license and the Apache License (Version 2.0). Users may choose either
license, at their option.

All new contributions must be made under both the MIT and Apache-2.0 licenses.

See LICENSE-MIT, LICENSE-APACHE, COPYRIGHT, and NOTICE for details.

SPDX-License-Identifier: (Apache-2.0 OR MIT)

LLNL-CODE-811652
