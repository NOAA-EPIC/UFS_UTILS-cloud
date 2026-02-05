help([[
Load environment to compile UFS_UTILS in a container using GNU
]])

prepend_path("MODULEPATH", "/opt/modulefiles")
prepend_path("MODULEPATH", "/opt/spack-stack/spack-stack-1.9.2/envs/ufs-wm-env/install/modulefiles/Core")
prepend_path("MODULEPATH", "/opt/spack-stack/spack-stack-1.9.2/envs/ufs-wm-env/install/modulefiles/openmpi/4.1.6-tnrckm6/gcc/13.3.1")
stack_gcc_ver=os.getenv("stack_gcc_ver") or "13.3.1"
stack_openmpi_ver=os.getenv("stack_openmpi_ver") or "4.1.6"

load(pathJoin("stack-gcc", stack_gcc_ver))
load(pathJoin("stack-openmpi", stack_openmpi_ver))
cmake_ver=os.getenv("cmake_ver") or "3.27.9"

load(pathJoin("cmake", cmake_ver))

local ufs_utils_modules = {
  {["cmake"]           = "3.27.9" },
  {["bacio"]           = "2.4.1"  },
  {["g2"]              = "3.5.1"  },
  {["ip"]              = "5.1.0"  },
  {["sp"]              = "2.5.0"  },
  {["w3emc"]           = "2.10.0" },
  {["nemsio"]          = "2.5.4"  },
  {["sigio"]           = "2.3.3"  },
  {["libpng"]          = "1.6.37" },
  {["netcdf-c"]        = "4.9.2"  },
  {["netcdf-fortran"]  = "4.6.1"  },
  {["nccmp"]           = "1.9.0.1"},
  {["esmf"]            = "8.8.0"  },
  {["w3nco"]           = "2.4.1"  },
}

for i = 1, #ufs_utils_modules do
  for name, default_version in pairs(ufs_utils_modules[i]) do
    local env_version_name = string.gsub(name, "-", "_") .. "_ver"
    load(pathJoin(name, os.getenv(env_version_name) or default_version))
  end
end

setenv("CC", "mpicc")
setenv("CXX", "mpic++")
setenv("FC", "mpif90")

setenv("CMAKE_C_COMPILER","mpicc")
setenv("CMAKE_CXX_COMPILER","mpic++")
setenv("CMAKE_Fortran_COMPILER","mpif90")

whatis("Description: UFS_UTILS build environment")
