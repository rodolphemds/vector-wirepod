#!/usr/bin/env bash
set -euo pipefail

SOURCE_PATH="/data/chipper/source.sh"

cat >"${SOURCE_PATH}" <<EOF
#!/usr/bin/env bash
export DEBUG_LOGGING="${DEBUG_LOGGING}"
export STT_SERVICE="${STT_SERVICE}"
export STT_LANGUAGE="${STT_LANGUAGE}"
export USE_INBUILT_BLE="${USE_INBUILT_BLE}"
EOF