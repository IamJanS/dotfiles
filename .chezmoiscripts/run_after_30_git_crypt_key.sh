#!/bin/bash

# set -euo pipefail
# set -x

# Load logging functions
source "${XDG_DATA_HOME:-$HOME/.local/share}/chezmoi/.chezmoiscripts/lib/run_common.sh.tmpl"

# Decode the base64-encoded git-crypt key after chezmoi apply
KEY_FILE="$HOME/.config/git-crypt/git-crypt-key.b64"
DECODED_KEY_FILE="$HOME/.config/git-crypt/git-crypt-key"

if [ -f "$KEY_FILE" ]; then
    info_log "Base64-encoded git-crypt key file found: $KEY_FILE"
    base64 -d "$KEY_FILE" > "$DECODED_KEY_FILE"
    chmod 600 "$DECODED_KEY_FILE"
    info_log "Decoded git-crypt key and set appropriate permissions."
else
    fail_log "Base64-encoded git-crypt key file not found: $KEY_FILE"
fi