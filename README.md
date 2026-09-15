# Animacje-Resourcepack

Repozytorium resourcepacków do animowania tekstu w Minecraft Java Edition.

## Wersje

| Plik | Opis |
|------|------|
| `Animacje2.0/` + `Animacje2.0.zip` | **AKTUALNA (2.0)**: 25 mocnych animacji, wszystkie wyraźnie animowane, osobny pack |
| `Animacje1.0/` + `Animacje1.0.zip` | Archiwum (1.0): pełne 140 animacji, tutorial, mega komendy, 1000 przykładów |
| `Animacje-Datapack/` + `Animacje-Datapack.zip` | Datapack (1.21.11) - animowany nick i hologramy |
| `konwerter.py` | Konwerter `<animacja:blysk>Test</animacja>` -> `/tellraw` (wersja 2.0) |
| `Text_Effects.zip` | Oryginalny pack TheSalt's Text Effects (podstawa) |

## Animacje 2.0 w skrócie

- **25 tagów**, wszystkie mocno animowane (zero subtelnych), nowe kolory spustowe `#A0A0xx`
- Błyski i neon: blysk, neonfala, teczafala, kaskada, laser2, grzmot, obrys, neon, neon_puls, zloty_blask, galaktyka, krew, piorun
- Ruchy: wave, wave_big, rainbow, glitch_hard, tsunami, karuzela, tornado, bumper, pulse, heartbeat, flicker, shake
- Kompilacja shaderów: 34/34 OK (glslang 11.7.0, wszystkie warianty 1.21-26.2)
- Wsparcie Minecraft 1.17-1.21.11 i 26.x (pack format 7-100)

Szybki start (2.0):

```
python3 konwerter.py "<animacja:blysk>Błysk</animacja>"
```

Ranga w LuckPerms (kolor z 2.0):

```
/lp user <gracz> prefix set {"text":"[OP] ","color":"#A0A000"}
```

Szczegóły: `Animacje2.0/README.md` i `Animacje2.0/KOMENDY.md`. Wersja 1.0 (140 animacji): `Animacje1.0/README.md`.
