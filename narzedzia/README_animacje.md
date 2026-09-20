# Animacje 3.0 — Top 50

Aktualny pack tekstowych shaderów to `Animacje3.0/` + `Animacje3.0.zip`.
Zawiera dokładnie 50 efektów (46 wybranych z poprzedniej wersji i 4 nowe: `kometa`,
`iskry`, `pryzmat`, `szklo`). Plugin v2 korzysta z identycznego `effects.json`.

## Użycie

```bash
python3 ../Animacje3.0/konwerter.py --lista
python3 ../Animacje3.0/konwerter.py '<animacja:kometa>Hej!</animacja>'
```

Konwerter zamienia tagi na `/tellraw @a` z kolorem spustowym. Widz musi mieć aktywny
`Animacje3.0.zip`; bez packa zobaczy tylko kolor triggera.

## Budowanie

```bash
cd ..
python3 narzedzia/generuj_v3.py
cd plugin
./build.sh
```

Generator kopiuje tylko wybrane pary VSH/FSH, buduje dispatch 1–50 i odświeża
`plugin/res/fx_katalog.json`. Nie uruchamiaj dwóch wersji tego packa jednocześnie,
bo każda nadpisuje `rendertype_text`.
