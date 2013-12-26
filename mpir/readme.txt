https://github.com/wbhart/mpir
original name of mpir.zip is mpir-3acc37364d11aef08ae30c3875a0696c6c209c5a.zip

cd build.vc12
prebuild nehalem x64
remove prebuild/postbuild config
change /MT with /MD. change /MTd with /MDd
property->C/C++->output file $(TargetDir)$TargetName)12.pdb ; release
                             $(TargetDir)$TargetName)12d.pdb ; debug
          librarian output file $(OutDir)$(TargetName)12$(TargetExt) ; release
                                $(OutDir)$(TargetName)12d$(TargetExt) ; debug
open mpir.sln and set x64/release and buld lib_mpir_nehalem with /MD /MDd
postbuild c:\prog\mpir\build.vc12\x64\release\mpir.lib
