#!/bin/bash

# Update and install required packages
echo "Updating system and installing dependencies..."
sudo apt update && sudo apt install -y curl git build-essential protobuf-compiler screen

# Ensure cargo (Rust) is installed
if ! command -v cargo &>/dev/null; then
    echo "Installing Rust and Cargo..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
fi

# Verify protoc installation
if ! command -v protoc &>/dev/null; then
    echo "Installing Protobuf Compiler (protoc)..."
    sudo apt install -y protobuf-compiler
fi

# Create a screen session and run the Nexus CLI installation
echo "Creating a screen session named 'nexus'..."
screen -dmS nexus bash -c "curl https://cli.nexus.xyz/ | sh; exec bash"

echo "Nexus installation started inside screen session 'nexus'."
echo "Use 'screen -r nexus' to reattach the session."
