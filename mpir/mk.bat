@echo off
echo copy vsyasm.exe into C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\bin
set MPIR_VER=2.6.0
bzip2 -dc mpir-%MPIR_VER%.tar.bz2|tar xvf -
cd mpir-%MPIR_VER%\build.vc10
echo set x64/release and buld lib_mpir_nehalem
mpir.sln
cd ..
md ..\include
md ..\lib
copy lib\x64\Release\mpir.lib ..\lib
copy lib\x64\Release\mpir.pdb ..\lib
copy lib\x64\Release\*.h ..\include
