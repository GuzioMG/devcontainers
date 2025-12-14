#!/bin/sh
set -e

echo "Activating feature 'grinch'"

export PROJECT_NAME="grinch" SCRIPT_NAME="scripts/installer" INSTALL_PATH="/bin/grinch" GIT="https://github.com/Team-GhostLand/Grinch.git" && curl -fsSL https://raw.githubusercontent.com/Team-GhostLand/Spectre/master/universal-installer-scaffolding.sh | sudo -E bash