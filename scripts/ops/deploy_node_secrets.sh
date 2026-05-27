#!/bin/bash
# deploy_node_secrets.sh
# Purpose: Securely deploy secrets and GPG keys to a remote Tailnet node.
# Usage: ./deploy_node_secrets.sh <node-name-or-ip> <vault-dir>

set -e

TARGET_NODE=$1
VAULT_DIR=${2:-"./ops/secrets"}

if [[ -z "$TARGET_NODE" ]]; then
    echo "Usage: $0 <node-name-or-ip> [vault-dir]"
    exit 1
fi

echo "--- Deploying Secrets to $TARGET_NODE ---"

# 1. Verify files exist
if [[ ! -f "$VAULT_DIR/secrets.yaml.gpg" ]]; then
    echo "Error: $VAULT_DIR/secrets.yaml.gpg not found."
    exit 1
fi

if [[ ! -f "vault-secret.key" ]]; then
    echo "Error: vault-secret.key not found. Run setup_secret_vault.sh first."
    exit 1
fi

# 2. Push Key and Secrets via Tailscale
echo "Copying GPG key and encrypted secrets..."
tailscale cp vault-secret.key "${TARGET_NODE}:"
tailscale cp "$VAULT_DIR/secrets.yaml.gpg" "${TARGET_NODE}:"

# 3. Generate Service Snippet
echo ""
echo "--- Remote Setup Instructions for $TARGET_NODE ---"
echo "Run these commands ON the remote node:"
echo ""
echo "  # Import the key"
echo "  gpg --import vault-secret.key"
echo ""
echo "  # Move secrets to a stable location"
echo "  sudo mkdir -p /etc/classhub/secrets"
echo "  sudo mv secrets.yaml.gpg /etc/classhub/secrets/"
echo ""
echo "  # Update your environment (e.g. /etc/default/homework-helper)"
echo "  echo \"HELPER_CONFIG_FILE=/etc/classhub/config/base.yaml,/etc/classhub/secrets/secrets.yaml.gpg\" | sudo tee -a /etc/default/homework-helper"
echo ""
echo "Deployment successful."
