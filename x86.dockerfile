# Image with files for Linux and cross-compilation for x86 systems.
FROM i386/alpine

MAINTAINER Gacel

# Update repositories.
RUN apk update

# You can search the packages in:
# https://pkgs.alpinelinux.org/

# Add Bash and other tools.
RUN apk add --no-cache \
	bash \
	mc

# Install components for GO compilation.
RUN apk add --no-cache \
	git \
	go \
	# MinGW for windows builds
	mingw-w64-gcc