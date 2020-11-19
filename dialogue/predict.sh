#!/usr/bin/env bash

set -e

dir=dialogue

python -u -m stog.commands.predict \
    --archive-file $dir/ckpt-amr-2.0 \
    --weights-file $dir/ckpt-amr-2.0/best.th \
    --input-file $dir/$1.txt.features.preproc \
    --batch-size 32 \
    --use-dataset-reader \
    --cuda-device 1 \
    --output-file $dir/$1.pred.txt \
    --silent \
    --beam-size 5 \
    --predictor STOG