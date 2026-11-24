#!/bin/bash
# Toggle an application as a tiled "sidepad" on the left edge of the screen (Hyprland, Lua config).
#
#   1st press: start the app, or bring it back from special:sidepad, tile it on the
#              left edge of the active workspace and resize it to SIDEPAD_WIDTH px.
#   2nd press: slide it off the left edge of the screen and stash it in special:sidepad.
#
# Companion window rule (conf/windowrule.lua) keeps it tiled and sets the slide animation:
# hl.window_rule({
#     match = { class = "^Chatgpt$" },
#     tile = true,
#     animation = "slide left",
# })

# Application to start in sidepad mode
SIDEPAD_APP="chatgpt"
# Application class, can be found with `hyprctl clients`
SIDEPAD_CLASS="Chatgpt"
# Sidepad width in pixels
SIDEPAD_WIDTH=500
# Hidden workspace used to stash the sidepad
SIDEPAD_STASH="special:sidepad"

WINDOW="class:^(${SIDEPAD_CLASS})$"

dispatch() {
    hyprctl dispatch "$1" >/dev/null 2>&1
}

# Prints "address workspace floating height" of the sidepad window, or nothing if not running
sidepad_info() {
    hyprctl clients -j | jq -r --arg class "$SIDEPAD_CLASS" \
        'first(.[] | select(.class == $class)) | "\(.address) \(.workspace.name) \(.floating) \(.size[1])"'
}

# Compare the sidepad with the other tiled windows on its workspace:
#   root_check overlap -> "true" if any of them overlaps it horizontally (stacked above/below)
#   root_check left    -> "true" if any of them is left of it
root_check() {
    hyprctl clients -j | jq -r --arg class "$SIDEPAD_CLASS" --arg mode "$1" '
        (first(.[] | select(.class == $class))) as $s
        | [ .[] | select(.class != $class and .workspace.id == $s.workspace.id
                         and (.floating | not) and .mapped and (.hidden | not)) ]
        | if $mode == "overlap" then
              any(.at[0] < $s.at[0] + $s.size[0] and .at[0] + .size[0] > $s.at[0])
          else
              any(.at[0] < $s.at[0])
          end'
}

# Tile the sidepad on the left edge of the active workspace and set its width
place_sidepad() {
    dispatch "hl.dsp.window.float({ action = \"disable\", window = \"$WINDOW\" })"
    dispatch "hl.dsp.focus({ window = \"$WINDOW\" })"
    # Make the sidepad one half of the workspace's root split (dwindle), so it is
    # never stacked with another window and always gets the full height.
    dispatch 'hl.dsp.layout("movetoroot")'

    # If the root split is top/bottom, other windows overlap it horizontally: flip it
    # to left/right. If any window then sits left of the sidepad, swap the two halves.
    if [ "$(root_check overlap)" = "true" ]; then
        dispatch 'hl.dsp.layout("togglesplit")'
    fi
    if [ "$(root_check left)" = "true" ]; then
        dispatch 'hl.dsp.layout("swapsplit")'
    fi

    local height
    height=$(sidepad_info | awk '{print $4}')
    dispatch "hl.dsp.window.resize({ x = $SIDEPAD_WIDTH, y = ${height:-0}, window = \"$WINDOW\" })"
}

INFO=$(sidepad_info)

# Not running: start it, wait for the window to map, then place it
if [ -z "$INFO" ]; then
    eval "$SIDEPAD_APP >/dev/null 2>&1 &"
    for _ in $(seq 1 100); do
        sleep 0.1
        [ -n "$(sidepad_info)" ] && break
    done
    sleep 0.3
    place_sidepad
    exit 0
fi

SIDEPAD_WORKSPACE=$(awk '{print $2}' <<<"$INFO")
ACTIVE_WORKSPACE=$(hyprctl activeworkspace -j | jq -r '.name')

if [ "$ACTIVE_WORKSPACE" = "$SIDEPAD_WORKSPACE" ]; then
    # Visible: float it, slide it off the left edge, then stash it
    MON_X=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .x')
    HEIGHT=$(awk '{print $4}' <<<"$INFO")
    dispatch "hl.dsp.window.float({ action = \"enable\", window = \"$WINDOW\" })"
    # Keep its tiled size so the whole window clears the screen edge
    dispatch "hl.dsp.window.resize({ x = $SIDEPAD_WIDTH, y = $HEIGHT, window = \"$WINDOW\" })"
    dispatch "hl.dsp.window.move({ x = $((MON_X - SIDEPAD_WIDTH - 50)), y = 45, window = \"$WINDOW\" })"
    sleep 0.25
    dispatch "hl.dsp.window.move({ workspace = \"$SIDEPAD_STASH\", window = \"$WINDOW\", follow = false })"
else
    # Hidden (or on another workspace): bring it to the active workspace and place it
    dispatch "hl.dsp.window.move({ workspace = \"$ACTIVE_WORKSPACE\", window = \"$WINDOW\" })"
    place_sidepad
fi
