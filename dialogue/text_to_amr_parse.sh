#!/usr/bin/env bash

set -e

#python get_dailydialog_examples.py
#
#echo "Converted train, dev, test DailyDialog to input format..."

cd ..

for file in "amr-dailydialog-train"
do
  echo $file
#  ./dialogue/annotate_features.sh $file
#  echo "Annotated features..."
#  ./dialogue/preprocess.sh $file
#  echo "Preprocessed..."
#  ./dialogue/predict.sh $file
#  echo "Parsed..."
  ./dialogue/postprocess.sh $file
  echo "Postprocessed..."
done

# cd stanford-corenlp-4.1.0
# java -mx4g -cp "*" edu.stanford.nlp.pipeline.StanfordCoreNLPServer -port 9000

# annotated features, but broke on rest - "amr-dailydialog-train.txt"

# need to run everything for - "amr-dailydialog-test"