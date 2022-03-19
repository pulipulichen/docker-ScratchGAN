#!/bin/sh

cp -R -u -p /tmp/emnlp2017/input.example/train.json /tmp/emnlp2017/input/
cp -R -u -p /tmp/emnlp2017/input.example/valid.json /tmp/emnlp2017/input/
cp -R -u -p /tmp/emnlp2017/input.example/test.json /tmp/emnlp2017/input/
cp -R -u -p /tmp/emnlp2017/input.example/glove_emnlp2017.txt /tmp/emnlp2017/input/

echo 'Starting training...'
python3.5 -m scratchgan.experiment --mode="train" &
python3.5 -m scratchgan.experiment --mode="evaluate_pair" &
