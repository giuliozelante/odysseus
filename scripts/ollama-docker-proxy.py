#!/usr/bin/env python3
"""Expose host Ollama (127.0.0.1:11434) on 0.0.0.0:11435 for Docker."""
from __future__ import annotations

import select
import socket
import threading

LISTEN = ("0.0.0.0", 11435)
TARGET = ("127.0.0.1", 11434)
BUF = 65536


def relay(client: socket.socket) -> None:
    upstream = socket.create_connection(TARGET, timeout=30)
    client.settimeout(None)
    upstream.settimeout(None)
    sockets = [client, upstream]
    try:
        while True:
            readable, _, _ = select.select(sockets, [], [], 60)
            if not readable:
                break
            for sock in readable:
                data = sock.recv(BUF)
                if not data:
                    return
                other = upstream if sock is client else client
                other.sendall(data)
    finally:
        for sock in sockets:
            try:
                sock.close()
            except OSError:
                pass


def main() -> None:
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    server.bind(LISTEN)
    server.listen(64)
    print(f"Ollama proxy listening on {LISTEN[0]}:{LISTEN[1]} -> {TARGET[0]}:{TARGET[1]}", flush=True)
    while True:
        client, _addr = server.accept()
        threading.Thread(target=relay, args=(client,), daemon=True).start()


if __name__ == "__main__":
    main()
