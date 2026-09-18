#!/bin/bash
# Zbuduj AnimacjeHub.jar — potrzeba tylko JDK 17+ (javac + jar)
set -e
cd "$(dirname "$0")"
rm -rf build/classes build/stage AnimacjeHub.jar
mkdir -p build/classes
javac -encoding UTF-8 --release 17 \
  -sourcepath stubs/src:src \
  -d build/classes \
  $(find src -name "*.java")
# tylko dev/ do jarze (stubs org/bukkit i net/luckperms sa tylko po to, zeby sie skompilowalo)
mkdir -p build/stage
cp -r build/classes/dev build/stage/
jar cfm AnimacjeHub.jar res/manifest.txt \
  -C build/stage . \
  -C res plugin.yml \
  -C res config.yml \
  -C res fx_katalog.json
echo "OK: AnimacjeHub.jar ($(stat -c%s AnimacjeHub.jar) B)"
