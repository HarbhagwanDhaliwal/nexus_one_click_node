#!/bin/bash

# Update and install required packages
echo "Updating system and installing dependencies..."
sudo apt update && sudo apt install -y curl git build-essential screen protobuf-compiler

# Uninstall system-installed Rust (if any) and install Rust using rustup
echo "Removing system-installed Rust..."
sudo apt remove rustc -y
sudo apt autoremove -y

if ! command -v cargo &>/dev/null; then
    echo "Installing Rust and Cargo via rustup..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
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
