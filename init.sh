#!/bin/bash

# Install NVIM
# Docs: https://github.com/neovim/neovim/wiki/Installing-Neovim
install_nvim() {
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
  chmod u+x nvim.appimage
  ./nvim.appimage --appimage-extract
  sudo mv squashfs-root /
  sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
}

# Install NODE JS
# Docs: https://github.com/nodesource/distributions
install_node_js() {
  sudo apt-get update
  sudo apt-get install -y ca-certificates curl gnupg
  sudo mkdir -p /etc/apt/keyrings
  curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

  NODE_MAJOR=20
  echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

  sudo apt-get update
  sudo apt-get install nodejs -y
}

install_packer() {
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
}

# Install essential libraries
install_essentials() {
  sudo apt-get install git lsof wget jq zsh -y
  sudo apt-get install build-essential

  echo 'export SHELL=/bin/zsh
  exec /bin/zsh -l' > ~/.bash_profile

  sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
}

init_folders() {
  mkdir ~/downloads
  mkdir ~/documents
}


install_lazygit() {
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
  cd ~/downloads
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar xf lazygit.tar.gz lazygit
  sudo install lazygit /usr/local/bin
  echo "alias lg='lazygit'" >> ~/.zshrc
}

init_folders
install_essentials
install_lazygit
install_nvim
install_packer
