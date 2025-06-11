#!/bin/bash

LOG_COUNT=100
ERROR_COUNT=100

case "$1" in
  --date | -d)
    echo "Dzisiejsza data: $(date)"
    ;;
  --help | -h)
    echo "Dostępne opcje:"
    echo "  --date / -d             Wyświetla dzisiejszą datę"
    echo "  --help / -h             Wyświetla tę pomoc"
    echo "  --logs [n] / -l [n]     Tworzy pliki logx.txt (domyślnie 100)"
    echo "  --error [n] / -e [n]    Tworzy foldery errorX z plikiem errorX.txt (domyślnie 100)"
    ;;
  --logs | -l)
    [[ "$2" =~ ^[0-9]+$ ]] && LOG_COUNT=$2
    for ((i=1; i<=LOG_COUNT; i++)); do
      FILENAME="log${i}.txt"
      echo "Nazwa pliku: $FILENAME" > "$FILENAME"
      echo "Skrypt: skrypt.sh" >> "$FILENAME"
      echo "Data: $(date)" >> "$FILENAME"
    done
    echo "Utworzono $LOG_COUNT plików logx.txt"
    ;;
  --error | -e)
    [[ "$2" =~ ^[0-9]+$ ]] && ERROR_COUNT=$2
    for ((i=1; i<=ERROR_COUNT; i++)); do
      DIR="error${i}"
      mkdir -p "$DIR"
      echo "Plik błędu: error${i}.txt" > "$DIR/error${i}.txt"
      echo "Skrypt: skrypt.sh" >> "$DIR/error${i}.txt"
      echo "Data: $(date)" >> "$DIR/error${i}.txt"
    done
    echo "Utworzono $ERROR_COUNT folderów errorX/"
    ;;
  *)
    echo "Nieznana opcja. Użyj --help lub -h, aby zobaczyć dostępne opcje."
    ;;
esac
