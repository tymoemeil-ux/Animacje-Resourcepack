# Animacje-Resourcepack

Repozytorium resourcepacków do animowania tekstu w Minecraft Java Edition.

## Wersje

| Plik | Opis |
|------|------|
| `Animacje2.0/` + `Animacje2.0.zip` | **AKTUALNA (2.0)**: nowy silnik od zera — **25 animowanych efektów + 11 czystych kolorów**, każdy efekt w osobnym pliku |
| `Animacje1.0/` + `Animacje1.0.zip` | Archiwum (1.0): pełne 140 animacji |
| `Animacje-Datapack/` + `Animacje-Datapack.zip` | Datapack (1.21.11) — animowany nick i hologramy |
| `konwerter.py` | `<animacja:blysk>Test</animacja>` → gotowy `/tellraw` (wersja 2.0) |
| `Text_Effects.zip` | Oryginalny pack TheSalt's Text Effects (referencja) |

## Animacje 2.0 — nowy silnik (przebudowa od zera)

- **25 efektów animowanych** — wszystkie wyraźnie animowane (zero subtelnych):
  - **fragmentowe (13):** blysk, neonfala, teczafala, kaskada, laser2, grzmot, obrys, neon, neon_puls, zloty_blask, galaktyka, krew, piorun
  - **kinetyczne (12):** wave, wave_big, rainbow, glitch_hard, tsunami, karuzela, tornado, bumper, pulse, heartbeat, flicker, shake
- **11 czystych kolorów** (bez animacji): czerwony, zielony, niebieski, zolty, pomaranczowy, fioletowy, rozowy, cyjan, bialy, szary, brazowy
- **Każdy efekt = osobny plik** (`tfx_<nazwa>.vsh` + `tfx_<nazwa>.fsh`)
- Jedna wspólna, mała warstwa silnika (`tfx_common.*`) — detekcja koloru spustowego + dispatch
- **Nowe kolory spustowe** bez kolizji z 1.0: fragmentowe `#A0A0xx`, kinetyczne — jaskrawe kolory (tekst widoczny w czacie)
- Poprawione spójne pary shaderów dla wszystkich wersji (1.20.5 → 26.2)

## Szybki start

```
1. Wrzuć Animacje2.0.zip do .minecraft/resourcepacks i włącz go (TYLKO JEDEN pack animacji!)
2. python3 konwerter.py "Hej <animacja:blysk>SWIAT</animacja>!"
3. Wklej wynik do chatu/konsoli
```

Domyślny format rozkazów = **SNBT** (Minecraft 1.21.5+). Dla starszych serwerów: `python3 konwerter.py --json "..."`.

## Walidacja

- Macierz: **54/54** plików shaderów przechodzi pełną analizę semantyczną (glslang 11.7.0, warianty 1.20.5→26.2 + kombinacje define'ów 26.x)
- **22/22** pary vsh↔fsh spójne interfejsowo (nazwy + typy)
