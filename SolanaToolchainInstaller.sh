#!/bin/bash

# Known working on a vanilla Ubuntu 20.04 install
# as of November 12 2021.

# Usage:
# $ sudo chmod +x ./SolanaToolchainInstaller.sh
# $ ./SolanaToolchainInstaller.sh

TIMESRUN=0

if [[ $TIMESRUN -lt 1 ]]
then
  echo "========================================"
  echo "Installing Curl"
  echo "========================================"

  sudo apt install -y curl

  echo "========================================"
  echo "Installing NVM & Node 16"
  echo "========================================"

  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

  export NVM_DIR="$HOME/.nvm" && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

  nvm install 16

  echo "========================================"
  echo "Installing Rust"
  echo ""
  echo "For installation options, select \`1\` and hit \`ENTER\`"
  echo "========================================"

  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

  source $HOME/.cargo/env

  rustup component add rustfmt

  echo "========================================"
  echo "Installing Solana Tool Suite"
  echo "========================================"

  sh -c "$(curl -sSfL https://release.solana.com/v1.8.0/install)"

  USERNAME=$(whoami)

  echo "export PATH=\"/home/$USERNAME/.local/share/solana/install/active_release/bin:\$PATH\"" >> ~/.bashrc

  echo "========================================"
  echo "Installing Mocha, Yarn, and TS-Node"
  echo "========================================"

  npm install -g mocha

  npm install -g yarn

  npm install -g ts-node

  echo "========================================"
  echo "Installing Pre-Reqs & Anchor"
  echo "========================================"

  sudo apt-get update && sudo apt-get -y upgrade

  sudo apt-get install -y pkg-config build-essential libudev-dev libssl-dev

  cargo install --git https://github.com/project-serum/anchor --tag v0.18.0 anchor-cli --locked

  echo "========================================"
  echo "Installing Metaplex"
  echo "========================================"

  cd ~

  git clone --branch v1.0.0 https://github.com/metaplex-foundation/metaplex.git ~/metaplex-foundation/metaplex

  yarn install --cwd ~/metaplex-foundation/metaplex/js/

  echo "========================================"
  echo "Installing VS Code"
  echo "========================================"

  wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg

  sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/

  sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'

  rm -f packages.microsoft.gpg

  sudo apt install -y apt-transport-https

  sudo apt update

  sudo apt install -y code

  echo "========================================"
  echo "Everything should now be installed, but some items require a restart."
  echo "Restart your terminal and run this script again to run a verifier."
  echo "========================================"

  sed -i '10s/.*/TIMESRUN=1/' ./SolanaToolchainInstaller.sh

  exit 0
else
  echo "========================================"
  echo "Ensuring everything is installed."
  echo "========================================"

  printf "\n- Curl: \n"
  curl --version | grep curl

  printf "\n- NVM: \n"
  nvm --version

  printf "\n- Node: \n"
  node --version

  printf "\n- NPM: \n"
  npm --version

  printf "\n- Rust: \n"
  rustc --version

  printf "\n- Solana: \n"
  solana --version

  printf "\n- Mocha: \n"
  mocha --version

  printf "\n- Yarn: \n"
  yarn --version

  printf "\n- TS-Node: \n"
  ts-node --version

  printf "\n- Anchor: \n"
  anchor --version

  printf "\n- Metaplex: \n"
  ts-node ~/metaplex-foundation/metaplex/js/packages/cli/src/candy-machine-cli.ts --version

  printf "\n- VS Code: \n"
  code --version

  echo "========================================"
  echo "All set. Enjoy developing on Solana!"
  echo "========================================"
  
  sed -i '10s/.*/TIMESRUN=0/' ./SolanaToolchainInstaller.sh

  exit 0
fi
1
