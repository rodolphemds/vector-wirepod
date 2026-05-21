#!/usr/bin/env bash
set -euo pipefail

BOTSDK_INFO_PATH="/data/chipper/jdocs/botSdkInfo.json"

SERIAL="${ANKI_ROBOT_SERIAL:?ANKI_ROBOT_SERIAL is required}"
ROBOT_HOST="${ANKI_ROBOT_HOST:?ANKI_ROBOT_HOST is required}"
ROBOT_GUID="${ANKI_ROBOT_GUID:?ANKI_ROBOT_GUID is required}"


mkdir -p "$(dirname "${BOTSDK_INFO_PATH}")"

cat >"${BOTSDK_INFO_PATH}" <<EOF
{
  "global_guid": "tni1TRsTRTaNSapjo0Y+Sw==",
  "robots": [
    {
      "esn": "${SERIAL}",
      "ip_address": "${ROBOT_HOST}",
      "guid": "${ROBOT_GUID}",
      "activated": true
    }
  ]
}
EOF