# Tutorial - Animacje 100

## 1. Co to jest

Animacje 100 to resourcepack, który animuje tekst w czacie, na tytułach i actionbarze. Animacja wyzwalana jest kolorem tekstu - każdy z 100 tagów ma swój unikalny kolor spustowy. Serwer zawsze widzi i zapisuje zwykły tekst z kolorem, animację renderuje tylko client z włączonym packiem.

## 2. Instalacja

1. Skopiuj `Animacje100.zip` do `.minecraft/resourcepacks`
2. Opcje - Interfejs i grafik - Pakiety zasobów - włącz `Animacje 100`
3. Upewnij się, że żaden inny pack nie nadpisuje shaderów tekstu

## 3. Pierwsza animacja

Tag `animacja:wave` ma kolor `#F8F800`. Rozkaz:

```
/tellraw @a {"text":"Test","color":"#F8F800"}
```

Client z packiem: słowo Test faluje. Serwer i klienci bez packa: zwykły żółtawy tekst.

## 4. Format <animacja:...>

Żeby nie pamiętać kolorów, użyj konwertera. Format:

```
<animacja:NAZWA>tekst</animacja>
```

Przykład:

```
python3 konwerter.py "<animacja:wave>Test</animacja>"

/tellraw @a {"text": "Test", "color": "#F8F800"}
```

Skopiuj wynik do czatu. Konwerter obsługuje kilka tagów i zwykły tekst naraz:

```
python3 konwerter.py "Zwykły tekst <animacja:rainbow>tęcza</animacja> i <animacja:neon>neon</animacja>"

/tellraw @a {"text": "", "extra": [{"text": "Zwykły tekst "}, {"text": "tęcza", "color": "#F8F824"}, {"text": " i "}, {"text": "neon", "color": "#F8F8D8"}]}
```

## 5. Wszystkie 100 przykładowych tekstów

Każdy rozkaz możesz skopiować i wkleić do czatu.

| # | Tag | Kolor | Rozkaz |
|---|-----|-------|--------|
| 1 | `animacja:wave` | `#F8F800` | `/tellraw @a {"text":"Witaj w świecie","color":"#F8F800"}` |
| 2 | `animacja:wave_big` | `#F8F804` | `/tellraw @a {"text":"Animacje działają","color":"#F8F804"}` |
| 3 | `animacja:wave_slow` | `#F8F808` | `/tellraw @a {"text":"To jest test tekstu","color":"#F8F808"}` |
| 4 | `animacja:wave_fast` | `#F8F80C` | `/tellraw @a {"text":"Minecraft jest świetny","color":"#F8F80C"}` |
| 5 | `animacja:wave_soft` | `#F8F810` | `/tellraw @a {"text":"Super serwer","color":"#F8F810"}` |
| 6 | `animacja:shake` | `#F8F814` | `/tellraw @a {"text":"Gramy dalej","color":"#F8F814"}` |
| 7 | `animacja:shake_fast` | `#F8F818` | `/tellraw @a {"text":"Kliknij i zagraj","color":"#F8F818"}` |
| 8 | `animacja:shake_mega` | `#F8F81C` | `/tellraw @a {"text":"Do zobaczenia","color":"#F8F81C"}` |
| 9 | `animacja:tremor` | `#F8F820` | `/tellraw @a {"text":"Nowa przygoda","color":"#F8F820"}` |
| 10 | `animacja:rainbow` | `#F8F824` | `/tellraw @a {"text":"Legendarny tekst","color":"#F8F824"}` |
| 11 | `animacja:rainbow_fast` | `#F8F828` | `/tellraw @a {"text":"Witaj w świecie","color":"#F8F828"}` |
| 12 | `animacja:bouncy` | `#F8F82C` | `/tellraw @a {"text":"Animacje działają","color":"#F8F82C"}` |
| 13 | `animacja:bouncy_high` | `#F8F830` | `/tellraw @a {"text":"To jest test tekstu","color":"#F8F830"}` |
| 14 | `animacja:blinking` | `#F8F834` | `/tellraw @a {"text":"Minecraft jest świetny","color":"#F8F834"}` |
| 15 | `animacja:blink_slow` | `#F8F838` | `/tellraw @a {"text":"Super serwer","color":"#F8F838"}` |
| 16 | `animacja:pulse` | `#F8F83C` | `/tellraw @a {"text":"Gramy dalej","color":"#F8F83C"}` |
| 17 | `animacja:pulse_big` | `#F8F840` | `/tellraw @a {"text":"Kliknij i zagraj","color":"#F8F840"}` |
| 18 | `animacja:heartbeat` | `#F8F844` | `/tellraw @a {"text":"Do zobaczenia","color":"#F8F844"}` |
| 19 | `animacja:spin` | `#F8F848` | `/tellraw @a {"text":"Nowa przygoda","color":"#F8F848"}` |
| 20 | `animacja:spin_slow` | `#F8F84C` | `/tellraw @a {"text":"Legendarny tekst","color":"#F8F84C"}` |
| 21 | `animacja:flip` | `#F8F850` | `/tellraw @a {"text":"Witaj w świecie","color":"#F8F850"}` |
| 22 | `animacja:flip_fast` | `#F8F854` | `/tellraw @a {"text":"Animacje działają","color":"#F8F854"}` |
| 23 | `animacja:fade` | `#F8F858` | `/tellraw @a {"text":"To jest test tekstu","color":"#F8F858"}` |
| 24 | `animacja:breathe` | `#F8F85C` | `/tellraw @a {"text":"Minecraft jest świetny","color":"#F8F85C"}` |
| 25 | `animacja:flicker` | `#F8F860` | `/tellraw @a {"text":"Super serwer","color":"#F8F860"}` |
| 26 | `animacja:jump` | `#F8F864` | `/tellraw @a {"text":"Gramy dalej","color":"#F8F864"}` |
| 27 | `animacja:glitch` | `#F8F868` | `/tellraw @a {"text":"Kliknij i zagraj","color":"#F8F868"}` |
| 28 | `animacja:glitch_soft` | `#F8F86C` | `/tellraw @a {"text":"Do zobaczenia","color":"#F8F86C"}` |
| 29 | `animacja:big` | `#F8F870` | `/tellraw @a {"text":"Nowa przygoda","color":"#F8F870"}` |
| 30 | `animacja:huge` | `#F8F874` | `/tellraw @a {"text":"Legendarny tekst","color":"#F8F874"}` |
| 31 | `animacja:small` | `#F8F878` | `/tellraw @a {"text":"Witaj w świecie","color":"#F8F878"}` |
| 32 | `animacja:up` | `#F8F87C` | `/tellraw @a {"text":"Animacje działają","color":"#F8F87C"}` |
| 33 | `animacja:down` | `#F8F880` | `/tellraw @a {"text":"To jest test tekstu","color":"#F8F880"}` |
| 34 | `animacja:float` | `#F8F884` | `/tellraw @a {"text":"Minecraft jest świetny","color":"#F8F884"}` |
| 35 | `animacja:sway` | `#F8F888` | `/tellraw @a {"text":"Super serwer","color":"#F8F888"}` |
| 36 | `animacja:zigzag` | `#F8F88C` | `/tellraw @a {"text":"Gramy dalej","color":"#F8F88C"}` |
| 37 | `animacja:wobble` | `#F8F890` | `/tellraw @a {"text":"Kliknij i zagraj","color":"#F8F890"}` |
| 38 | `animacja:fall` | `#F8F894` | `/tellraw @a {"text":"Do zobaczenia","color":"#F8F894"}` |
| 39 | `animacja:rise` | `#F8F898` | `/tellraw @a {"text":"Nowa przygoda","color":"#F8F898"}` |
| 40 | `animacja:orbit` | `#F8F89C` | `/tellraw @a {"text":"Legendarny tekst","color":"#F8F89C"}` |
| 41 | `animacja:drift` | `#F8F8A0` | `/tellraw @a {"text":"Witaj w świecie","color":"#F8F8A0"}` |
| 42 | `animacja:type` | `#F8F8A4` | `/tellraw @a {"text":"Animacje działają","color":"#F8F8A4"}` |
| 43 | `animacja:erase` | `#F8F8A8` | `/tellraw @a {"text":"To jest test tekstu","color":"#F8F8A8"}` |
| 44 | `animacja:gradient_gd` | `#F8F8AC` | `/tellraw @a {"text":"Minecraft jest świetny","color":"#F8F8AC"}` |
| 45 | `animacja:gradient_rb` | `#F8F8B0` | `/tellraw @a {"text":"Super serwer","color":"#F8F8B0"}` |
| 46 | `animacja:gradient_anim` | `#F8F8B4` | `/tellraw @a {"text":"Gramy dalej","color":"#F8F8B4"}` |
| 47 | `animacja:lava` | `#F8F8B8` | `/tellraw @a {"text":"Kliknij i zagraj","color":"#F8F8B8"}` |
| 48 | `animacja:aurora` | `#F8F8BC` | `/tellraw @a {"text":"Do zobaczenia","color":"#F8F8BC"}` |
| 49 | `animacja:fire` | `#F8F8C0` | `/tellraw @a {"text":"Nowa przygoda","color":"#F8F8C0"}` |
| 50 | `animacja:ice` | `#F8F8C4` | `/tellraw @a {"text":"Legendarny tekst","color":"#F8F8C4"}` |
| 51 | `animacja:gold` | `#F8F8C8` | `/tellraw @a {"text":"Witaj w świecie","color":"#F8F8C8"}` |
| 52 | `animacja:split` | `#F8F8CC` | `/tellraw @a {"text":"Animacje działają","color":"#F8F8CC"}` |
| 53 | `animacja:outline` | `#F8F8D0` | `/tellraw @a {"text":"To jest test tekstu","color":"#F8F8D0"}` |
| 54 | `animacja:hatch` | `#F8F8D4` | `/tellraw @a {"text":"Minecraft jest świetny","color":"#F8F8D4"}` |
| 55 | `animacja:neon` | `#F8F8D8` | `/tellraw @a {"text":"Super serwer","color":"#F8F8D8"}` |
| 56 | `animacja:neon_pink` | `#F8F8DC` | `/tellraw @a {"text":"Gramy dalej","color":"#F8F8DC"}` |
| 57 | `animacja:chroma` | `#F8F8E0` | `/tellraw @a {"text":"Kliknij i zagraj","color":"#F8F8E0"}` |
| 58 | `animacja:extrude` | `#F8F8E4` | `/tellraw @a {"text":"Do zobaczenia","color":"#F8F8E4"}` |
| 59 | `animacja:extrude_deep` | `#F8F8E8` | `/tellraw @a {"text":"Nowa przygoda","color":"#F8F8E8"}` |
| 60 | `animacja:noise` | `#F8F8EC` | `/tellraw @a {"text":"Legendarny tekst","color":"#F8F8EC"}` |
| 61 | `animacja:liquid` | `#F8F8F0` | `/tellraw @a {"text":"Witaj w świecie","color":"#F8F8F0"}` |
| 62 | `animacja:water` | `#F8F8F4` | `/tellraw @a {"text":"Animacje działają","color":"#F8F8F4"}` |
| 63 | `animacja:water_tall` | `#F8F8F8` | `/tellraw @a {"text":"To jest test tekstu","color":"#F8F8F8"}` |
| 64 | `animacja:wave_rainbow` | `#F0F000` | `/tellraw @a {"text":"Minecraft jest świetny","color":"#F0F000"}` |
| 65 | `animacja:wave_neon` | `#F0F004` | `/tellraw @a {"text":"Super serwer","color":"#F0F004"}` |
| 66 | `animacja:wave_aurora` | `#F0F008` | `/tellraw @a {"text":"Gramy dalej","color":"#F0F008"}` |
| 67 | `animacja:wave_fire` | `#F0F00C` | `/tellraw @a {"text":"Kliknij i zagraj","color":"#F0F00C"}` |
| 68 | `animacja:wave_ice` | `#F0F010` | `/tellraw @a {"text":"Do zobaczenia","color":"#F0F010"}` |
| 69 | `animacja:wave_gold` | `#F0F014` | `/tellraw @a {"text":"Nowa przygoda","color":"#F0F014"}` |
| 70 | `animacja:shake_rainbow` | `#F0F018` | `/tellraw @a {"text":"Legendarny tekst","color":"#F0F018"}` |
| 71 | `animacja:shake_neon` | `#F0F01C` | `/tellraw @a {"text":"Witaj w świecie","color":"#F0F01C"}` |
| 72 | `animacja:shake_glitch` | `#F0F020` | `/tellraw @a {"text":"Animacje działają","color":"#F0F020"}` |
| 73 | `animacja:bouncy_rainbow` | `#F0F024` | `/tellraw @a {"text":"To jest test tekstu","color":"#F0F024"}` |
| 74 | `animacja:bouncy_neon` | `#F0F028` | `/tellraw @a {"text":"Minecraft jest świetny","color":"#F0F028"}` |
| 75 | `animacja:bouncy_fire` | `#F0F02C` | `/tellraw @a {"text":"Super serwer","color":"#F0F02C"}` |
| 76 | `animacja:pulse_rainbow` | `#F0F030` | `/tellraw @a {"text":"Gramy dalej","color":"#F0F030"}` |
| 77 | `animacja:pulse_gold` | `#F0F034` | `/tellraw @a {"text":"Kliknij i zagraj","color":"#F0F034"}` |
| 78 | `animacja:heartbeat_neon` | `#F0F038` | `/tellraw @a {"text":"Do zobaczenia","color":"#F0F038"}` |
| 79 | `animacja:spin_rainbow` | `#F0F03C` | `/tellraw @a {"text":"Nowa przygoda","color":"#F0F03C"}` |
| 80 | `animacja:spin_neon` | `#F0F040` | `/tellraw @a {"text":"Legendarny tekst","color":"#F0F040"}` |
| 81 | `animacja:flip_aurora` | `#F0F044` | `/tellraw @a {"text":"Witaj w świecie","color":"#F0F044"}` |
| 82 | `animacja:fade_rainbow` | `#F0F048` | `/tellraw @a {"text":"Animacje działają","color":"#F0F048"}` |
| 83 | `animacja:float_rainbow` | `#F0F04C` | `/tellraw @a {"text":"To jest test tekstu","color":"#F0F04C"}` |
| 84 | `animacja:float_neon` | `#F0F050` | `/tellraw @a {"text":"Minecraft jest świetny","color":"#F0F050"}` |
| 85 | `animacja:sway_ice` | `#F0F054` | `/tellraw @a {"text":"Super serwer","color":"#F0F054"}` |
| 86 | `animacja:zigzag_bouncy` | `#F0F058` | `/tellraw @a {"text":"Gramy dalej","color":"#F0F058"}` |
| 87 | `animacja:wobble_rainbow` | `#F0F05C` | `/tellraw @a {"text":"Kliknij i zagraj","color":"#F0F05C"}` |
| 88 | `animacja:orbit_rainbow` | `#F0F060` | `/tellraw @a {"text":"Do zobaczenia","color":"#F0F060"}` |
| 89 | `animacja:drift_ice` | `#F0F064` | `/tellraw @a {"text":"Nowa przygoda","color":"#F0F064"}` |
| 90 | `animacja:type_neon` | `#F0F068` | `/tellraw @a {"text":"Legendarny tekst","color":"#F0F068"}` |
| 91 | `animacja:erase_glitch` | `#F0F06C` | `/tellraw @a {"text":"Witaj w świecie","color":"#F0F06C"}` |
| 92 | `animacja:glitch_chroma` | `#F0F070` | `/tellraw @a {"text":"Animacje działają","color":"#F0F070"}` |
| 93 | `animacja:lava_shake` | `#F0F074` | `/tellraw @a {"text":"To jest test tekstu","color":"#F0F074"}` |
| 94 | `animacja:lava_extrude` | `#F0F078` | `/tellraw @a {"text":"Minecraft jest świetny","color":"#F0F078"}` |
| 95 | `animacja:water_wave` | `#F0F07C` | `/tellraw @a {"text":"Super serwer","color":"#F0F07C"}` |
| 96 | `animacja:liquid_neon` | `#F0F080` | `/tellraw @a {"text":"Gramy dalej","color":"#F0F080"}` |
| 97 | `animacja:noise_glitch` | `#F0F084` | `/tellraw @a {"text":"Kliknij i zagraj","color":"#F0F084"}` |
| 98 | `animacja:split_shake` | `#F0F088` | `/tellraw @a {"text":"Do zobaczenia","color":"#F0F088"}` |
| 99 | `animacja:outline_bouncy` | `#F0F08C` | `/tellraw @a {"text":"Nowa przygoda","color":"#F0F08C"}` |
| 100 | `animacja:mega` | `#F0F090` | `/tellraw @a {"text":"Legendarny tekst","color":"#F0F090"}` |

## 6. Łączenie efektów

### Metoda 1: gotowe tagi kombinowane

Tagi 64-100 to połączenia efektów:

| # | Tag | Rozkaz |
|---|-----|--------|
| 64 | `animacja:wave_rainbow` | `/tellraw @a {"text":"Super serwer","color":"#F0F000"}` |
| 65 | `animacja:wave_neon` | `/tellraw @a {"text":"Gramy dalej","color":"#F0F004"}` |
| 66 | `animacja:wave_aurora` | `/tellraw @a {"text":"Kliknij i zagraj","color":"#F0F008"}` |
| 67 | `animacja:wave_fire` | `/tellraw @a {"text":"Do zobaczenia","color":"#F0F00C"}` |
| 68 | `animacja:wave_ice` | `/tellraw @a {"text":"Nowa przygoda","color":"#F0F010"}` |
| 69 | `animacja:wave_gold` | `/tellraw @a {"text":"Legendarny tekst","color":"#F0F014"}` |
| 70 | `animacja:shake_rainbow` | `/tellraw @a {"text":"Witaj w świecie","color":"#F0F018"}` |
| 71 | `animacja:shake_neon` | `/tellraw @a {"text":"Animacje działają","color":"#F0F01C"}` |
| 72 | `animacja:shake_glitch` | `/tellraw @a {"text":"To jest test tekstu","color":"#F0F020"}` |
| 73 | `animacja:bouncy_rainbow` | `/tellraw @a {"text":"Minecraft jest świetny","color":"#F0F024"}` |
| 74 | `animacja:bouncy_neon` | `/tellraw @a {"text":"Super serwer","color":"#F0F028"}` |
| 75 | `animacja:bouncy_fire` | `/tellraw @a {"text":"Gramy dalej","color":"#F0F02C"}` |
| 76 | `animacja:pulse_rainbow` | `/tellraw @a {"text":"Kliknij i zagraj","color":"#F0F030"}` |
| 77 | `animacja:pulse_gold` | `/tellraw @a {"text":"Do zobaczenia","color":"#F0F034"}` |
| 78 | `animacja:heartbeat_neon` | `/tellraw @a {"text":"Nowa przygoda","color":"#F0F038"}` |
| 79 | `animacja:spin_rainbow` | `/tellraw @a {"text":"Legendarny tekst","color":"#F0F03C"}` |
| 80 | `animacja:spin_neon` | `/tellraw @a {"text":"Witaj w świecie","color":"#F0F040"}` |
| 81 | `animacja:flip_aurora` | `/tellraw @a {"text":"Animacje działają","color":"#F0F044"}` |
| 82 | `animacja:fade_rainbow` | `/tellraw @a {"text":"To jest test tekstu","color":"#F0F048"}` |
| 83 | `animacja:float_rainbow` | `/tellraw @a {"text":"Minecraft jest świetny","color":"#F0F04C"}` |
| 84 | `animacja:float_neon` | `/tellraw @a {"text":"Super serwer","color":"#F0F050"}` |
| 85 | `animacja:sway_ice` | `/tellraw @a {"text":"Gramy dalej","color":"#F0F054"}` |
| 86 | `animacja:zigzag_bouncy` | `/tellraw @a {"text":"Kliknij i zagraj","color":"#F0F058"}` |
| 87 | `animacja:wobble_rainbow` | `/tellraw @a {"text":"Do zobaczenia","color":"#F0F05C"}` |
| 88 | `animacja:orbit_rainbow` | `/tellraw @a {"text":"Nowa przygoda","color":"#F0F060"}` |
| 89 | `animacja:drift_ice` | `/tellraw @a {"text":"Legendarny tekst","color":"#F0F064"}` |
| 90 | `animacja:type_neon` | `/tellraw @a {"text":"Witaj w świecie","color":"#F0F068"}` |
| 91 | `animacja:erase_glitch` | `/tellraw @a {"text":"Animacje działają","color":"#F0F06C"}` |
| 92 | `animacja:glitch_chroma` | `/tellraw @a {"text":"To jest test tekstu","color":"#F0F070"}` |
| 93 | `animacja:lava_shake` | `/tellraw @a {"text":"Minecraft jest świetny","color":"#F0F074"}` |
| 94 | `animacja:lava_extrude` | `/tellraw @a {"text":"Super serwer","color":"#F0F078"}` |
| 95 | `animacja:water_wave` | `/tellraw @a {"text":"Gramy dalej","color":"#F0F07C"}` |
| 96 | `animacja:liquid_neon` | `/tellraw @a {"text":"Kliknij i zagraj","color":"#F0F080"}` |
| 97 | `animacja:noise_glitch` | `/tellraw @a {"text":"Do zobaczenia","color":"#F0F084"}` |
| 98 | `animacja:split_shake` | `/tellraw @a {"text":"Nowa przygoda","color":"#F0F088"}` |
| 99 | `animacja:outline_bouncy` | `/tellraw @a {"text":"Legendarny tekst","color":"#F0F08C"}` |
| 100 | `animacja:mega` | `/tellraw @a {"text":"Witaj w świecie","color":"#F0F090"}` |

### Metoda 2: własna kombinacja w _config.glsl

Otwórz `assets/minecraft/shaders/include/_config.glsl` i dodaj blok z dwoma lub trzema funkcjami `apply_...`. Kolor spustowy musi być nowy i podzielny przez 4:

```
TEXT_EFFECT_WITH_SHADOW(rgb(248, 244, 248)) {
    apply_wavy();
    apply_rainbow();
    apply_neon(rgb(80, 220, 255), 1.5);
}
```

Po zapisaniu zrestartuj grę. Rozkaz:

```
/tellraw @a {"text":"Test","color":"#F8F4F8"}
```

### Metoda 3: nakładanie segmentów extra

Drugi segment z takim samym tekstem rysuje się w tym samym miejscu, nad pierwszym. Efekt pierwszego widać przy krawędziach, drugi koloruje całość:

```
/tellraw @a {"text":"Test","color":"#F8F800","extra":[{"text":"Test","color":"#F0F004"}]}
```

## 7. Tytuły i actionbar

```
/title @a title {"text":"Witaj","color":"#F8F824"}
/title @a subtitle {"text":"Na serwerze","color":"#F8F814"}
/title @a actionbar {"text":"Test","color":"#F8F800"}
```

## 8. Zaawansowana konfiguracja

W pliku `_config.glsl` dostępne są makra:

```
TEXT_EFFECT(rgb(R, G, B)) { ... }
TEXT_EFFECT_WITH_SHADOW(rgb(R, G, B)) { ... }
```

Wersja `TEXT_EFFECT` animuje tylko tekst, cień pozostaje statyczny. Wersja `TEXT_EFFECT_WITH_SHADOW` animuje też cień - używaj jej dla efektów ruchu.

Kolory można podawać też jako hex:

```
TEXT_EFFECT(rgb(0xF8F800)) {
    apply_wavy();
}
```

Kolor wyświetlania zmienisz funkcją `apply_color(rgb(R, G, B))` - kolorem spustowym może być wtedy cokolwiek, a tekst pokaże się w wybranym kolorze.

Przydatne funkcje i parametry:

| Funkcja | Parametry |
|---------|-----------|
| `apply_wavy` | speed, amplitude, xFrequency |
| `apply_shake` | speed, intensity |
| `apply_bouncy` | speed, amplitude |
| `apply_blinking` | speed |
| `apply_pulse` | speed, size |
| `apply_heartbeat` | speed, size |
| `apply_spin` | speed |
| `apply_sequential_spin` | speed |
| `apply_fade` | speed |
| `apply_breathe` | speed |
| `apply_flicker` | speed, intensity |
| `apply_iterating` | speed, space |
| `apply_glitch` | speed, intensity |
| `apply_scale` | scale, offsetX, offsetY |
| `apply_offset` | offsetX, offsetY |
| `apply_bob` | speed, amplitude |
| `apply_sway` | speed, amplitude |
| `apply_zigzag` | speed, amplitude |
| `apply_wobble` | speed, amplitude |
| `apply_fall` | speed |
| `apply_rise` | speed |
| `apply_orbit` | speed, radius |
| `apply_drift` | speed |
| `apply_typewriter` | speed |
| `apply_erase` | speed |
| `apply_rainbow` | speed |
| `apply_gradient` | startColor, endColor, direction |
| `apply_dynamic_gradient` | startColor, endColor, direction, speed |
| `apply_lava` | speed |
| `apply_aurora` | c1, c2, c3, speed |
| `apply_split` | intensity, speed |
| `apply_outline` | color, thickness |
| `apply_hatch` | color, speed, density |
| `apply_neon` | color, intensity, speed |
| `apply_chromatic` | intensity, speed |
| `apply_extrude` | depth, layers, endColor |
| `apply_noise` | intensity, speed |
| `apply_liquid` | intensity, speed |
| `apply_water` | color, level, amplitude, speed, frequency |
| `apply_color` | color |

## 9. Problemy

- Animacja nie działa: upewnij się, że pack jest włączony i nie ma innego packa nadpisującego `rendertype_text`
- Zły efekt: sprawdź dokładny kolor - musi być identyczny z tabelą, np. `#F8F800`, a nie `#ffff55`
- Tekst zniknął: efekty `type`, `erase`, `blink*` są cykliczne - część tekstu bywa chwilowo niewidoczna

## 10. Licencja

MIT. Oparto na TheSalt's Text Effects (MIT, TheSalt).

