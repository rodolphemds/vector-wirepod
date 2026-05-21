#!/usr/bin/env bash
set -euo pipefail

API_CONFIG_PATH="/data/chipper/apiConfig.json"

mkdir -p "$(dirname "${API_CONFIG_PATH}")"

cat >"${API_CONFIG_PATH}" <<EOF
{"weather":{"enable":${WEATHERAPI_ENABLED},"provider":"${WEATHERAPI_PROVIDER}","key":"${WEATHERAPI_KEY}","unit":"${WEATHERAPI_UNIT}"},"knowledge":{"enable":${KNOWLEDGE_ENABLED},"provider":"${KNOWLEDGE_PROVIDER}","key":"${KNOWLEDGE_KEY}","id":"${KNOWLEDGE_ID}","model":"${KNOWLEDGE_MODEL}","intentgraph":${KNOWLEDGE_INTENTGRAPH},"robotName":"${KNOWLEDGE_ROBOTNAME}","openai_prompt":"${KNOWLEDGE_OPENAI_PROMPT}","openai_voice":"${KNOWLEDGE_OPENAI_VOICE}","openai_voice_with_english":${KNOWLEDGE_OPENAI_VOICE_WITH_ENGLISH},"save_chat":${KNOWLEDGE_SAVE_CHAT},"commands_enable":${KNOWLEDGE_COMMANDS_ENABLE},"endpoint":"${KNOWLEDGE_ENDPOINT}","top_p":${KNOWLEDGE_TOP_P},"temp":${KNOWLEDGE_TEMP}},"STT":{"provider":"${STT_SERVICE}","language":"${STT_LANGUAGE}"},"server":{"epconfig":${SERVER_EPCONFIG},"port":"${SERVER_PORT}"},"hasreadfromenv":${HAS_READ_FROM_ENV},"pastinitialsetup":${PAST_INITIAL_SETUP}}
EOF
