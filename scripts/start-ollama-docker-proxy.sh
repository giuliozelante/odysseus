#!/usr/bin/env bash
# Start the Ollama TCP proxy if it is not already listening on 11435.
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
if ss -tln | grep -q ':11435 '; then
  echo "Ollama proxy already listening on 11435"
  exit 0
fi
mkdir -p "$ROOT/logs"
nohup python3 "$ROOT/scripts/ollama-docker-proxy.py" >>"$ROOT/logs/ollama-proxy.log" 2>&1 &
sleep 1
ss -tln | grep ':11435 ' || { echo "Failed to start proxy; see $ROOT/logs/ollama-proxy.log"; exit 1; }
echo "Ollama proxy started (0.0.0.0:11435 -> 127.0.0.1:11434)"
