# Projekt ZEITRISS v10.1

Interaktive Lern- und Simulations-App zum Ersten Weltkrieg für die 9. Klasse.

## Hauptfunktionen

- Kriegssimulation 1914–1918
- Escape-Room mit 3 Räumen, 6 Beweisen und 6 Akten
- verpflichtender Spielername
- eigene lokale Bestenlisten-Seite mit Modusfilter, Rekorden und Namensverwaltung
- Quiz, Europakarte, Quellenanalyse, Nachrichtenticker und Codes
- XP, Ränge und Abzeichen

## Lokal starten

Unter Windows `STARTEN.bat` doppelklicken.

## Auf GitHub hochladen

1. Neues leeres Repository erstellen.
2. Den **Inhalt** dieses Ordners in die Wurzel des Repositorys hochladen.
3. Darauf achten, dass `index.html` und `render.yaml` direkt im Hauptverzeichnis liegen.
4. Änderungen committen.

## Auf Render veröffentlichen

1. In Render `New` > `Blueprint` wählen.
2. Das GitHub-Repository verbinden.
3. Render erkennt `render.yaml`.
4. Blueprint bestätigen und Deployment abwarten.

Alternativ als Static Site:

- Build Command: leer oder `echo no-build`
- Publish Directory: `.`

## Bestenliste

Die enthaltene Bestenliste speichert Ergebnisse im jeweiligen Browser. Für eine weltweite Bestenliste wird zusätzlich ein Backend mit Datenbank benötigt. Spielername, Modus und Punktzahl sind bereits als Datenmodell vorbereitet.

## Datenschutz

Spieler sollen keine vollständigen echten Namen verwenden.
