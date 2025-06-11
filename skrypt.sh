#!/bin/bash

LOG_COUNT=100  # domyślna liczba plików log

case "$1" in
  --date)
    echo "Dzisiejsza data: $(date)"
    ;;
  --help)
    echo "Dostępne opcje:"
    echo "  --date            Wyświetla dzisiejszą datę"
    echo "  --help            Wyświetla tę pomoc"
    echo "  --logs [liczba]   Tworzy pliki logx.txt (domyślnie 100)"
    ;;
  --logs)
    if [[ -n "$2" && "$2" =~ ^[0-9]+$ ]]; then
      LOG_COUNT=$2
    fi
    for ((i=1; i<=LOG_COUNT; i++)); do
      FILENAME="log${i}.txt"
      echo "Nazwa pliku: $FILENAME" > "$FILENAME"
      echo "Skrypt: skrypt.sh" >> "$FILENAME"
      echo "Data: $(date)" >> "$FILENAME"
    done
    echo "Utworzono $LOG_COUNT plików logx.txt"
    ;;
  *)
    echo "Nieznana opcja. Użyj --help, aby zobaczyć dostępne opcje."
    ;;
esac
