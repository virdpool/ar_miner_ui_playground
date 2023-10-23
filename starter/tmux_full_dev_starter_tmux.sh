#!/bin/bash
if screen -S ar_miner_ui_playground_full_dev -Q select .; then
  echo "can't start, already started"
  exit 1
fi
./starter/_tmux_full_dev_starter_tmux.sh &
screen -S ar_miner_ui_playground_full_dev