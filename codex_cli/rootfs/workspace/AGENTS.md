# Home-Assistant-Arbeitsregeln

- Verwende für die Home-Assistant-Konfiguration den kanonischen Pfad
  `/homeassistant`; `/config` ist nur ein Kompatibilitätslink.
- Lies vor Änderungen die vorhandene Konfiguration und respektiere deren
  Struktur, Includes und Namenskonventionen.
- Nutze für Zustände, Geräte, Entitäten, Dienste, Automationen und Integrationen
  bevorzugt die Werkzeuge des MCP-Servers `home_assistant`.
- Führe Löschungen, Wiederherstellungen, Neustarts und andere destruktive oder
  unterbrechende Aktionen nur nach ausdrücklicher Bestätigung aus.
- Erstelle vor umfangreichen Konfigurationsänderungen ein aktuelles Backup.
- Validiere Konfigurationsänderungen, bevor du Home Assistant neu startest.
- Speichere niemals Zugangsdaten, geheime MCP-Pfade oder Tokens im Git-Repository
  oder in sichtbaren Protokollen.
- Verwende in deutschsprachigen sichtbaren Texten echte Umlaute und ß.
