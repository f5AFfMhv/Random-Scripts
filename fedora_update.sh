#!/usr/bin/env bash

# Checks for available Fedora updates and provides options to check, update, or show help.

# Print help message
show_help() {
    echo "Usage: $0 [OPTION]"
    echo
    echo "Options:"
    echo "  --check     Check for available updates"
    echo "  --update    Update system packages"
    echo "  --help      Show this help message"
}

# Check for available updates
check() {
    local updates status

    updates=$(dnf check-update -q 2>/dev/null | grep -Ec '^[^[:space:]]')
    status=$?

    if [[ $status -eq 0 || $status -eq 100 ]]; then
        notify-send "$updates updates are available"
    else
        return "$status"
    fi
}

# Update system
update() {
    sudo dnf update -y
    flatpak update -y
    flatpak uninstall --unused -y
    # dracut --regenerate-all --force
    # grub2-mkconfig -o /boot/grub2/grub.cfg

    echo ":: Update complete! Press [ENTER] to continue."
    read -r
}

case "$1" in
    --check)
        check
        ;;
    --update)
        update
        ;;
    --help)
        show_help
        ;;
    *)
        show_help
        ;;
esac