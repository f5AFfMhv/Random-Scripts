#!/bin/bash
# Script for calling an application in sidepad mode on hyprland

# Sidepad geometry is defined with hyprland window rule, lua conf e.g.:
# -- ChatGPT Sidepad
# hl.window_rule({
#     match = {
#         class = "^chrome-chatgpt.com__-Default$"
#     },
#     size = { 500, 1360 },
#     move = { 10, 45 },
#     float = true,
# })

# Define which application to start in sidepad mode
SIDEPAD_APP="flatpak run io.github.ungoogled_software.ungoogled_chromium --app=https://chatgpt.com"
# Application class, can be found with `hyprctl clients`
SIDEPAD_CLASS="chrome-chatgpt.com__-Default"


# Check if sidepad app already running and if not start it
if hyprctl clients -j | jq -e --arg class "$SIDEPAD_CLASS" 'any(.[]; .class == $class)' > /dev/null; then
    # echo "$SIDEPAD_CLASS is already running"
    # Get current sidepad app workspace
    SIDEPAD_WORKSPACE=$(hyprctl clients -j | jq -r -e --arg class "$SIDEPAD_CLASS" '.[] | select(.class == $class) | .workspace.name')
    # echo "Sidepad is on $SIDEPAD_WORKSPACE workspace"
else
    # echo "STARTING $SIDEPAD_CLASS"
    eval "$SIDEPAD_APP >/dev/null 2>&1 &"
    exit 0
fi

# Get active workspace
ACTIVE_WORKSPACE=$(hyprctl activeworkspace -j | jq -r '.name')
# Show/hide sidepad
if [ "$ACTIVE_WORKSPACE" = "$SIDEPAD_WORKSPACE" ]; then
    # echo "Sidepad is on active workspace, hiding"
    hyprctl dispatch "hl.dsp.window.move({ workspace = \"special:sidepad\", window = \"class:^(chrome-chatgpt.com__-Default)$\", follow = false })" >/dev/null 2>&1
else
    # echo "Moving sidepad to active workspace $ACTIVE_WORKSPACE"
    hyprctl dispatch "hl.dsp.window.move({ workspace = \"+0\", window = \"class:^(chrome-chatgpt.com__-Default)$\" })" >/dev/null 2>&1
fi