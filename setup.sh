#!/bin/bash

sudo add-apt-repository universe

sudo apt-get update
sudo apt-get upgrade -y

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
				python2 \
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
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cat >> ~/.vimrc << EOF
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
EOF

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

# Powerline
cat >> ~/.zshrc << EOF
if [ -f /usr/share/powerline/bindings/zsh/powerline.sh ]; then
  powerline-daemon -q
  POWERLINE_ZSH_CONTINUATION=1
  POWERLINE_ZSH_SELECT=1
  source /usr/share/powerline/bindings/zsh/powerline.sh
fi
EOF

# Tmux configuration
# Customize tmux
cat >> ~/.tmux.conf << EOF
set-option -g mouse off
set-option -g history-limit 5000
set-option -g status-bg colour231
source "/usr/share/powerline/bindings/tmux/powerline.conf"
EOF

# Python 2
curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py
sudo python2 get-pip.py

# Do some cleaning
sudo apt-get autoremove -y
