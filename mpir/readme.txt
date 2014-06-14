https://github.com/wbhart/mpir
original name of mpir.zip is mpir-3acc37364d11aef08ae30c3875a0696c6c209c5a.zip

cd build.vc12
prebuild nehalem x64
; for vc14
open mpir-2.6.0\config.h
//#define snprintf _snprintf

open mpir.sln and select x64/release
comment out l.438
remove pre-build event

select lib_mpir_nehalem, lib_mpir_cxx
[build-event] -> [pre-build event] ; remove
[code generation] -> [runtime library]
change /MT with /MD and build

select x64/Debug
[general] -> [target name] mpirxx -> mpirxxd for Debug
                           mpir   -> mpird   for Debug
change /MTd with /MDd and build
postbuild c:\prog\mpir\build.vc12\x64\release\mpir.lib
-----------------------------------------------------------------------------
mpn/generic/zero.c
fix mpn_zero as the follogin code for a bug of vc14 ctp

mpn_zero (mp_ptr rp, mp_size_t n)
{
	mp_size_t i;
	for (i = 0; i < n; i++) {
		rp[i] = 0;
	}
}
-----------------------------------------------------------------------------
