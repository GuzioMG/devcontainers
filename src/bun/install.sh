#!/bin/bash
set -eo pipefail

echo "Activating feature 'bun'"

curl -fsSL https://bun.sh/install | bash