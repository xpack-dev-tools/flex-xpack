# -----------------------------------------------------------------------------
# This file is part of the xPack distribution.
#   (https://xpack.github.io)
# Copyright (c) 2020 Liviu Ionescu.
#
# Permission to use, copy, modify, and/or distribute this software
# for any purpose is hereby granted, under the terms of the MIT license.
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------

function tests_update_system()
{
  local image_name="$1"

  # Make sure that the minimum prerequisites are met.
  if [[ ${image_name} == github-actions-ubuntu* ]]
  then
    run_verbose sudo apt-get update
    # To make 32-bit tests possible.
    run_verbose sudo apt-get -qq install --yes g++
  elif [[ ${image_name} == *ubuntu* ]] || [[ ${image_name} == *debian* ]]
  then
    run_verbose apt-get -qq install --yes g++
  elif [[ ${image_name} == *raspbian* ]]
  then
    run_verbose apt-get -qq install --yes g++
  elif [[ ${image_name} == *centos* ]] || [[ ${image_name} == *redhat* ]] || [[ ${image_name} == *fedora* ]]
  then
    run_verbose yum install --assumeyes --quiet gcc-c++
  elif [[ ${image_name} == *suse* ]]
  then
    run_verbose zypper --quiet --no-gpg-checks install --no-confirm gcc-c++
  elif [[ ${image_name} == *manjaro* ]]
  then
    run_verbose pacman -S --quiet --noconfirm --noprogressbar g++
  elif [[ ${image_name} == *archlinux* ]]
  then
    run_verbose pacman -S --quiet --noconfirm --noprogressbar gcc
  fi
}

function tests_install_dependencies()
{
  echo
  echo "[${FUNCNAME[0]} $@]"

  local tests_folder_path="$1"
  local tests_archive_suffix="$2"

  mkdir -pv "${tests_folder_path}/downloads"

  # https://github.com/xpack-dev-tools/m4-xpack/releases/download/v1.4.19-2/xpack-m4-1.4.19-2-darwin-arm64.tar.gz
  m4_url_base="https://github.com/xpack-dev-tools/m4-xpack/releases/download/"
  m4_version="1.4.19-2"

  echo
  echo "Downloading xpack-m4-${m4_version}-${tests_archive_suffix}..."
  run_verbose curl \
    --fail \
    --location\
    --output "${tests_folder_path}/downloads/xpack-m4-${m4_version}-${tests_archive_suffix}" \
    "${m4_url_base}/v${m4_version}/xpack-m4-${m4_version}-${tests_archive_suffix}"

  run_verbose cd "${tests_folder_path}"

  echo
  echo "Extracting xpack-m4-${m4_version}-${tests_archive_suffix}..."

  # This does not run on Windows, so no need to process .zip archives differently.
  run_verbose tar xf "${tests_folder_path}/downloads/xpack-m4-${m4_version}-${tests_archive_suffix}"

  echo
  export PATH="${tests_folder_path}/xpack-m4-${m4_version}/bin:${PATH}"
  echo "PATH=${PATH}"

  export M4="$(which m4)"
  echo "M4=${M4}"

  # Force the test to compute the realpath.
  unset XBB_LIBRARIES_INSTALL_FOLDER_PATH

  echo
  echo "[${FUNCNAME[0]} done]"
}

# -----------------------------------------------------------------------------
