#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

"${SCRIPT_DIR}/generate-server-config.sh"
"${SCRIPT_DIR}/generate-bot-sdk-info.sh"
"${SCRIPT_DIR}/generate-session-cert.sh"
"${SCRIPT_DIR}/generate-api-config.sh"

#"${SCRIPT_DIR}/generate-jdocs.sh"
#"${SCRIPT_DIR}/generate-source.sh"