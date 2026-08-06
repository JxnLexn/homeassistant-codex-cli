# Änderungsprotokoll

## 0.1.1

- Behebt den Startfehler bei korrekt eingetragenen öffentlichen SSH-Schlüsseln.
- Verwendet für `authorized_keys` ausschließlich die native `bashio`-Prüfung
  und versucht nicht mehr, die Textausgabe erneut als JSON zu parsen.

## 0.1.0

- Erste Version der Home-Assistant-App.
- Codex CLI mit persistentem Benutzerzustand.
- SSH-Zugang ausschließlich über öffentliche Schlüssel.
- Schreibbarer Zugriff auf `/homeassistant`.
- Optionale HA-MCP-Anbindung über Streamable HTTP.
- Multi-Arch-Images für `amd64` und `aarch64`.
