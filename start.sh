#!/bin/bash
set -e

echo "=== Render Node Stack START ==="

# Log file
LOG_DIR=/tmp/node_stack_logs
mkdir -p "$LOG_DIR"

# Start placeholder Mysterium (replace this with real service command if needed)
echo "[`date`] starting mysterium placeholder" | tee -a $LOG_DIR/mysterium.log
/app/scripts/mysterium_placeholder.sh >> $LOG_DIR/mysterium.log 2>&1 &

# Start placeholder Golem
echo "[`date`] starting golem placeholder" | tee -a $LOG_DIR/golem.log
/app/scripts/golem_placeholder.sh >> $LOG_DIR/golem.log 2>&1 &

# Start placeholder iExec
echo "[`date`] starting iexec placeholder" | tee -a $LOG_DIR/iexec.log
/app/scripts/iexec_placeholder.sh >> $LOG_DIR/iexec.log 2>&1 &

# Start Gensyn worker (Python placeholder)
echo "[`date`] starting gensyn worker" | tee -a $LOG_DIR/gensyn.log
python3 /app/gensyn/run_rl_swarm.py >> $LOG_DIR/gensyn.log 2>&1 &

# Start Galxe bot
echo "[`date`] starting galxe bot" | tee -a $LOG_DIR/galxe.log
node /app/galxe-bot/index.js >> $LOG_DIR/galxe.log 2>&1 &

# Start Layer3 bot
echo "[`date`] starting layer3 bot" | tee -a $LOG_DIR/layer3.log
node /app/layer3-bot/bot.js >> $LOG_DIR/layer3.log 2>&1 &

echo "[`date`] all processes launched. Tailing logs..."
sleep 1

# Tail logs so container stays alive and logs are visible in Render dashboard
tail -F $LOG_DIR/*.log
