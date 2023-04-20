#!/bin/bash
# Enables full composition pipeline on systems with nvidia gpu.
# This option fixes screen tearing.
# Works with multiple monitors.
# Based on https://unix.stackexchange.com/questions/510757/how-to-automatically-force-full-composition-pipeline-for-nvidia-gpu-driver

s="$(nvidia-settings -q CurrentMetaMode -t)"

if [[ "${s}" != "" ]]; then
  s="${s#*" :: "}"
  nvidia-settings -a CurrentMetaMode="${s//\}/, ForceFullCompositionPipeline=On\}}"
fi
