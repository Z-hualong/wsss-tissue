#!/usr/bin/env bash
CONFIG=$1
GPUS=$2
DIR=$3
PORT=${PORT:-23334}

PYTHONPATH="$(dirname $0)/..":$PYTHONPATH \
python -m torch.distributed.launch --nproc_per_node=$GPUS --master_port=$PORT \
    $(dirname "$0")/train.py $CONFIG --launcher pytorch ${@:3} --work-dir ${DIR} ${@:4}
