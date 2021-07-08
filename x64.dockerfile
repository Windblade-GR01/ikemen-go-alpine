# Image with files for Linux and cross-compilation for x64 systems.
FROM amd64/alpine

MAINTAINER Gacel

# Update repositories.
RUN apk update

# You can search the packages in:
# https://pkgs.alpinelinux.org/

# Add Bash and other tools.
RUN apk add --no-cache \
	bash \
	make \
	mc

# Install components for GO compilation.
RUN apk add --no-cache \
	git \
	go \
# MinGW for windows builds
	mingw-w64-gcc \
# OSXCross dependecies (Yes, there are a lot of them)
	clang-dev \
	cmake \
	libxml2-dev \
	openssl-dev \
	patch \
	python3 \
	g++ \
	gmp-dev \
	mpfr-dev \
	mpc1-dev \
	fts-dev \
	bsd-compat-headers \
	xz

# Based on https://wapl.es/rust/2019/02/17/rust-cross-compile-linux-to-macos.html
# Compile OsxCross
RUN git clone https://github.com/tpoechtrager/osxcross \
	&& cd osxcross \
	&& wget -nc https://s3.dockerproject.org/darwin/v2/MacOSX10.11.sdk.tar.xz \
	&& mv MacOSX10.11.sdk.tar.xz tarballs \
	&& UNATTENDED=yes ./build.sh

# Add OsxCross to path
ENV PATH=$PATH:/osxcross/target/bin