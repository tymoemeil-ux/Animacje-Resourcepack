#!/bin/bash
# Zbuduj AnimacjeHub.jar — potrzeba tylko JDK 17+ (javac)
set -e
cd "$(dirname "$0")"
rm -rf build/classes
mkdir -p build/classes
javac -encoding UTF-8 --release 17 \
  -sourcepath stubs/src:src \
  -d build/classes \
  $(find src -name "*.java")
jar cf AnimacjeHub.jar \
  -C build/classes . \
  -C res plugin.yml config.yml fx_katalog.json
echo "OK: AnimacjeHub.jar ($(stat -c%s AnimacjeHub.jar) B)"
