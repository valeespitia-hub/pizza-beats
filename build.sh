#!/usr/bin/env bash
# Prepara la carpeta dist/ para publicar en Render (Static Site).
# web/index.html no trae <!doctype>, <head> ni <body> porque la versión de claude.ai los agrega sola;
# aquí se los ponemos para que cualquier navegador la muestre en modo estándar.
set -euo pipefail
rm -rf dist
mkdir -p dist
cp web/modelo.js web/dj.png dist/
{
  printf '<!doctype html>\n<html lang="es">\n<head>\n<meta charset="utf-8">\n'
  printf '<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n'
  printf '<style>:root{padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}body{margin:0}img{max-width:100%%}[hidden]{display:none!important}</style>\n'
  printf '</head>\n<body>\n'
  cat web/index.html
  printf '\n</body>\n</html>\n'
} > dist/index.html
echo "dist/ listo: $(ls dist | tr '\n' ' ')"
