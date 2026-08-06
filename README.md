# Home Assistant Codex CLI

Dieses Repository stellt eine Home-Assistant-App bereit, die Codex CLI als
SSH-erreichbaren, dauerhaft laufenden Entwicklungs- und Administrationshost
für Home Assistant OS installiert.

## Installation

1. Öffne in Home Assistant **Einstellungen → Apps → App-Store**.
2. Öffne das Menü **Repositories** und füge dieses Repository hinzu:
   `https://github.com/JxnLexn/homeassistant-codex-cli`
3. Installiere **Codex CLI**.
4. Hinterlege mindestens einen öffentlichen SSH-Schlüssel in der
   App-Konfiguration.
5. Installiere und konfiguriere optional
   [HA-MCP](https://github.com/homeassistant-ai/ha-mcp) und trage dessen lokale
   MCP-URL unter `ha_mcp_url` ein.
6. Starte die App und verbinde dich per SSH mit Port `2222`.

Ausführliche Hinweise stehen in [codex_cli/DOCS.md](codex_cli/DOCS.md).

## Aktualisierungen

GitHub Actions baut bei Änderungen an der App Images für `amd64` und
`aarch64` und veröffentlicht sie in der GitHub Container Registry. Sobald die
Version in `codex_cli/config.yaml` erhöht wurde, bietet Home Assistant das
Update über die normale App-Verwaltung an.

## Sicherheit

- SSH akzeptiert ausschließlich öffentliche Schlüssel.
- `/homeassistant` ist schreibbar eingebunden.
- `/config` ist lediglich ein Kompatibilitätslink auf `/homeassistant`.
- Die App erhält keinen Docker-Socket und keinen vollständigen Host-Zugriff.
- Die SSH-Freigabe sollte nur im lokalen Netz oder über ein VPN erreichbar
  sein.
