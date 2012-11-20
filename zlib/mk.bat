rem @echo off
set PATH=..\tool;%PATH%
set VAR=1.2.5
bzip2 -dc zlib-%VAR%.tar.bz2 | tar xvf -

pushd zlib-%VAR%

if /i "%PROCESSOR_ARCHITECTURE%" == "AMD64" (
	pushd contrib\masmx64
	call bld_ml64
	popd
	nmake -f win32/Makefile.msc AS=ml64 LOC="-DASMV -DASMINF -I./" OBJA="inffasx64.obj gvmat64.obj inffas8664.obj"
) else (
	nmake -f win32/Makefile.msc LOC="-DASMV -DASMINF" OBJA="inffas32.obj match686.obj"
)

popd
md include
md lib
rem md dll
pushd zlib-%VAR%
copy zlib.h ..\include
copy zconf.h ..\include
copy zlib.lib ..\lib
rem copy zdll.lib ..\lib
rem copy zlib1.dll ..\dll
popd
