#!/bin/bash

# Update and install required packages
echo "Updating system and installing dependencies..."
sudo apt update && sudo apt install -y curl git build-essential unzip screen

# Ensure cargo (Rust) is installed
if ! command -v cargo &>/dev/null; then
    echo "Installing Rust and Cargo..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
fi

# Install latest Protobuf Compiler (protoc)
PROTOC_VERSION=24.3
if ! command -v protoc &>/dev/null; then
    echo "Installing Protobuf Compiler (protoc) v$PROTOC_VERSION..."
    curl -OL https://github.com/protocolbuffers/protobuf/releases/download/v$PROTOC_VERSION/protoc-$PROTOC_VERSION-linux-x86_64.zip
    unzip -o protoc-$PROTOC_VERSION-linux-x86_64.zip -d $HOME/.local
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
    source ~/.bashrc
fi

# Verify installations
echo "Installed versions:"
cargo --version
protoc --version

# Create a screen session and run the Nexus CLI installation
echo "Creating a screen session named 'nexus'..."
screen -dmS nexus bash -c "curl -fsSL https://cli.nexus.xyz/ | sh; exec bash"

echo "Nexus installation started inside screen session 'nexus'."
echo "Use 'screen -r nexus' to reattach the session."
