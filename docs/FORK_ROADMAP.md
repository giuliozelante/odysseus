# Community fork roadmap (giuliozelante/odysseus)

Improvements inspired by community reviews of PewDiePie’s Odysseus, aimed at a **second-brain / knowledge-base** direction without removing creator-focused tools (gallery, deep research, etc.).

## Shipped on `feature/community-improvements`

| Area | Change |
|------|--------|
| **Skills** | Import from GitHub / skills.sh URL (`POST /api/skills/import-from-url`) — installs `SKILL.md` plus sibling text files (templates, references). |
| **Calendar** | Browser sends `X-Tz-Offset` on calendar API calls; server binds it on create/update/quick-parse to reduce timezone drift. |
| **PDF / Office** | Docker image installs `requirements-optional.txt` (PyMuPDF viewer, markitdown) so PDF preview and Office extraction work out of the box. |
| **Ollama** | Local install docs/scripts under `scripts/` (proxy + `.env` wiring) — see your fork’s setup notes. |

## Next (medium effort)

1. **Knowledge base / “LM wiki”** — Dedicated library mode: folder tree, full-text + vector search over personal docs, graph links between notes and sources.
2. **Book → Skill** — Pipeline to turn imported PDFs/Markdown into draft `SKILL.md` procedures (review before publish).
3. **Skill registry** — Curated built-in list + one-click installs (skills.sh index, Anthropic skills repo subsets).
4. **MCP templates** — Settings presets for common MCP servers (filesystem, browser, custom) with health checks.

## Later (large effort)

1. **Graph RAG** — Entity graph on top of ChromaDB (GraphRAG / graphify-style) for “how does X relate to Y?” queries.
2. **Compare mode scheduling** — Queue compare runs on single-GPU hosts instead of failing parallel loads.
3. **Google Calendar** — Optional OAuth in addition to existing CalDAV (Settings → Integrations already supports CalDAV / Nextcloud / Fastmail).

## Upstream

This fork tracks [pewdiepie-archdaemon/odysseus](https://github.com/pewdiepie-archdaemon/odysseus). Prefer small, test-backed PRs when contributing fixes that belong in the main project.
