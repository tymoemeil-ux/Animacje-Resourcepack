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
- Dwa warianty shaderów: baza (1.20.2–1.21.5, GLSL 150) + `63/` (1.21.6–1.21.11, GLSL 330, nowy API mgle)

## Szybki start

```
1. Wrzuć Animacje2.0.zip do .minecraft/resourcepacks i włącz go (TYLKO JEDEN pack animacji!)
2. python3 konwerter.py "Hej <animacja:blysk>SWIAT</animacja>!"
3. Wklej wynik do chatu/konsoli
```

Domyślny format rozkazów = **SNBT** (Minecraft 1.21.5+). Dla starszych serwerów: `python3 konwerter.py --json "..."`.

## Walidacja

Macierz kompilacji (glslang 11.7.0) na **prawdziwych vanilla include'ach 1.21.11**
(pobrane z oficjalnych assetów: `fog.glsl`, `dynamictransforms.glsl`, `projection.glsl`, `globals.glsl`):

- **Wariant `63/` × API 1.21.11: 8/8 OK** (4 pary vsh/fsh) + **8/8 OK z `IS_GUI`** (pipeline `gui_text`)
- Baza × API 1.21.5 (stary `fog.glsl`): **8/8 OK**
- Baza × API 1.21.11: **4× FAIL `'FogColor' redefinition`** — powiela dokładnie błąd z loga 1.21.11
  (dowód, że stary wariant nie działał na 1.21.6+ i wariant `63/` był potrzebny)
- **8/8** par vsh↔fsh spójnych interfejsowo (nazwy + typy)
