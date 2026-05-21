#!/usr/bin/env bash
set -euo pipefail

SERVER_CONFIG_DIR="/data/certs"
SERVER_CONFIG_PATH="${SERVER_CONFIG_DIR}/server_config.json"

SERVER_CONFIG_BASE="${WIREPOD_SERVER_CONFIG_HOST}:${WIREPOD_SERVER_CONFIG_PORT}"

mkdir -p "${SERVER_CONFIG_DIR}"

cat >"${SERVER_CONFIG_PATH}" <<EOF
{
	"jdocs": "${SERVER_CONFIG_BASE}",
	"tms": "${SERVER_CONFIG_BASE}",
	"chipper": "${SERVER_CONFIG_BASE}",
	"check": "${WIREPOD_SERVER_CONFIG_HOST}/ok",
	"logfiles": "s3://anki-device-logs-prod/victor",
	"appkey": "oDoa0quieSeir6goowai7f"
}
EOF
