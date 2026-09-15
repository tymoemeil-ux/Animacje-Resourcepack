# Animacje-Resourcepack

Repozytorium resourcepacku do animowania tekstu w Minecraft Java Edition.

## Zawartość

| Plik | Opis |
|------|------|
| `Animacje100/` | Pełny source: 150 animacji, 4 generacje efektów (neon_puls, szklo, zloty_blask, diamet, krew, piorun, galaktyka, tron, plazma...), tutorial, 1000 przykładów, konwerter |
| `Animacje100.zip` | Gotowy do użycia zip resourcepacku |
| `Animacje-Datapack/` | Datapack (1.21.11) - animowany nick i hologramy |
| `Animacje-Datapack.zip` | Gotowy zip datapacku |
| `konwerter.py` | Konwerter `<animacja:wave>Test</animacja>` -> `/tellraw` |
| `Text_Effects.zip` | Oryginalny pack TheSalt's Text Effects (podstawa) |

## Animacje 150 w skrócie

- **150 tagów**, wszystkie animowane, zero słabych efektów (48 najsłabszych usunięto)
- Najnowsza generacja: neon_puls, szklo, zloty_blask, diamet, krew, pianka, dym, piorun, radioaktywny, pulsar, galaktyka, tron, prizma, cukierek, ocean, czarna_dziura, mrozy, magma, plasma, aureola + karuzela, spirala, burza, titan, metronom, fala_3d, piorka
- Animuje cały pipeline tekstu: czat, tytuły, actionbar, tabliczki, manekiny, GUI (1.21.4+)
- **Rangi na serwerze**: prefixy LuckPerms z kolorami spustowymi = animowane rangi w czacie
- Zero komentarzy w kodzie shaderów
- README z **wszystkimi 150 rozkazami /tellraw**
- Wsparcie Minecraft 1.17-1.21.11 i 26.x (pack format 7-100)

Szybki start:

```
python3 konwerter.py "<animacja:tron>Neo</animacja>"
```

Ranga w LuckPerms:

```
/lp user <gracz> prefix set {"text":"[OP] ","color":"#D8D82C"}
```

Szczegóły w `Animacje100/README.md` i `Animacje100/TUTORIAL.md`.

