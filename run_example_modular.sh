#!/bin/bash
#----------------------------------------------------------------------#
# This file is a part of ShapeMapper, and is licensed under the terms  #
# of the MIT license. Copyright 2018 Steven Busan.                     #
#----------------------------------------------------------------------#

# Run simple ShapeMapper pipeline on a small subset of example data,
# outputting additional information for power users interested in
# running individual shapemapper modules "manually".

set -e # exit on first error (if any)

# Find the parent folder of this script,
# resolving (possibly nested) symlinks
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
    BASE_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$BASE_DIR/$SOURCE"
done
BASE_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

export PATH=${BASE_DIR}:${PATH}

cd ${BASE_DIR}

shapemapper \
--name "example-results-modular" \
--target example_data/TPP.fa \
--amplicon \
--overwrite \
--min-depth 1000 \
--modified --folder example_data/TPPplus \
--untreated --folder example_data/TPPminus \
--serial \
--verbose \
--render-flowchart \
--output-processed-reads \
--output-aligned-reads \
--output-parsed-mutations \
--output-counted-mutations
