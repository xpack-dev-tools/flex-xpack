# -----------------------------------------------------------------------------
# This file is part of the xPack distribution.
#   (https://xpack.github.io)
# Copyright (c) 2020 Liviu Ionescu.
#
# Permission to use, copy, modify, and/or distribute this software
# for any purpose is hereby granted, under the terms of the MIT license.
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------

function tests_install_dependencies()
{
  echo
  echo "[${FUNCNAME[0]} $@]"

  # Force the test to compute the realpath.
  unset XBB_LIBRARIES_INSTALL_FOLDER_PATH

  echo
  echo "[${FUNCNAME[0]} done]"
}

# -----------------------------------------------------------------------------
