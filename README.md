# Herdr Pane ID

Synchronize each Herdr pane label with its public ID, such as `w1:p1`.
The Bash plugin syncs existing panes on startup and new or moved panes afterward.

## Requirements

- Herdr `0.9.0+`
- Bash
- `jq`

## Install locally

Install the plugin:

```bash
herdr plugin install aqua2k1/herdr-pane-id
```

Sync existing panes:

```bash
herdr plugin action invoke sync-all --plugin aqua2k1.herdr-pane-id
```

Check plugin status:

```bash
herdr plugin list
```

The startup hook repeats this after session restore.
## Inspect logs

```bash
herdr plugin log list --plugin aqua2k1.herdr-pane-id
```

## Behavior

- `pane.created`: labels the pane with its public ID.
- `pane.moved`: updates the label to the new public ID.

The plugin sets labels through the Herdr CLI; it does not modify native border rendering. Terminal titles may take precedence over pane labels.
