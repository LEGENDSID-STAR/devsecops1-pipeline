#!/bin/bash

# Define installation directory (e.g., ~/bin)
INSTALL_DIR="$HOME/bin"

# Create directory if it doesn't exist
mkdir -p "$INSTALL_DIR"

# Download kubeseal.exe
echo "Downloading kubeseal.exe to $INSTALL_DIR..."
curl -L https://github.com/bitnami-labs/sealed-secrets/releases/latest/download/kubeseal.exe -o "$INSTALL_DIR/kubeseal.exe"

# Make sure the directory is in PATH for Git Bash
if ! grep -q 'export PATH="$HOME/bin:$PATH"' ~/.bashrc; then
  echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
  echo "Added $INSTALL_DIR to PATH in ~/.bashrc"
fi

# Reload .bashrc so changes take effect immediately
source ~/.bashrc

# Confirm installation
echo "kubeseal installed to $INSTALL_DIR"
kubeseal.exe --version || echo "Run 'source ~/.bashrc' or restart Git Bash if kubeseal is not recognized yet."

