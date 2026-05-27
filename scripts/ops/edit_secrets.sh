#!/bin/bash
# edit_secrets.sh
# Purpose: Decrypt, edit, and re-encrypt a secrets file in place.
# Usage: ./edit_secrets.sh <secrets-file.gpg>

set -e

KEY_NAME="classhub-distributed-secrets"
GPG_FILE=$1
TEMP_FILE=$(mktemp /tmp/secrets.XXXXXX.yaml)

if [[ -z "$GPG_FILE" ]]; then
    echo "Usage: $0 <secrets-file.gpg>"
    exit 1
fi

# 1. Decrypt
echo "Decrypting $GPG_FILE..."
gpg --decrypt --quiet --batch --output "$TEMP_FILE" "$GPG_FILE" || {
    echo "Decryption failed. Ensure the GPG key is available."
    rm -f "$TEMP_FILE"
    exit 1
}

# 2. Edit
${EDITOR:-nano} "$TEMP_FILE"

# 3. Re-encrypt
echo "Re-encrypting..."
gpg --encrypt --recipient "$KEY_NAME" --trust-model always --output "${GPG_FILE}.new" "$TEMP_FILE"
mv "${GPG_FILE}.new" "$GPG_FILE"

# 4. Cleanup
rm -f "$TEMP_FILE"
echo "Success: $GPG_FILE updated."
