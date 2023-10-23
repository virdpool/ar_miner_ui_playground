#!/bin/bash
while ! screen -S ar_miner_ui_playground_full_dev -Q select . ; do
  sleep 0.1
done
sleep 0.5

screen -S ar_miner_ui_playground_full_dev -X -p 0 stuff "tmux\n"
sleep 1
# create tabs h
sleep 0.1
screen -S ar_miner_ui_playground_full_dev -X -p 0 stuff "^B"
sleep 0.1
screen -S ar_miner_ui_playground_full_dev -X -p 0 stuff "%"

sleep 0.1
screen -S ar_miner_ui_playground_full_dev -X -p 0 stuff "^B"
sleep 0.1
screen -S ar_miner_ui_playground_full_dev -X -p 0 stuff "^[[D"

# fill tabs h
# create tabs v


# fill tabs v

sleep 0.1
screen -S ar_miner_ui_playground_full_dev -X -p 0 stuff ""

# reset tab pos v

# next h
sleep 0.1
screen -S ar_miner_ui_playground_full_dev -X -p 0 stuff "^B"
sleep 0.1
screen -S ar_miner_ui_playground_full_dev -X -p 0 stuff "^[[C"


sleep 0.1
screen -S ar_miner_ui_playground_full_dev -X -p 0 stuff "cd /data/nodejs/experiments/ar_miner_ui_playground\nnpm run front_dev\n"

# reset tab pos v
sleep 0.1
screen -S ar_miner_ui_playground_full_dev -X -p 0 stuff "^B"
sleep 0.1
screen -S ar_miner_ui_playground_full_dev -X -p 0 stuff "^[[D"

