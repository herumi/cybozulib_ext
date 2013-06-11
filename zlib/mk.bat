rem @echo off
set PATH=..\tool;%PATH%
set VAR=1.2.8
tar xvf zlib-%VAR%.tar.gz

md include
md lib

pushd zlib-%VAR%

if /i "%PROCESSOR_ARCHITECTURE%" == "AMD64" (
	pushd contrib\masmx64
	call bld_ml64
	popd
	nmake -f ..\Makefile.msc MTMD=/MD AS=ml64 LOC="-DASMV -DASMINF -I./" OBJA="inffasx64.obj gvmat64.obj inffas8664.obj"
	copy zlib_md.lib ..\lib
	nmake -f ..\Makefile.msc clean
	nmake -f ..\Makefile.msc MTMD=/MT AS=ml64 LOC="-DASMV -DASMINF -I./" OBJA="inffasx64.obj gvmat64.obj inffas8664.obj"
	copy zlib_mt.lib ..\lib
) else (
	nmake -f ..\Makefile.msc MTMD=/MD LOC="-DASMV -DASMINF" OBJA="inffas32.obj match686.obj"
	copy zlib_md.lib ..\lib
	nmake -f ..\Makefile.msc clean
	nmake -f ..\Makefile.msc MTMD=/MT LOC="-DASMV -DASMINF" OBJA="inffas32.obj match686.obj"
	copy zlib_mt.lib ..\lib
)

popd
pushd zlib-%VAR%
copy zlib.h ..\include
copy zconf.h ..\include
popd
