#!/usr/bin/env bash

set -e
dir=dialogue/dailydialog_utils

echo "Downloading artifacts."
mkdir -p $dir/bert-base-cased
curl -O https://s3.amazonaws.com/models.huggingface.co/bert/bert-base-cased.tar.gz
tar -xzvf bert-base-cased.tar.gz -C $dir/bert-base-cased
curl -o $dir/bert-base-cased/bert-base-cased-vocab.txt \
    https://s3.amazonaws.com/models.huggingface.co/bert/bert-base-cased-vocab.txt
rm bert-base-cased.tar.gz

mkdir -p $dir/glove
curl -L -o $dir/glove/glove.840B.300d.zip \
    http://nlp.stanford.edu/data/wordvecs/glove.840B.300d.zip



