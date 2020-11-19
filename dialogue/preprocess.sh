#!/usr/bin/env bash

set -e

# ############### AMR v2.0 ################
# # Directory where intermediate utils will be saved to speed up processing.
util_dir=dialogue/dailydialog_utils

# AMR data with **features**
data_dir=dialogue
data=${data_dir}/$1.txt.features

# ========== Set the above variables correctly ==========

printf "Cleaning inputs...`date`\n"
python -u -m stog.data.dataset_readers.amr_parsing.preprocess.input_cleaner \
    --amr_files ${data}
printf "Done.`date`\n\n"

printf "Recategorizing subgraphs...`date`\n"
python -u -m stog.data.dataset_readers.amr_parsing.preprocess.text_anonymizor \
    --amr_file ${data}.input_clean \
    --util_dir ${util_dir}
printf "Done.`date`\n\n"

printf "Removing senses...`date`\n"
python -u -m stog.data.dataset_readers.amr_parsing.preprocess.sense_remover \
    --util_dir ${util_dir} \
    --amr_files ${data}.input_clean.recategorize
printf "Done.`date`\n\n"

printf "Renaming preprocessed files...`date`\n"
mv ${data}.input_clean.recategorize.nosense ${data}.preproc
rm ${data_dir}/*.input_clean*
