#!/bin/sh

clear
echo "======================================================"
echo " ███    ███ ███████ ██    ██ ██    ██  ██████  "
echo " ████  ████ ██       ██  ██  ██    ██ ██    ██ "
echo " ██ ████ ██ █████     ████   ██    ██ ██    ██ "
echo " ██  ██  ██ ██         ██    ██    ██ ██    ██ "
echo " ██      ██ ███████    ██     ██████   ██████  "
echo "                                                  "
echo "      M3U8 Stream Downloader → MP4 via FFmpeg"
echo ""
echo "      Author   : Felix Schmitt"
echo "      Version  : 1.0"
echo "      Copyright: (c) 2025 SchmittDEV"
echo "      License  : MIT"
echo "======================================================"
echo ""

# ▶️ Benutzer nach Eingaben fragen
printf "🎯 Bitte gib die URL des M3U8-Streams ein:\n> "
read STREAM_URL

if [ -z "$STREAM_URL" ]; then
    echo "❌ Keine URL eingegeben. Vorgang abgebrochen."
    exit 1
fi

printf "\n💾 Wie soll die Ausgabedatei heißen (ohne .mp4)?\n> "
read OUTPUT_NAME

if [ -z "$OUTPUT_NAME" ]; then
    echo "❌ Kein Dateiname angegeben. Vorgang abgebrochen."
    exit 1
fi

# 🧼 Unerlaubte Zeichen aus Dateinamen entfernen (optional)
OUTPUT_NAME=$(echo "$OUTPUT_NAME" | tr -cd '[:alnum:] ._-')

# ▶️ Zielpfad festlegen
OUTPUT_PATH="/volume1/video/${OUTPUT_NAME}.mp4"

# ▶️ FFmpeg starten
echo ""
echo "⏳ Starte Download und Konvertierung..."
ffmpeg -i "$STREAM_URL" -c copy "$OUTPUT_PATH"

# ▶️ Abschlussmeldung
if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Erfolg! Die Datei wurde gespeichert unter:"
    echo "$OUTPUT_PATH"
else
    echo ""
    echo "❌ Fehler beim Download oder während der Umwandlung."
fi
