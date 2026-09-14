# Animacje-Resourcepack

Repozytorium resourcepacku do animowania tekstu w Minecraft Java Edition.

## Zawartość

| Plik | Opis |
|------|------|
| `Animacje100/` | Pełny source packa: 116 animacji, 9 nowych efektów (blask, iskry, płomień, popcorn, eksplozja, winda, deszcz, mrugacz, skoczki), tutorial, 1000 przykładów, konwerter tagów |
| `Animacje100.zip` | Gotowy do użycia zip resourcepacku |
| `Animacje-Datapack/` | Datapack (Minecraft 1.21.11) - animowany nick i hologramy z animacjami |
| `Animacje-Datapack.zip` | Gotowy do użycia zip datapacku |
| `konwerter.py` | Narzędzie konwertujące format `<animacja:wave>Test</animacja>` na gotowy rozkaz `/tellraw` |
| `Text_Effects.zip` | Oryginalny pack TheSalt's Text Effects, na którym oparto Animacje 100+ |

## Animacje 100+ w skrócie

- 116 tagów animacji w formacie `animacja:NAZWA` (100 klasycznych + 16 nowej generacji)
- Nowa generacja efektów: `blask` (błysk po literach), `iskry` (iskierki), `plomien` (płomienie), `popcorn`, `eksplozja`, `winda`, `deszcz`, `mrugacz`, `skoczki`
- Zero komentarzy w kodzie shaderów
- Łączenie efektów: 37 gotowych kombinacji + własne w `_config.glsl` + nakładanie segmentów `extra`
- Tutorial z 116 przykładowymi tekstami (`TUTORIAL.md`) i plik 1000 przykładów (`PRZYKLADY_1000.md`)
- README z **wszystkimi 116 rozkazami /tellraw**
- Datapack do animacji na nickname'ach i hologramach (1.21.11)
- Wsparcie Minecraft 1.17+ (pack format 7-100) z overlayami dla 1.21.2, 1.21.6, 26.1, 26.2

Szybki start:

```
python3 konwerter.py "<animacja:wave>Test</animacja>"

/tellraw @a {"text": "Test", "color": "#F8F800"}
```

Nick z animacją (datapack, 1.21.11): `/function animacje:tag`

Szczegóły w `Animacje100/README.md` i `Animacje100/TUTORIAL.md`.
