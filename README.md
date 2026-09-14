# Animacje-Resourcepack

Repozytorium resourcepacku do animowania tekstu w Minecraft Java Edition.

## Zawartość

| Plik | Opis |
|------|------|
| `Animacje100/` | Pełny source packa: 152 animacje, 3 generacje efektów (w tym fragmentowe: laser, holo, matrix, portal, xray, termowizja...), tutorial, 1000 przykładów, konwerter |
| `Animacje100.zip` | Gotowy do użycia zip resourcepacku |
| `Animacje-Datapack/` | Datapack (Minecraft 1.21.11) - animowany nick i hologramy |
| `Animacje-Datapack.zip` | Gotowy do użycia zip datapacku |
| `konwerter.py` | Konwerter `<animacja:wave>Test</animacja>` -> `/tellraw` |
| `Text_Effects.zip` | Oryginalny pack TheSalt's Text Effects (podstawa) |

## Animacje 100+ w skrócie

- **152 tagi** animacji, wszystkie animowane (zero efektów statycznych)
- 3 generacje efektów: klasyczne (1-100), blask/iskry/płomień (101-116), laser/holo/matrix/portal/xray/termowizja + tornado/wahadlo/harmonijka (117-152)
- Animuje cały pipeline tekstu: czat, tytuły, actionbar, tabliczki, manekiny, GUI (1.21.4+)
- Zero komentarzy w kodzie shaderów
- Łączenie efektów: 57+ gotowych kombinacji + własne w `_config.glsl` + segment `extra`
- README z **wszystkimi 152 rozkazami /tellraw**
- Datapack do nicka i hologramów (1.21.11)
- Wsparcie Minecraft 1.17+ (pack format 7-100) z overlayami dla 1.21.2, 1.21.6, 26.1, 26.2

Szybki start:

```
python3 konwerter.py "<animacja:wave>Test</animacja>"

/tellraw @a {"text": "Test", "color": "#F8F800"}
```

Nick z animacją (datapack, 1.21.11): `/function animacje:tag`

Szczegóły w `Animacje100/README.md` i `Animacje100/TUTORIAL.md`.

