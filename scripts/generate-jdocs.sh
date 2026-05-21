#!/usr/bin/env bash
set -euo pipefail

JDOCS_PATH="/data/chipper/jdocs/jdocs.json"

SERIAL="${ANKI_ROBOT_SERIAL:?ANKI_ROBOT_SERIAL is required}"
ROBOT_NAME="${VECTOR_ROBOT_NAME:?VECTOR_ROBOT_NAME is required}"

CLIENT_METADATA="${CLIENT_METADATA:-wirepod-new-token}"
CLIENT_TOKENS='${CLIENT_TOKENS:-[{"hash":"ThfdHEReYecd33wU2J9so0McGOV8oo96rPesRL+pT1xPL7GTnuw3auvEcHRoWcRv","client_name":"wirepod","app_id":"SDK","issued_at":"2026-02-21T17:48:37.804037615Z"}]}'

# other values are loaded from .env defaults

mkdir -p "$(dirname "${JDOCS_PATH}")"

cat >"${JDOCS_PATH}" <<EOF
[
  {
    "thing": "vic:${SERIAL}",
    "name": "vic.AppTokens",
    "jdoc": {
      "doc_version": 1,
      "fmt_version": 1,
      "client_metadata": "${CLIENT_METADATA}",
      "json_doc": "{\"client_tokens\":${CLIENT_TOKENS}}"
    }
  },
  {
    "thing": "vic:${SERIAL}",
    "name": "vic.RobotSettings",
    "jdoc": {
      "fmt_version": 2,
      "json_doc": "{\n   \"button_wakeword\" : ${BUTTON_WAKEWORD},\n   \"clock_24_hour\" : ${CLOCK_24_HOUR},\n   \"custom_eye_color\" : {\n      \"enabled\" : ${CUSTOM_EYE_COLOR_ENABLED},\n      \"hue\" : ${CUSTOM_EYE_COLOR_HUE},\n      \"saturation\" : ${CUSTOM_EYE_COLOR_SATURATION}\n   },\n   \"default_location\" : \"${DEFAULT_LOCATION}\",\n   \"dist_is_metric\" : ${DIST_IS_METRIC},\n   \"eye_color\" : ${EYE_COLOR},\n   \"locale\" : \"${LOCALE}\",\n   \"master_volume\" : ${MASTER_VOLUME},\n   \"temp_is_fahrenheit\" : ${TEMP_IS_FAHRENHEIT},\n   \"time_zone\" : \"${TIME_ZONE}\"\n}\n"
    }
  },
  {
    "thing": "vic:${SERIAL}",
    "name": "vic.RobotLifetimeStats",
    "jdoc": {
      "fmt_version": 1,
      "json_doc": "{\n   \"Alive.seconds\" : ${ALIVE_SECONDS},\n   \"BStat.AnimationPlayed\" : ${BSTAT_ANIMATION_PLAYED},\n   \"BStat.BehaviorActivated\" : ${BSTAT_BEHAVIOR_ACTIVATED},\n   \"BStat.MountedCharger\" : ${BSTAT_MOUNTED_CHARGER},\n   \"BStat.PettingBlissIncrease\" : ${BSTAT_PETTING_BLISS_INCREASE},\n   \"BStat.PettingReachedMaxBliss\" : ${BSTAT_PETTING_REACHED_MAX_BLISS},\n   \"BStat.ReactedToCliff\" : ${BSTAT_REACTED_TO_CLIFF},\n   \"BStat.ReactedToEyeContact\" : ${BSTAT_REACTED_TO_EYE_CONTACT},\n   \"BStat.ReactedToMotion\" : ${BSTAT_REACTED_TO_MOTION},\n   \"BStat.ReactedToSound\" : ${BSTAT_REACTED_TO_SOUND},\n   \"BStat.ReactedToTriggerWord\" : ${BSTAT_REACTED_TO_TRIGGER_WORD},\n   \"Feature.AI.DanceToTheBeat\" : ${FEATURE_AI_DANCE_TO_THE_BEAT},\n   \"Feature.AI.Exploring\" : ${FEATURE_AI_EXPLORING},\n   \"Feature.AI.EyeColor\" : ${FEATURE_AI_EYE_COLOR},\n   \"Feature.AI.FindCube\" : ${FEATURE_AI_FIND_CUBE},\n   \"Feature.AI.GoHome\" : ${FEATURE_AI_GO_HOME},\n   \"Feature.AI.HeldInPalm\" : ${FEATURE_AI_HELD_IN_PALM},\n   \"Feature.AI.InTheAir\" : ${FEATURE_AI_IN_THE_AIR},\n   \"Feature.AI.ListeningForBeats\" : ${FEATURE_AI_LISTENING_FOR_BEATS},\n   \"Feature.AI.MeetVictor\" : ${FEATURE_AI_MEET_VICTOR},\n   \"Feature.AI.Observing\" : ${FEATURE_AI_OBSERVING},\n   \"Feature.AI.ObservingOnCharger\" : ${FEATURE_AI_OBSERVING_ON_CHARGER},\n   \"Feature.AI.Onboarding\" : ${FEATURE_AI_ONBOARDING},\n   \"Feature.AI.Petting\" : ${FEATURE_AI_PETTING},\n   \"Feature.AI.ReactToCliff\" : ${FEATURE_AI_REACT_TO_CLIFF},\n   \"Feature.AI.ReactToHand\" : ${FEATURE_AI_REACT_TO_HAND},\n   \"Feature.AI.RollBlock\" : ${FEATURE_AI_ROLL_BLOCK},\n   \"Feature.AI.SDK\" : ${FEATURE_AI_SDK},\n   \"Feature.AI.Sleeping\" : ${FEATURE_AI_SLEEPING},\n   \"Feature.AI.VolumeAdjustment\" : ${FEATURE_AI_VOLUME_ADJUSTMENT},\n   \"Feature.App.FindHome\" : ${FEATURE_APP_FIND_HOME},\n   \"Feature.App.Sleeping\" : ${FEATURE_APP_SLEEPING},\n   \"Feature.Voice.KnowledgeGraph\" : ${FEATURE_VOICE_KNOWLEDGE_GRAPH},\n   \"FeatureType.Autonomous\" : ${FEATURE_TYPE_AUTONOMOUS},\n   \"FeatureType.Sleep\" : ${FEATURE_TYPE_SLEEP},\n   \"FeatureType.Utility\" : ${FEATURE_TYPE_UTILITY},\n   \"Odom.Body\" : ${ODOM_BODY},\n   \"Odom.LWheel\" : ${ODOM_LWHEEL},\n   \"Odom.RWheel\" : ${ODOM_RWHEEL},\n   \"Pet.ms\" : ${PET_MS},\n   \"Stim.CumlPosDelta\" : ${STIM_CUML_POS_DELTA},\n   \"Stim.StimSeconds\" : ${STIM_STIM_SECONDS}\n}\n"
    }
  },
  {
    "thing": "vic:${SERIAL}",
    "name": "vic.AccountSettings",
    "jdoc": {
      "fmt_version": 1,
      "json_doc": "{\n   \"APP_LOCALE\" : \"${APP_LOCALE}\",\n   \"DATA_COLLECTION\" : ${DATA_COLLECTION}\n}\n"
    }
  },
  {
    "thing": "vic:${SERIAL}",
    "name": "vic.UserEntitlements",
    "jdoc": {
      "fmt_version": 1,
      "json_doc": "{\n   \"KICKSTARTER_EYES\" : ${KICKSTARTER_EYES}\n}\n"
    }
  }
]
EOF