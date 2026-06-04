#!/usr/bin/env bash
# Forward Ollama (127.0.0.1:11434) to 0.0.0.0:11435 so Docker can reach it via
# host.docker.internal without changing the system Ollama service.
set -euo pipefail
exec socat TCP-LISTEN:11435,bind=0.0.0.0,fork,reuseaddr TCP:127.0.0.1:11434
