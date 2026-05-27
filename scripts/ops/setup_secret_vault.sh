#!/bin/bash
# setup_secret_vault.sh
# Purpose: Initialize and manage GPG secrets for the distributed ClassHub stack.
# Usage: Run on the "control" node (e.g., Jetson-A or local dev machine).

set -e

KEY_NAME="classhub-distributed-secrets"
VAULT_DIR="./ops/secrets"
mkdir -p "$VAULT_DIR"

echo "--- ClassHub Secret Vault Setup ---"

# 1. Check/Generate GPG Key
if ! gpg --list-keys "$KEY_NAME" &> /dev/null; then
    echo "Generating new GPG key for secrets: $KEY_NAME"
    cat <<EOF > gpg-gen-key-batch
     %no-protection
     Key-Type: RSA
     Key-Length: 4096
     Subkey-Type: RSA
     Subkey-Length: 4096
     Name-Real: $KEY_NAME
     Expire-Date: 0
     %commit
EOF
    gpg --batch --generate-key gpg-gen-key-batch
    rm gpg-gen-key-batch
    echo "Key generated."
else
    echo "GPG key '$KEY_NAME' already exists."
fi

# 2. Encryption Helper
encrypt_secrets() {
    local source_file=$1
    local target_file="${source_file}.gpg"
    echo "Encrypting $source_file -> $target_file"
    gpg --encrypt --recipient "$KEY_NAME" --trust-model always --output "$target_file" "$source_file"
}

# 3. Instruction for Distribution
echo ""
echo "--- How to distribute to other nodes ---"
echo "To allow the LMS or ThunderCompute nodes to decrypt secrets, you must export and copy the SEED key."
echo "WARNING: Keep the secret key safe!"
echo ""
echo "Step A: Export the secret key on this machine:"
echo "  gpg --export-secret-keys --armor $KEY_NAME > vault-secret.key"
echo ""
echo "Step B: Copy to target node (e.g. ThunderCompute) via Tailscale:"
echo "  tailscale cp vault-secret.key thunder-node:"
echo ""
echo "Step C: Import on target node:"
echo "  gpg --import vault-secret.key"
echo ""

# 4. Usage Example
if [[ ! -f "$VAULT_DIR/secrets.yaml" ]]; then
    cat <<EOF > "$VAULT_DIR/secrets.yaml"
# Shared ClassHub Secrets
backend:
  ollama:
    api_key: "your-ollama-key-here"
security:
  internal_api_token: "$(openssl rand -hex 32)"
EOF
    echo "Created example secrets file at $VAULT_DIR/secrets.yaml"
    encrypt_secrets "$VAULT_DIR/secrets.yaml"
fi

echo ""
echo "Success: Secret vault system ready."
echo "Set HELPER_CONFIG_FILE='base.yaml,ops/secrets/secrets.yaml.gpg' in your environment."
