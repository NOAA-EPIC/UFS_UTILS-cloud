help([[ 
Load environment to compile UFS_UTILS on NOAA CSPs using Intel
]])

prepend_path("MODULEPATH", "/contrib/spack-stack-rocky8/spack-stack-1.6.0/envs/upp-addon-env/install/modulefiles/Core")
prepend_path("MODULEPATH", "/apps/modules/modulefiles")
prepend_path("PATH", "/contrib/EPIC/bin")
load("gnu")
load("stack-intel")
load("stack-intel-oneapi-mpi")

--stack_intel_ver=os.getenv("stack_intel_ver") or "2021.10.0"
--load(pathJoin("stack-intel", stack_intel_ver))

--stack_impi_ver=os.getenv("stack_impi_ver") or "2021.10.0"
--load(pathJoin("stack-intel-oneapi-mpi", stack_impi_ver))
unload("gnu")

load("common4noaacloud")

setenv("CC", "mpiicc")
setenv("CXX", "mpiicpc")
setenv("FC", "mpiifort")

whatis("Description: UFS_UTILS build environment on NOAA Cloud")
