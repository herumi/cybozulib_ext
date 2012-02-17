@echo off
set PATH=..\tool;%PATH%
set VAR=1.0.0g
tar xvfz openssl-%VAR%.tar.gz
pushd openssl-%VAR%

if /i "%PROCESSOR_ARCHITECTURE%" == "AMD64" (
	call perl Configure VC-WIN64A --prefix=../openssl
	call ms\do_win64a
	set OUTPATH=out64dll
	set INCPATH=inc64
	echo "please remove "bufferoverflowu.lib" in ms\nttdll.mak
	pause
) else (
	call perl Configure VC-WIN32 --prefix=../openssl
	call ms\do_nasm
	set OUTPATH=out32dll
	set INCPATH=inc32
)

nmake -f ms\ntdll.mak
nmake -f ms\ntdll.mak install
popd
:skip
rename openssl openssl.old
rename openssl-%VAR% openssl
copy openssl\%OUTPATH%\ssleay32.lib ..\..\cybozulib\lib
copy openssl\%OUTPATH%\libeay32.lib ..\..\cybozulib\lib
copy openssl\%OUTPATH%\ssleay32.dll ..\..\cybozulib\bin
copy openssl\%OUTPATH%\libeay32.dll ..\..\cybozulib\bin
xcopy /S /D /E /I /Y openssl\%INCPATH% include
