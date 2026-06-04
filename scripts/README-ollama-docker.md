# Host Ollama + Docker Odysseus

Odysseus in Docker cannot reach `127.0.0.1:11434` on the host unless Ollama listens on all interfaces.

## Quick path (no sudo)

```bash
./scripts/start-ollama-docker-proxy.sh
```

Set in `.env`:

```env
OLLAMA_BASE_URL=http://host.docker.internal:11435/v1
EMBEDDING_URL=http://host.docker.internal:11435/v1/embeddings
EMBEDDING_MODEL=nomic-embed-text
```

Restart Odysseus: `docker compose up -d`

## Permanent path (sudo once)

```bash
./scripts/enable-ollama-for-docker.sh
```

Then use port `11434` in `.env` instead of `11435`.
