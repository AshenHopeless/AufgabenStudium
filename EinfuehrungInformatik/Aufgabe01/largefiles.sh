#!/bin/bash

# Durchsuche das aktuelle Verzeichnis nach Dateien, die größer als 500 KB sind.
find . -type f -size +500k -exec ls -lh {} \;

