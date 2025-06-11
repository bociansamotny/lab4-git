#!/bin/bash

LOG_COUNT=100  # domyślna liczba plików log

case "$1" in
  --date | -d)
    echo "Dzisiejsza data: $(date)"
    ;;
  --help | -h)
    echo "Dostępne opcje:"
    echo "  --date / -d        Wyświetla dzisiejszą datę"
    echo "  --help / -h        Wyświetla tę pomoc"
    echo "  --logs [n] / -l [n]  Tworzy pliki logx.txt (domyślnie 100)"
    ;;
  --logs | -l)
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
    echo "Nieznana opcja. Użyj --help lub -h, aby zobaczyć dostępne opcje."
    ;;
esac
