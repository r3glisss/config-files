#!/bin/bash

set -euxo pipefail

# Scala dependencies
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | sudo apt-key add

sudo add-apt-repository ppa:deadsnakes/ppa

# Update and upgrade
sudo apt-get update
sudo apt-get upgrade -y

# Essential packages
sudo apt install -y \
				autoconf \
				autogen \
				automake \
				autotools-dev \
				bc \
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
				linux-headers-$(uname -r) \
				linux-tools-common \
				linux-tools-generic \
				llvm \
				llvm-dev \
				ltrace \
				ncurses-dev \
				ninja-build \
				nmap \
				openssl \
				patchutils \
			 	pkg-config \
				python3\.10 \
				python3-dev \
				python3-pip \
				qemu \
			 	sbt \
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
				zlib1g-dev

# Snapd install
sudo snap install code --classic

# Vim configuration
cp .vimrc ~/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Zsh configuration
sudo apt-get install -y zsh 
chsh -s /bin/zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
sed -i 's/robbyrussell/agnoster/g' ~/.zshrc
sed -i 's/source.*oh-my-zsh.sh/DISABLE_MAGIC_FUNCTIONS=true\n&/' ~/.zshrc

# Keyboard

# Tmux configuration
# Customize tmux
cat >> ~/.tmux.conf << EOF
set-option -g mouse on
set-option -g history-limit 5000
set-option -g status-bg colour231
EOF

# STM Tools
wget https://github.com/stlink-org/stlink/releases/download/v1.6.1/stlink-1.6.1-1_amd64.deb
sudo apt install ./stlink-1.6.1-1_amd64.deb

# Do some cleaning
sudo apt-get autoremove -y
