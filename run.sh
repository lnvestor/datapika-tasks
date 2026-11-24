#!/usr/bin/env sh
# Usage: APIFY_TOKEN=... ./run.sh <actor-folder>/<task>.json [max charge in USD, default 1]
set -eu
file="$1"; cap="${2:-1}"
[ -f "$file" ] || { echo "no such task file: $file" >&2; exit 1; }
[ -n "${APIFY_TOKEN:-}" ] || { echo "set APIFY_TOKEN first (Apify Console > Settings > API & Integrations)" >&2; exit 1; }
actor=$(basename "$(dirname "$file")")
curl -sS -X POST "https://api.apify.com/v2/acts/openclawai~${actor}/run-sync-get-dataset-items?maxTotalChargeUsd=${cap}" \
  -H "Authorization: Bearer ${APIFY_TOKEN}" -H "Content-Type: application/json" --data @"$file"
