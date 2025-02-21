#!/bin/bash

# Update and install required packages
echo "Updating system and installing dependencies..."
sudo apt update && sudo apt install -y curl git build-essential unzip screen

# Uninstall system-installed Rust (if any) and install Rust using rustup
echo "Removing system-installed Rust..."
sudo apt remove rustc -y
sudo apt autoremove -y

if ! command -v cargo &>/dev/null; then
    echo "Installing Rust and Cargo via rustup..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
fi

# Remove existing Protobuf installation
echo "Removing any existing Protobuf installation..."
sudo apt remove --purge -y protobuf-compiler
sudo apt autoremove -y

# Install Protobuf Compiler (protoc) manually
echo "Installing Protobuf Compiler (protoc) version 21.12..."
curl -LO https://github.com/protocolbuffers/protobuf/releases/download/v21.12/protoc-21.12-linux-x86_64.zip
unzip protoc-21.12-linux-x86_64.zip -d $HOME/.local
export PATH="$HOME/.local/bin:$PATH"
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# Verify installations
echo "Installed versions:"
cargo --version
protoc --version

# Create a screen session and run the Nexus CLI installation
echo "Creating a screen session named 'nexus'..."
screen -dmS nexus bash -c "curl -fsSL https://cli.nexus.xyz/ | sh; exec bash"

echo "Nexus installation started inside screen session 'nexus'."
echo "Use 'screen -r nexus' to reattach the session."
