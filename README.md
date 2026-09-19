# Herdr Pane ID

Keep each Herdr pane label equal to its canonical public pane ID, for example
`w1:p1`.

This is a Bash-based Herdr plugin. It synchronizes all existing pane labels
when the server restores its session, then synchronizes panes created or moved
afterwards.

## Requirements

- Herdr `0.9.0` or newer
- Bash
- `jq`

## Install locally

```bash
herdr plugin link /home/mingzi47/Projects/herdr-pane-id
herdr plugin list
```

Run the initial synchronization immediately:

```bash
bash /home/mingzi47/Projects/herdr-pane-id/sync-all.sh
```

The startup hook performs the same synchronization after a server restore.

## Inspect logs

```bash
herdr plugin log list --plugin aqua2k1.herdr-pane-id
```

## Behavior

- `pane.created`: sets the new pane label to its current public ID.
- `pane.moved`: sets the moved pane label to its new public ID.
- Closing a pane does not renumber other public pane IDs, so no close hook is
  needed.
- Moving within a workspace does not change the public pane ID; moving across
  workspaces can change it.

This changes the pane label through the Herdr CLI. It does not modify Herdr's
native border renderer. A terminal title can still take precedence over the
manual pane label in the border UI.
