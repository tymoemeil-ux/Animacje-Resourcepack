# Animacje 100

Resourcepack z **100 animacjami tekstu** dla Minecraft Java Edition.

Napisz tekst w specjalnym kolorze, a client z włączonym packiem wyświetli go z animacją. Na serwerze i u graczy bez packa pozostaje zwykły tekst - animacja działa wyłącznie po stronie klienta.

> Nie jest kompatybilny z innymi packami nadpisującymi shader `rendertype_text`.

## Instalacja

1. Wrzuć folder `Animacje100` (lub plik `Animacje100.zip`) do `.minecraft/resourcepacks`
2. W opcjach gry włącz pack w sekcji `Pakiety zasobów`
3. Wpisuj kolory z tabeli poniżej w komendach typu `/tellraw` lub `/title`

## Szybki start

Fala na słowie Test:

```
/tellraw @a {"text":"Test","color":"#F8F800"}
```

Ten sam rozkaz możesz zapisać w formacie tagów i przekonwertować:

```
<animacja:wave>Test</animacja>
```

```
python3 konwerter.py "<animacja:wave>Test</animacja>"

/tellraw @a {"text": "Test", "color": "#F8F800"}
```

## 100 animacji

Kolor = tag. Każdy tag ma swój unikalny kolor spustowy.

| # | Tag | Kolor | Efekt |
|---|-----|-------|-------|
| 1 | `animacja:wave` | `#F8F800` | Fala podnosząca litery |
| 2 | `animacja:wave_big` | `#F8F804` | Wysoka fala |
| 3 | `animacja:wave_slow` | `#F8F808` | Wolna fala |
| 4 | `animacja:wave_fast` | `#F8F80C` | Szybka fala |
| 5 | `animacja:wave_soft` | `#F8F810` | Delikatna fala |
| 6 | `animacja:shake` | `#F8F814` | Losowe trzęsienie |
| 7 | `animacja:shake_fast` | `#F8F818` | Szybkie trzęsienie |
| 8 | `animacja:shake_mega` | `#F8F81C` | Mocne trzęsienie |
| 9 | `animacja:tremor` | `#F8F820` | Drobne drżenie |
| 10 | `animacja:rainbow` | `#F8F824` | Tęczowy przebieg kolorów |
| 11 | `animacja:rainbow_fast` | `#F8F828` | Szybka tęcza |
| 12 | `animacja:bouncy` | `#F8F82C` | Podskoki |
| 13 | `animacja:bouncy_high` | `#F8F830` | Wysokie podskoki |
| 14 | `animacja:blinking` | `#F8F834` | Miganie |
| 15 | `animacja:blink_slow` | `#F8F838` | Wolne miganie |
| 16 | `animacja:pulse` | `#F8F83C` | Pulsowanie |
| 17 | `animacja:pulse_big` | `#F8F840` | Duże pulsowanie |
| 18 | `animacja:heartbeat` | `#F8F844` | Uderzenia serca |
| 19 | `animacja:spin` | `#F8F848` | Obrót (przewracanie) |
| 20 | `animacja:spin_slow` | `#F8F84C` | Powolny obrót |
| 21 | `animacja:flip` | `#F8F850` | Przewracanie liter kolejno |
| 22 | `animacja:flip_fast` | `#F8F854` | Szybkie przewracanie liter |
| 23 | `animacja:fade` | `#F8F858` | Zanikanie i pojawianie |
| 24 | `animacja:breathe` | `#F8F85C` | Delikatny oddech |
| 25 | `animacja:flicker` | `#F8F860` | Szybkie migotanie |
| 26 | `animacja:jump` | `#F8F864` | Skoki liter kolejno |
| 27 | `animacja:glitch` | `#F8F868` | Glicz / losowe przesunięcia |
| 28 | `animacja:glitch_soft` | `#F8F86C` | Delikatny glicz |
| 29 | `animacja:big` | `#F8F870` | Powiększenie x1.5 |
| 30 | `animacja:huge` | `#F8F874` | Powiększenie x2.5 |
| 31 | `animacja:small` | `#F8F878` | Pomniejszenie x0.8 |
| 32 | `animacja:up` | `#F8F87C` | Przesunięcie w górę |
| 33 | `animacja:down` | `#F8F880` | Przesunięcie w dół |
| 34 | `animacja:float` | `#F8F884` | Unoszenie góra-dół |
| 35 | `animacja:sway` | `#F8F888` | Kołysanie na boki |
| 36 | `animacja:zigzag` | `#F8F88C` | Literki na zmianę w górę/dół |
| 37 | `animacja:wobble` | `#F8F890` | Chodzenie na zmianę |
| 38 | `animacja:fall` | `#F8F894` | Spadanie tekstu |
| 39 | `animacja:rise` | `#F8F898` | Wznoszenie tekstu |
| 40 | `animacja:orbit` | `#F8F89C` | Krążenie liter po okręgu |
| 41 | `animacja:drift` | `#F8F8A0` | Dryfowanie po przekątnej |
| 42 | `animacja:type` | `#F8F8A4` | Pisanie maszynowe |
| 43 | `animacja:erase` | `#F8F8A8` | Kasowanie liter kolejno |
| 44 | `animacja:gradient_gd` | `#F8F8AC` | Gradient zielony→żółty |
| 45 | `animacja:gradient_rb` | `#F8F8B0` | Gradient czerwony→niebieski |
| 46 | `animacja:gradient_anim` | `#F8F8B4` | Animowany gradient |
| 47 | `animacja:lava` | `#F8F8B8` | Płynąca lawa |
| 48 | `animacja:aurora` | `#F8F8BC` | Aurora (3 kolory) |
| 49 | `animacja:fire` | `#F8F8C0` | Ogień |
| 50 | `animacja:ice` | `#F8F8C4` | Lód |
| 51 | `animacja:gold` | `#F8F8C8` | Złoto |
| 52 | `animacja:split` | `#F8F8CC` | Rozdzielanie liter na pół |
| 53 | `animacja:outline` | `#F8F8D0` | Kontur wokół liter |
| 54 | `animacja:hatch` | `#F8F8D4` | Kreskowanie |
| 55 | `animacja:neon` | `#F8F8D8` | Neonowy blask |
| 56 | `animacja:neon_pink` | `#F8F8DC` | Różowy neon |
| 57 | `animacja:chroma` | `#F8F8E0` | Aberracja chromatyczna |
| 58 | `animacja:extrude` | `#F8F8E4` | 3D / cień głębokości |
| 59 | `animacja:extrude_deep` | `#F8F8E8` | Głębokie 3D |
| 60 | `animacja:noise` | `#F8F8EC` | Szum / statyczny |
| 61 | `animacja:liquid` | `#F8F8F0` | Płynna ciecz |
| 62 | `animacja:water` | `#F8F8F4` | Wypełnianie wodą |
| 63 | `animacja:water_tall` | `#F8F8F8` | Woda do góry (85%) |
| 64 | `animacja:wave_rainbow` | `#F0F000` | Fala + tęcza |
| 65 | `animacja:wave_neon` | `#F0F004` | Fala + neon |
| 66 | `animacja:wave_aurora` | `#F0F008` | Fala + aurora |
| 67 | `animacja:wave_fire` | `#F0F00C` | Fala + ogień |
| 68 | `animacja:wave_ice` | `#F0F010` | Fala + lód |
| 69 | `animacja:wave_gold` | `#F0F014` | Fala + złoto |
| 70 | `animacja:shake_rainbow` | `#F0F018` | Trzęsienie + tęcza |
| 71 | `animacja:shake_neon` | `#F0F01C` | Trzęsienie + neon |
| 72 | `animacja:shake_glitch` | `#F0F020` | Trzęsienie + glicz |
| 73 | `animacja:bouncy_rainbow` | `#F0F024` | Podskoki + tęcza |
| 74 | `animacja:bouncy_neon` | `#F0F028` | Podskoki + różowy neon |
| 75 | `animacja:bouncy_fire` | `#F0F02C` | Podskoki + ogień |
| 76 | `animacja:pulse_rainbow` | `#F0F030` | Pulsowanie + tęcza |
| 77 | `animacja:pulse_gold` | `#F0F034` | Pulsowanie + złoto |
| 78 | `animacja:heartbeat_neon` | `#F0F038` | Serce + neon |
| 79 | `animacja:spin_rainbow` | `#F0F03C` | Obrót + tęcza |
| 80 | `animacja:spin_neon` | `#F0F040` | Obrót + neon |
| 81 | `animacja:flip_aurora` | `#F0F044` | Przewracanie + aurora |
| 82 | `animacja:fade_rainbow` | `#F0F048` | Zanikanie + tęcza |
| 83 | `animacja:float_rainbow` | `#F0F04C` | Unoszenie + tęcza |
| 84 | `animacja:float_neon` | `#F0F050` | Unoszenie + neon |
| 85 | `animacja:sway_ice` | `#F0F054` | Kołysanie + lód |
| 86 | `animacja:zigzag_bouncy` | `#F0F058` | Zigzag + podskoki |
| 87 | `animacja:wobble_rainbow` | `#F0F05C` | Chodzenie + tęcza |
| 88 | `animacja:orbit_rainbow` | `#F0F060` | Krążenie + tęcza |
| 89 | `animacja:drift_ice` | `#F0F064` | Dryfowanie + lód |
| 90 | `animacja:type_neon` | `#F0F068` | Pisanie + neon |
| 91 | `animacja:erase_glitch` | `#F0F06C` | Kasowanie + glicz |
| 92 | `animacja:glitch_chroma` | `#F0F070` | Glicz + aberracja |
| 93 | `animacja:lava_shake` | `#F0F074` | Lawa + trzęsienie |
| 94 | `animacja:lava_extrude` | `#F0F078` | Lawa + 3D |
| 95 | `animacja:water_wave` | `#F0F07C` | Woda + fala |
| 96 | `animacja:liquid_neon` | `#F0F080` | Ciecz + neon |
| 97 | `animacja:noise_glitch` | `#F0F084` | Szum + glicz |
| 98 | `animacja:split_shake` | `#F0F088` | Rozdzielanie + trzęsienie |
| 99 | `animacja:outline_bouncy` | `#F0F08C` | Kontur + podskoki |
| 100 | `animacja:mega` | `#F0F090` | Fala + trzęsienie + tęcza |

## Łączenie efektów

Tagi od 64 do 100 to gotowe kombinacje dwóch (a `mega` trzych) efektów.

Własne kombinacje dodasz w pliku `assets/minecraft/shaders/include/_config.glsl`:

```
TEXT_EFFECT_WITH_SHADOW(rgb(248, 244, 248)) {
    apply_wavy();
    apply_rainbow();
    apply_neon(rgb(80, 220, 255), 1.5);
}
```

Po zmianie pliku zrestartuj grę (lub przeładuj paczki zasobów).

Można też nakładać dwa efekty jednym rozkazem przez segment `extra` - drugi segment renderuje się w tym samym miejscu na wierzchu:

```
/tellraw @a {"text":"Test","color":"#F8F800","extra":[{"text":"Test","color":"#F0F004"}]}
```

## Przykłady

- 100 gotowych rozkazów: `TUTORIAL.md`
- 1000 gotowych rozkazów: `PRZYKLADY_1000.md`

## Wersje

Pack format 7-100 (Minecraft 1.17 i nowsze). Overlady dla 1.21.2, 1.21.6, 26.1 i 26.2.

## Licencja

MIT. Pack oparty na TheSalt's Text Effects (MIT, TheSalt). Szczegóły w `LICENSE`.

