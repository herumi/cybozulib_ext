@echo off
set PATH=..\tool;%PATH%
set VAR=1.0.1c
rem goto skip
tar xvfz openssl-%VAR%.tar.gz
pushd openssl-%VAR%

if /i "%PROCESSOR_ARCHITECTURE%" == "AMD64" (
	call perl Configure VC-WIN64A --prefix=../openssl
	call ms\do_win64a
) else (
	call perl Configure VC-WIN32 --prefix=../openssl
	call ms\do_nasm
)

nmake -f ms\ntdll.mak
nmake -f ms\ntdll.mak install
popd
rm -rf openssl.old
rename openssl openssl.old
rename openssl-%VAR% openssl
:skip
md lib
md dll
copy openssl\out32dll\ssleay32.lib lib
copy openssl\out32dll\libeay32.lib lib
copy openssl\out32dll\ssleay32.dll dll
copy openssl\out32dll\libeay32.dll dll
xcopy /S /D /E /I /Y openssl\inc32 include
