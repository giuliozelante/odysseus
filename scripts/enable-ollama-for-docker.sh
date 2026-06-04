#!/usr/bin/env bash
# Preferred: bind Ollama on all interfaces (requires sudo once).
set -euo pipefail
sudo mkdir -p /etc/systemd/system/ollama.service.d
printf '%s\n' '[Service]' 'Environment="OLLAMA_HOST=0.0.0.0:11434"' | sudo tee /etc/systemd/system/ollama.service.d/host-docker.conf
sudo systemctl daemon-reload
sudo systemctl restart ollama
echo "Ollama now listens on 0.0.0.0:11434 — set OLLAMA_BASE_URL to http://host.docker.internal:11434/v1 in .env"
