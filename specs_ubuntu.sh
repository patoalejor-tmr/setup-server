#!/bin/bash
# Output full system specs to coworker_specs_ubuntu.txt

OUTPUT="coworker_specs_ubuntu.txt"
{
  echo "==== SYSTEM INFORMATION ===="
  hostnamectl
  echo

  echo "==== CPU INFO ===="
  lscpu
  echo

  echo "==== MEMORY INFO ===="
  free -h
  echo

  echo "==== DISK INFO ===="
  lsblk -o NAME,SIZE,TYPE,MOUNTPOINT
  echo

  echo "==== GPU INFO ===="
  lspci | grep -i --color 'vga\|3d\|2d'
  echo

  echo "==== NETWORK INTERFACES ===="
  ip -br address
  echo

  echo "==== OPERATING SYSTEM ===="
  uname -a
  echo

} > "$OUTPUT"

echo "✅ System info saved to $OUTPUT"
