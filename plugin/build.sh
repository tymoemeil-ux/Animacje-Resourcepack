#!/usr/bin/env bash
# Buduje AnimacjeHub v2 bez zależności od lokalnego Paper/LuckPerms.
set -euo pipefail
cd "$(dirname "$0")"
if ! command -v javac >/dev/null 2>&1; then
  echo "Brak javac — zainstaluj JDK 17+ przed budowaniem." >&2
  exit 1
fi
rm -rf build/classes build/stage AnimacjeHub.jar
mkdir -p build/classes build/stage

mapfile -t SOURCES < <(find src -name '*.java' -print | sort)
javac -encoding UTF-8 --release 17 \
  -sourcepath stubs/src:src \
  -d build/classes \
  "${SOURCES[@]}"

cp -r build/classes/dev build/stage/
jar cfm AnimacjeHub.jar res/manifest.txt \
  -C build/stage . \
  -C res plugin.yml \
  -C res config.yml \
  -C res fx_katalog.json

printf 'OK: AnimacjeHub.jar (%s B)\n' "$(stat -c%s AnimacjeHub.jar)"
