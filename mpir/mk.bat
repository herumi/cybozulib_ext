@echo off
echo copy vsyasm.exe into C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\bin
set MPIR_VER=2.6.0
bzip2 -dc mpir-%MPIR_VER%.tar.bz2|tar xvf -
cd mpir-%MPIR_VER%\build.vc10
echo cd build.vc12
echo prebuild nehalem x64
echo remove prebuild/postbuild config
echo change /MT with /MD. change /MTd with /MDd
echo set x64/release and buld lib_mpir_nehalem with /MD /MDd
echo postbuild c:\prog\mpir\build.vc12\x64\release\mpir.lib
mpir.sln
cd ..
md ..\include
md ..\lib
copy lib\x64\Release\mpir.lib ..\lib
copy lib\x64\Release\mpir.pdb ..\lib
copy lib\x64\Release\*.h ..\include
