# Animacje 3.1 — Top 85

Aktualny pack tekstowych shaderów to `Animacje3.0/` + `Animacje3.0.zip`.
Zawiera dokładnie 85 efektów: 50 bazowych, 25 nowych premium i 10 hakerskich.
Plugin v2.1 korzysta z identycznego `effects.json`.

## Użycie

```bash
python3 ../Animacje3.0/konwerter.py --lista
python3 ../Animacje3.0/konwerter.py '<animacja:kometa>Hej!</animacja>'
python3 ../Animacje3.0/konwerter.py '<animacja:hack_matrix>ACCESS GRANTED</animacja>'
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

Generator buduje dispatcher 1–85, odświeża `plugin/res/fx_katalog.json` i tworzy ZIP.
Nie uruchamiaj dwóch wersji tego packa jednocześnie, bo każda nadpisuje `rendertype_text`.
