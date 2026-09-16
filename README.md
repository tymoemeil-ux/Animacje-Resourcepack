# Animacje-Resourcepack

Repozytorium resourcepacków do animowania tekstu w Minecraft Java Edition.

## Wersje

| Plik | Opis |
|------|------|
| `Animacje2.0/` + `Animacje2.0.zip` | **AKTUALNA (2.0)**: nowy silnik od zera — **279 animowanych efektów + 11 czystych kolorów**, każdy efekt w osobnym pliku |
| `Animacje1.0/` + `Animacje1.0.zip` | Archiwum (1.0): pełne 140 animacji |
| `Animacje-Datapack/` + `Animacje-Datapack.zip` | Datapack (1.21.11) — animowany nick i hologramy |
| `konwerter.py` | `<animacja:blysk>Test</animacja>` → gotowy `/tellraw` (wersja 2.0) |
| `Text_Effects.zip` | Oryginalny pack TheSalt's Text Effects (referencja) |

## Animacje 2.0 — nowy silnik (przebudowa od zera)

- **279 efektów animowanych** — wszystkie wyraźnie animowane (zero subtelnych); pełna lista: `python3 narzedzia/konwerter.py --lista`
  - jaskrawe (fragmentowe/kinetyczne): blysk, neonfala, teczafala, kaskada, laser2, grzmot, neon, galaktyka, piorun, rainbow, glitch_hard, tsunami, karuzela, tornado, pulse, heartbeat, shake, ...
  - hybrydy i ruchy: tancuj, lawina, dym, helikopter, spirala, wibrowanie, zygzak_v2, skakosz, wahadlo, ...
  - serie tematyczne: neon (18), kruszce i kamienie (15), łączenia (40), ruchy 156-205, seria hakerska (10) + **partia 216-280: lampa, laser, fala2, skaner, gwiazdy, pulsar, drganie, skok, wahadlo, wir, kap, dryf, matrix (13 rodzin × 5)**
- **11 czystych kolorów** (bez animacji): czerwony, zielony, niebieski, zolty, pomaranczowy, fioletowy, rozowy, cyjan, bialy, szary, brazowy
- **Każdy efekt = osobny plik** (`tfx_<nazwa>.vsh` + `tfx_<nazwa>.fsh`)
- Jedna wspólna, mała warstwa silnika (`tfx_common.*`) — detekcja koloru spustowego + dispatch
- **Nowe kolory spustowe** bez kolizji z 1.0: fragmentowe `#A0A0xx`, kinetyczne — jaskrawe kolory (tekst widoczny w czacie)
- Architektura „baza = najnowsze API”: **baza = 1.21.6+ (GLSL 330, nowy API mgle)** — ładowana zawsze (m.in. 1.21.11); overlay `old/` (GLSL 150, stary API) przez `overlays` w pack.mcmeta dla 1.20.2–1.21.5

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

- **Baza (330) × PRAWDZIWY API 1.21.11: 8/8 OK** + **8/8 OK z `IS_GUI`** (pipeline `gui_text`) — na 1.21.11 ładowana bezpośrednio z bazy, niezależnie od wariantów
- Overlay `old/` (150) × API 1.21.5: **8/8 OK**
- Stare szadery 150 × API 1.21.11: **4× FAIL `'FogColor' redefinition`** — powiela dokładnie błąd z loga 1.21.11
  (dlatego stary API przeniesiony do overlaya `old/` tylko dla ≤1.21.5)
- **8/8** par vsh↔fsh spójnych interfejsowo (nazwy + typy)
