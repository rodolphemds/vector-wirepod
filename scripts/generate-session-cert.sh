#!/usr/bin/env bash
set -euo pipefail

CERT_DIR="/data/chipper/session-certs"

SERIAL="${ANKI_ROBOT_SERIAL:?ANKI_ROBOT_SERIAL is required}"
CERT_SOURCE="${ANKI_ROBOT_CERT:?ANKI_ROBOT_CERT is required}"


mkdir -p "${CERT_DIR}"

if [ ! -f "${CERT_SOURCE}" ]; then
    CERT_SOURCE="/vector-w2b1/$(basename "${CERT_SOURCE}")"
fi

if [ ! -f "${CERT_SOURCE}" ]; then
    echo "Error: cannot find certificate source file '${CERT_SOURCE}'" >&2
    exit 1
fi

cp -a "${CERT_SOURCE}" "${CERT_DIR}/${SERIAL}"