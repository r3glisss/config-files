#!/bin/bash

set -euxo pipefail

# Update and upgrade
sudo apt-get update
sudo apt-get upgrade -y

# Essential packages
sudo apt install -y \
				autoconf \
				autogen \
				automake \
				autotools-dev \
				binutils \
				binutils-dev \
				bison \
				build-essential \
				clang \
				cloc \
				cmake \
				cmake-curses-gui \
				curl \
				default-jdk \
				device-tree-compiler \
				flex \
				gawk \
				gcc \
				gcc-multilib \
				gdb \
				gdb-multiarch \
				git \
				gperf \
				gzip \
			 	libexpat-dev \
				libfdt-dev \
				libglib2.0-dev \
				libgmp-dev \
				libmpc-dev \
				libmpfr-dev \
				libncurses5 \
				libssl-dev \
				libtool \
				libpixman-1-dev \
				libusb-1.0-0-dev \
				linux-tools-common \
				linux-tools-generic \
				llvm \
				llvm-dev \
				ltrace \
				neovim \
				ncurses-dev \
				ninja-build \
				nmap \
				openssl \
				patchutils \
			 	pkg-config \
				sed \
				snapd \
        			software-properties-common \
				texinfo \
				tcl \
				tmux \
				vbindiff \
				vim \
				wget \
				xclip \
				zip \
				zsh

# Do some cleaning
sudo apt-get autoremove -y
