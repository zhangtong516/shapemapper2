#!/bin/bash
#----------------------------------------------------------------------#
# This file is a part of ShapeMapper, and is licensed under the terms  #
# of the MIT license. Copyright 2017 Steven Busan.                     #
#----------------------------------------------------------------------#

BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"

# update path to include various executables
export PATH=${BASE_DIR}:${PATH}
export PATH=${BASE_DIR}/bin:${PATH}

source ${BASE_DIR}/install/thirdparty_paths.sh


CONDA_PATH=${BASE_DIR}/thirdparty/miniconda
# if using local conda python, disable PYTHONPATH, in case system libs interfere
if [ -f ${CONDA_PATH}/bin/python3 ]; then
    unset PYTHONPATH
fi