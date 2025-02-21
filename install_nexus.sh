#!/bin/bash

# Update system and remove any existing installations
sudo apt update && sudo apt remove -y rustc protobuf-compiler && sudo apt autoremove -y

# Install Rust using rustup
if ! command -v cargo &>/dev/null; then
    echo "Installing Rust and Cargo..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
fi

# Install Protobuf 21.12
PROTOC_ZIP="protoc-21.12-linux-x86_64.zip"
curl -LO https://github.com/protocolbuffers/protobuf/releases/download/v21.12/$PROTOC_ZIP
unzip -o $PROTOC_ZIP -d $HOME/.local
rm -f $PROTOC_ZIP
export PATH="$HOME/.local/bin:$PATH"

# Ensure PATH is persistent
if ! grep -q "$HOME/.local/bin" ~/.bashrc; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
fi
source ~/.bashrc

# Create a screen session and run the Nexus CLI installation
echo "Creating a screen session named 'nexus'..."
screen -S nexus bash -c "curl https://cli.nexus.xyz/ | sh; exec bash"

echo "Nexus installation started inside screen session 'nexus'."
echo "Use 'screen -r nexus' to reattach the session."
