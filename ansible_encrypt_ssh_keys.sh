#!/bin/bash

SSH_DIR=".ssh"

echo "Enter Vault password: "
read -s vault_password

VAULT_PASS_FILE="$(mktemp)"
echo $vault_password > "$VAULT_PASS_FILE"
echo $vault_password

for file in "$SSH_DIR"/*; do
    if [[ -f $file && ($file == "$SSH_DIR"/id_rsa* && ! $file == *".pub") || $file == "$SSH_DIR"/id_ecdsa* || $file == "$SSH_DIR"/id_ed25519* || $file == "$SSH_DIR"/config ]]; then
        echo "Encrypting $file with Ansible Vault..."
        ansible-vault encrypt "$file" --vault-password-file "$VAULT_PASS_FILE"
        if [ $? -eq 0 ]; then
            echo "$file encrypted successfully."
        else
            echo "Failed to encrypt $file."
        fi
    fi
done

rm "$VAULT_PASS_FILE"

echo "Encryption process completed."

