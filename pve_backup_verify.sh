#!/bin/bash
# Checks if Proxmox VM backup is present.
# Sends ping to healthchecks service.

# Backup date
backup_date=$(date "+%Y_%m_%d")

# Help message
usage() {
  cat <<EOF
Usage: $(basename "${BASH_SOURCE[0]}") [VM ID] [HC UUID]
Check if Proxmox VM backup is present for current day. Send ping to healthchecks service.

Arguments:
  [VM ID]     VM ID in PVE.
  [HC UUID]   Healthchecks service UUID

Example:
  $(basename "${BASH_SOURCE[0]}") 100 ada3ccd3-db52-4981-8a5e-6f79c8c34264
EOF
}

# Validate input VM ID
validate_vm_id() {
  vm_id=$1
  # Regular expression pattern for VM ID
  pattern='^[0-9]{3}$'
  if [[ $vm_id =~ $pattern ]]; then
    echo "Valid VM ID $1"
  else
    echo -e "Invalid VM ID $1\n"
    usage
    exit 1
  fi
}

# Validate input UUID
validate_uuid() {
  uuid=$1
  # Regular expression pattern for UUID
  pattern='^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$'
  if [[ $uuid =~ $pattern ]]; then
    echo "Valid UUID $1"
  else
    echo -e "Invalid UUID $1\n"
    usage
    exit 1
  fi
}

# Send ping with exit status to healthchecks service
function hc_ping {
  curl --retry 3 https://hc-ping.com/$validated_uuid/$?
}

# Send HC ping on script exit
trap hc_ping EXIT

# Validate inputs
if [[ -z "$1" || -z "$2" ]]; then
  echo -e "Missing one or more input argument\n"
  usage
  exit 1
fi
validate_vm_id $1
validate_uuid $2

validated_vm_id=$1
validated_uuid=$2

# Check if VM backup exist
/usr/sbin/pvesm list local --vmid $validated_vm_id | grep $backup_date
