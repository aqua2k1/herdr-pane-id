#!/usr/bin/env bash
set -euo pipefail

herdr_bin="${HERDR_BIN_PATH:-herdr}"
event_json="${HERDR_PLUGIN_EVENT_JSON:-}"

# HERDR_PLUGIN_EVENT_JSON:
# {"event":"pane_created","data":{"type":"pane_created","pane":{"pane_id":"wK:p4"}}}
# {"event":"pane_moved","data":{"type":"pane_moved","previous_pane_id":"wJ:p1","pane":{"pane_id":"wK:p4"}}}
# Version-matched schema: herdr api schema --json
# https://raw.githubusercontent.com/herdrdev/herdr/master/docs/next/api/herdr-api.schema.json
pane_id="$(jq -r '
  .data.pane.pane_id //
  .data.pane_id //
  .pane.pane_id //
  .pane_id // empty
' <<<"$event_json")"
[[ -n "$pane_id" ]] || exit 0

"$herdr_bin" pane rename "$pane_id" "$pane_id" >/dev/null 2>&1 || true
