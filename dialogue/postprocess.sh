#!/usr/bin/env bash

set -e

# Directory where intermediate utils will be saved to speed up processing.
util_dir=dialogue/dailydialog_utils

# AMR data with **features**
data_dir=dialogue
test_data=${data_dir}/dailydialog_examples.pred.txt

# ========== Set the above variables correctly ==========

printf "Frame lookup...`date`\n"
python -u -m stog.data.dataset_readers.amr_parsing.postprocess.node_restore \
    --amr_files ${test_data} \
    --util_dir ${util_dir}
printf "Done.`date`\n\n"

printf "Expanding nodes...`date`\n"
python -u -m stog.data.dataset_readers.amr_parsing.postprocess.expander \
    --amr_files ${test_data}.frame \
    --util_dir ${util_dir}
printf "Done.`date`\n\n"

mv ${test_data}.frame.expand ${test_data}.postproc
rm ${test_data}.frame*
