#!/bin/bash

case "$1" in
  --date)
    echo "Dzisiejsza data: $(date)"
    ;;
  --help)
    echo "Dostępne opcje:"
    echo "  --date        Wyświetla dzisiejszą datę"
    echo "  --help        Wyświetla tę pomoc"
    ;;
  *)
    echo "Nieznana opcja. Użyj --help, aby zobaczyć dostępne opcje."
    ;;
esac
