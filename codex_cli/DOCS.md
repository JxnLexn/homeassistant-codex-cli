# Codex CLI für Home Assistant OS

## Voraussetzungen

- Home Assistant OS
- ein SSH-Schlüsselpaar auf dem Computer mit der Codex-Desktop-App
- optional eine installierte HA-MCP-App oder HA-MCP-Custom-Component

## Konfiguration

```yaml
authorized_keys:
  - ssh-ed25519 AAAA... dein-name
ha_mcp_url: "http://192.168.1.20:9583/private_DEIN_GEHEIMER_PFAD"
allow_tcp_forwarding: false
```

`authorized_keys` muss mindestens einen vollständigen öffentlichen Schlüssel
enthalten. Passwortanmeldung wird nicht unterstützt.

`ha_mcp_url` ist optional. Verwende die lokale Verbindungs-URL, die HA-MCP in
seiner Oberfläche oder seinem Protokoll ausgibt. Der geheime Pfad gehört nur in
die Home-Assistant-App-Konfiguration und niemals in dieses Git-Repository.

## Erste Anmeldung

Verbinde dich nach dem Start beispielsweise so:

```bash
ssh -p 2222 root@homeassistant.local
```

Authentifiziere Codex anschließend einmalig:

```bash
codex login --device-auth
```

Die Anmeldung und die Codex-Konfiguration liegen unter `/data/codex` und
bleiben bei App-Updates erhalten.

## Codex-Desktop-App

Lege auf dem Computer mit der Codex-App einen SSH-Alias an:

```sshconfig
Host homeassistant-codex
  HostName homeassistant.local
  Port 2222
  User root
  IdentityFile ~/.ssh/id_ed25519_homeassistant
```

Prüfe zuerst `ssh homeassistant-codex`. Füge den Host danach unter
**Einstellungen → Verbindungen** als SSH-Host hinzu und öffne auf ihm das
Projekt `/workspace`.

Home Assistant liegt dort unter `/workspace/homeassistant`. Der direkte,
kanonische Containerpfad ist `/homeassistant`; `/config` zeigt aus
Kompatibilitätsgründen auf dasselbe Verzeichnis.

## HA-MCP

Wenn `ha_mcp_url` gesetzt ist, erzeugt die App automatisch den MCP-Eintrag
`home_assistant` in `/data/codex/config.toml`. Nach einer Änderung der URL muss
die App neu gestartet werden. Prüfe die Verbindung anschließend mit:

```bash
codex mcp list
```

## Aktualisierungen

Home Assistant erkennt neue Versionen anhand von `version` in `config.yaml`.
Ein Push auf `main` baut und veröffentlicht die passende Version automatisch
in der GitHub Container Registry. Erst nach erfolgreichem Build sollte die
Versionsnummer für eine Veröffentlichung erhöht werden.

## Sicherheitsgrenzen

- Stelle Port 2222 nicht ungeschützt ins Internet.
- Nutze für externe Verbindungen ein VPN oder Mesh-VPN.
- Die App hat Schreibzugriff auf die Home-Assistant-Konfiguration.
- Prüfe vor Löschungen und größeren Änderungen ein aktuelles Backup.
- Die App hat absichtlich keinen Docker-Socket und keinen allgemeinen Zugriff
  auf den Home-Assistant-OS-Host.
