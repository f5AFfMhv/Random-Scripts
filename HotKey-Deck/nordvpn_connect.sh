#!/bin/bash

# Connect to VPN server using nordvpn. Disconnect if connection already established

# Default country to connect
COUNTRY=lithuania

# Help message
usage() {
  cat <<EOF
Usage: $(basename "${BASH_SOURCE[0]}") [-h] country
Connect to VPN server using nordvpn. Disconnect if connection already established.

Available options:
  -h, --help      Print this help and exit

Example:
  $(basename "${BASH_SOURCE[0]}") poland
EOF
  exit
}

msg() {
  echo >&2 -e "${1-}"
}

# Exit function
die() {
  local msg=$1
  local code=${2-1} # default exit status 1
  msg "$msg"
  exit "$code"
}

# Function for parsing input variables
parse_params() {

  while :; do
    case "${1-}" in
    -h | --help) usage ;;
    -?*) die "Unknown option: $1" ;;
    *) break ;;
    esac
    shift
  done

  return 0
}

# Connect to VPN server
connect() {
  nordvpn connect $COUNTRY
  msg "nordVPN connected to $COUNTRY"
}

# Disconnect from VPN server
disconnect() {
  nordvpn disconnect
  msg "nordVPN disconnected"
}

notify-send -t 2 "nordVPN script initiated"

# Parse input arguments
parse_params "$@"

# Check if nordvpn is installed
command -v nordvpn > /dev/null 2>&1
if [[ $? -gt 0 ]]; then
  die "nordvpn is not installed"
fi

# Check if user is logged in
nordvpn account | grep Active > /dev/null 2>&1
if [[ $? -gt 0 ]]; then
  notify-send -u critical "Login to nordVPN account"
  die "You're logged out or account is expired"
fi

# Check if user is connected
nordvpn account | grep Active > /dev/null 2>&1
if [[ $? -gt 0 ]]; then
  notify-send -u critical "Login to nordVPN account"
  die "You're logged out or account is expired"
fi

# Check if country was passed as argument
if [[ $# -eq 0 ]]; then
  msg "No country name passed, using default $COUNTRY"
elif [[ $# -gt 1 ]]; then
  msg "More than one input argument passed, using only first one $1, rest are ignored."
  COUNTRY=$1
else
  msg "Using $1 as country to connect to."
  COUNTRY=$1
fi

# Check what is the connection status and connec/disconnect acordingly
nordvpn status | grep Disconnected > /dev/null 2>&1
if [[ $? -eq 0 ]]; then
  connect
else
  disconnect
fi




