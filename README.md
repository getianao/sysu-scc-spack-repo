# sysu-scc-spack-repo

[Spack](https://spack.readthedocs.io/en/stable/repositories.html) package repository maintained by Student Cluster Competition Team @ Sun Yat-sen University.

## How to use

### 从零开始

最小化配置了一个可以使用的 spack，软件依赖可以参考 [Dockerfile](./Dockerfile)。

```bash
git clone https://github.com/SYSU-SCC/sysu-scc-spack-repo

# 只依赖这一个环境变量，可以放进 ~/.bashrc
export SCC_SETUP_ENV=$(real path sysu-scc-spack-repo/share/sysu-scc-spack-repo/setup-env.sh)

# 初始化
sysu-scc-spack-repo/share/sysu-scc-spack-repo/init-env.sh

# 后续每次只需要执行这一句即可使用配好的环境
. ${SCC_SETUP_ENV}
```

### 集成进已有的 spack 环境

```bash
git clone https://github.com/SYSU-SCC/sysu-scc-spack-repo
spack repo add --scope=site sysu-scc-spack-repo

# A Simple Test
spack env create sysu-scc sysu-scc-spack-repo/spack.yaml
spack env activate -p sysu-scc
spack install
spack env deactivate
```

### 测试是否能用

```bash
spack install sysu-scc.hpl-ai ^blaspp+openmp ^openblas threads=openmp ^mpich
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
