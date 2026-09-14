# Animacje-Resourcepack

Repozytorium resourcepacku do animowania tekstu w Minecraft Java Edition.

## Zawartość

| Plik | Opis |
|------|------|
| `Animacje100/` | Pełny source packa: 100 animacji, 13 nowych efektów, tutorial, 1000 przykładów, konwerter tagów |
| `Animacje100.zip` | Gotowy do użycia zip resourcepacku |
| `konwerter.py` | Narzędzie konwertujące format `<animacja:wave>Test</animacja>` na gotowy rozkaz `/tellraw` |
| `Text_Effects.zip` | Oryginalny pack TheSalt's Text Effects, na którym oparto Animacje 100 |

## Animacje 100 w skrócie

- 100 tagów animacji w formacie `animacja:NAZWA`
- Zero komentarzy w kodzie shaderów
- Łączenie efektów: 37 gotowych kombinacji + własne w `_config.glsl` + nakładanie segmentów `extra`
- Tutorial z 100 przykładowymi tekstami (`TUTORIAL.md`) i plik 1000 przykładów (`PRZYKLADY_1000.md`)
- Wsparcie Minecraft 1.17+ (pack format 7-100) z overlayami dla 1.21.2, 1.21.6, 26.1, 26.2

Szybki start:

```
python3 konwerter.py "<animacja:wave>Test</animacja>"

/tellraw @a {"text": "Test", "color": "#F8F800"}
```

Szczegóły w `Animacje100/README.md` i `Animacje100/TUTORIAL.md`.

