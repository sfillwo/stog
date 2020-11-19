#!/usr/bin/env bash

set -e

# Usage: ./scripts/annotate_features.sh <input_file_of_text_examples>

# Start a Stanford CoreNLP server before running this script.
# https://stanfordnlp.github.io/CoreNLP/corenlp-server.html

# The compound file is downloaded from
# https://github.com/ChunchuanLv/AMR_AS_GRAPH_PREDICTION/blob/master/data/joints.txt
compound_file=dialogue/joints.txt
examples=$1

python -u -m stog.data.dataset_readers.amr_parsing.preprocess.feature_annotator \
    dialogue/$examples.txt \
    --compound_file ${compound_file}
