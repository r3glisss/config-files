#!/bin/bash

sudo apt-get update
sudo apt-get upgrade

# Essential packages
sudo apt install -y \
				autoconf \
				automake \
				autotools-dev \
				bc \
				binutils \
				bison \
				build-essential \
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
				libssl-dev \
				libtool \
				libpixman-1-dev \
				libusb-1.0-0-dev \
				linux-headers-$(uname -r) \
				linux-tools-common \
				linux-tools-generic \
				ltrace \
				ninja-build \
				nmap \
				openssl \
				patchutils \
			 	pkg-config \
				python \
				python3-dev \
				python3-pip \
				qemu \
			 	sed \
				texinfo \
				tmux \
				vbindiff \
				vim \
				xclip \
				zip \
				zlib1g-dev

# Desktop configuration
mkdir ~/local-opt
cp functions ~/local-opt/
cp aliases ~/local-opt/

# Vim configuration
cp .vimrc ~/.vimrc

# Zsh configuration
sudo apt-get install -y zsh powerline fonts-powerline
chsh -s /bin/zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
sed -i 's/robbyrussell/agnoster/g' ~/.zshrc
sed -i 's/source.*oh-my-zsh.sh/DISABLE_MAGIC_FUNCTIONS=true\n&/' ~/.zshrc

# Keyboard
cat >> ~/.zshrc << EOF
setxkbmap fr
EOF

# Custom aliases
cat >> ~/.zshrc << EOF
source ~/local-opt/aliases
EOF

# Custom functions
cat >> ~/.zshrc << EOF
source ~/local-opt/functions
EOF

# Tmux configuration
# Customize tmux
cat >> ~/.tmux.conf << EOF
set-option -g mouse off
set-option -g history-limit 5000
set-option -g status-bg colour231
EOF

# Do some cleaning
sudo apt-get autoremove -y
