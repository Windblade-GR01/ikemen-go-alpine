# This image contains the files needed for Linux compilation only.
# (In other words, no cross-compilation)
FROM amd64/alpine

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
	go