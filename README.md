# Animacje-Resourcepack

Repozytorium resourcepacku do animowania tekstu w Minecraft Java Edition.

## Zawartość

| Plik | Opis |
|------|------|
| `Animacje100/` | Pełny source: 140 animacji, 5 generacji efektów (blysk, smuga, serce, snieg, neonfala, gwiazdy + neon_puls, galaktyka, tron, plasma, aureola...), tutorial, 1000 przykładów, konwerter |
| `Animacje100.zip` | Gotowy do użycia zip resourcepacku |
| `Animacje-Datapack/` | Datapack (1.21.11) - animowany nick i hologramy |
| `Animacje-Datapack.zip` | Gotowy zip datapacku |
| `konwerter.py` | Konwerter `<animacja:wave>Test</animacja>` -> `/tellraw` |
| `Text_Effects.zip` | Oryginalny pack TheSalt's Text Effects (podstawa) |

## Animacje 140 w skrócie

- **140 tagów**, wszystkie mocne i animowane (53 słabe usunięto, 43 nowe dodano)
- Najnowsza generacja: **blysk**, smuga, iskrenice, teczafala, serce, kula, luk, mglawica, snieg, refleks, kaskada, neonfala, perla, zar, firerain, kolumna, laser2, odlamki, grzmot, swiatlo, obrys, gwiazdy + elastyk, zel, skok, fala2, orbit2, grzmot_w, tsunami, ekspres, tectno + mega_blysk
- Animuje cały pipeline tekstu: czat, tytuły, actionbar, tabliczki, manekiny, GUI (1.21.4+)
- **Rangi na serwerze**: prefixy LuckPerms z kolorami spustowymi = animowane rangi w czacie
- Zero komentarzy w kodzie shaderów
- README z **wszystkimi 140 rozkazami /tellraw**
- Wsparcie Minecraft 1.17-1.21.11 i 26.x (pack format 7-100)

Szybki start:

```
python3 konwerter.py "<animacja:blysk>Błysk</animacja>"
```

Ranga w LuckPerms:

```
/lp user <gracz> prefix set {"text":"[OP] ","color":"#D0D000"}
```

Szczegóły w `Animacje100/README.md` i `Animacje100/TUTORIAL.md`.

