https://github.com/wbhart/mpir
original name of mpir.zip is mpir-3acc37364d11aef08ae30c3875a0696c6c209c5a.zip

cd build.vc12
prebuild nehalem x64
open mpir.sln and select x64/release
select lib_mpir_nehalem, lib_mpir_cxx
change /MT with /MD and build

select x64/Debug
[generic] -> [target name] mpirxx -> mpirxxd for Debug
                           mpir   -> mpird   for Debug
change /MTd with /MDd and build
postbuild c:\prog\mpir\build.vc12\x64\release\mpir.lib
