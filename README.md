# Herdr Pane ID

Synchronize each Herdr pane label with its public ID, such as `w1:p1`.
The Bash plugin syncs existing panes on startup and new or moved panes afterward.

## Requirements

- Herdr `0.9.0+`
- Bash
- `jq`

## Install locally

```bash
herdr plugin link /home/mingzi47/Projects/herdr-pane-id
herdr plugin list
```

Run the initial sync immediately:

```bash
bash /home/mingzi47/Projects/herdr-pane-id/sync-all.sh
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
