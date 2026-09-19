#!/usr/bin/env bash
set -euo pipefail

herdr_bin="${HERDR_BIN_PATH:-herdr}"

# herdr pane list JSON:
# {"id":"cli:pane:list","result":{"panes":[{"pane_id":"wK:p4"}],"type":"pane_list"}}
# Version-matched schema: herdr api schema --json
# https://raw.githubusercontent.com/herdrdev/herdr/master/docs/next/api/herdr-api.schema.json
"$herdr_bin" pane list \
  | jq -r '.result.panes[]?.pane_id // empty' \
  | while IFS= read -r pane_id; do
      [[ -n "$pane_id" ]] || continue
      "$herdr_bin" pane rename "$pane_id" "$pane_id" >/dev/null
done
