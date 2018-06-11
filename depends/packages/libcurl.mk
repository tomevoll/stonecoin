package=libcurl
$(package)_version=7.47.0
$(package)_download_path=https://curl.haxx.se/download/
$(package)_file_name=curl-$($(package)_version).tar.gz
$(package)_sha256_hash=df01bd42af361978d9de7de8529718bcafe01897a544a7650139a1954c55bdfe



define $(package)_set_vars
$(package)_config_opts_release=variant=release
$(package)_config_opts_debug=variant=debug
$(package)_config_opts=--disable-manual --disable-ntlm-wb --enable-hidden-symbols --with-random=/dev/urandom --disable-curldebug --disable-shared --enable-static --without-zlib --without-libidn 
$(package)_config_opts+=--enable-threaded-resolver --enable-verbose
$(package)_config_opts_linux=threadapi=pthread runtime-link=shared --with-ssl
$(package)_config_opts_darwin=--toolset=darwin-4.2.1 runtime-link=shared --with-darwinssl    
$(package)_config_opts_mingw32=--with-winssl --host=x86_32-w32-mingw32 --target=x86_32-w32-mingw32 CPPFLAGS="-DCURL_STATICLIB -DWIN32"
$(package)_config_opts_x86_64_mingw32=--with-winssl --host=x86_64-w64-mingw32 --target=x86_64-w64-mingw32  CPPFLAGS="-DCURL_STATICLIB -DWIN32"
$(package)_config_opts_i686_mingw32=--with-winssl --host=i686_mingw32 --target=i686_mingw32  CPPFLAGS="-DCURL_STATICLIB -DWIN32"
$(package)_config_opts_i686_linux=architecture=x86 --with-winssl --host=i686_linux --target=i686_linux
$(package)_toolset_$(host_os)=gcc
$(package)_archiver_$(host_os)=$($(package)_ar)
$(package)_toolset_darwin=darwin
$(package)_archiver_darwin=$($(package)_libtool)
$(package)_config_libraries=ssl
$(package)_cxxflags=-std=c++11 -fvisibility=hidden
$(package)_cxxflags_linux=-fPIC
endef
# $($(host_arch)_$(host_os))
define $(package)_config_cmds
./configure $($(package)_config_opts) --prefix=$($(package)_staging_prefix_dir) --build=$($(host_arch)_$(host_os))
endef

define $(package)_build_cmds
make
endef

define $(package)_stage_cmds
make install
endef
