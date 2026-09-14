# Tutorial - Animacje 100+

## 1. Co to jest

Animacje 100+ to resourcepack, który animuje tekst w czacie, na tytułach i actionbarze. Animacja wyzwalana jest kolorem tekstu - każdy z 116 tagów ma swój unikalny kolor spustowy. Serwer zawsze widzi i zapisuje zwykły tekst z kolorem, animację renderuje tylko client z włączonym packiem.

## 2. Instalacja

1. Skopiuj `Animacje100.zip` do `.minecraft/resourcepacks`
2. Opcje - Interfejs i grafik - Pakiety zasobów - włącz `Animacje 100+`
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

Konwerter obsługuje kilka tagów i zwykły tekst naraz:

```
python3 konwerter.py "Zwykły tekst <animacja:rainbow>tęcza</animacja> i <animacja:blask>blask</animacja>"

/tellraw @a {"text": "", "extra": [{"text": "Zwykły tekst "}, {"text": "tęcza", "color": "#F8F824"}, {"text": " i "}, {"text": "blask", "color": "#E8E800"}]}
```

## 5. Wszystkie 116 przykładowych tekstów

### 1. `animacja:wave` - Fala podnosząca litery
### 2. `animacja:wave_big` - Wysoka fala
### 3. `animacja:wave_slow` - Wolna fala
### 4. `animacja:wave_fast` - Szybka fala
### 5. `animacja:wave_soft` - Delikatna fala
### 6. `animacja:shake` - Losowe trzęsienie
### 7. `animacja:shake_fast` - Szybkie trzęsienie
### 8. `animacja:shake_mega` - Mocne trzęsienie
### 9. `animacja:tremor` - Drobne drżenie
### 10. `animacja:rainbow` - Tęczowy przebieg kolorów
### 11. `animacja:rainbow_fast` - Szybka tęcza
### 12. `animacja:bouncy` - Podskoki
### 13. `animacja:bouncy_high` - Wysokie podskoki
### 14. `animacja:blinking` - Miganie
### 15. `animacja:blink_slow` - Wolne miganie
### 16. `animacja:pulse` - Pulsowanie
### 17. `animacja:pulse_big` - Duże pulsowanie
### 18. `animacja:heartbeat` - Uderzenia serca
### 19. `animacja:spin` - Obrót (przewracanie)
### 20. `animacja:spin_slow` - Powolny obrót
### 21. `animacja:flip` - Przewracanie liter kolejno
### 22. `animacja:flip_fast` - Szybkie przewracanie liter
### 23. `animacja:fade` - Zanikanie i pojawianie
### 24. `animacja:breathe` - Delikatny oddech
### 25. `animacja:flicker` - Szybkie migotanie
### 26. `animacja:jump` - Skoki liter kolejno
### 27. `animacja:glitch` - Glicz / losowe przesunięcia
### 28. `animacja:glitch_soft` - Delikatny glicz
### 29. `animacja:big` - Powiększenie x1.5
### 30. `animacja:huge` - Powiększenie x2.5
### 31. `animacja:small` - Pomniejszenie x0.8
### 32. `animacja:up` - Przesunięcie w górę
### 33. `animacja:down` - Przesunięcie w dół
### 34. `animacja:float` - Unoszenie góra-dół
### 35. `animacja:sway` - Kołysanie na boki
### 36. `animacja:zigzag` - Literki na zmianę w górę/dół
### 37. `animacja:wobble` - Chodzenie na zmianę
### 38. `animacja:fall` - Spadanie tekstu
### 39. `animacja:rise` - Wznoszenie tekstu
### 40. `animacja:orbit` - Krążenie liter po okręgu
### 41. `animacja:drift` - Dryfowanie po przekątnej
### 42. `animacja:type` - Pisanie maszynowe
### 43. `animacja:erase` - Kasowanie liter kolejno
### 44. `animacja:gradient_gd` - Gradient zielony→żółty
### 45. `animacja:gradient_rb` - Gradient czerwony→niebieski
### 46. `animacja:gradient_anim` - Animowany gradient
### 47. `animacja:lava` - Płynąca lawa
### 48. `animacja:aurora` - Aurora (3 kolory)
### 49. `animacja:fire` - Ogień
### 50. `animacja:ice` - Lód
### 51. `animacja:gold` - Złoto
### 52. `animacja:split` - Rozdzielanie liter na pół
### 53. `animacja:outline` - Kontur wokół liter
### 54. `animacja:hatch` - Kreskowanie
### 55. `animacja:neon` - Neonowy blask
### 56. `animacja:neon_pink` - Różowy neon
### 57. `animacja:chroma` - Aberracja chromatyczna
### 58. `animacja:extrude` - 3D / cień głębokości
### 59. `animacja:extrude_deep` - Głębokie 3D
### 60. `animacja:noise` - Szum / statyczny
### 61. `animacja:liquid` - Płynna ciecz
### 62. `animacja:water` - Wypełnianie wodą
### 63. `animacja:water_tall` - Woda do góry (85%)
### 64. `animacja:wave_rainbow` - Fala + tęcza
### 65. `animacja:wave_neon` - Fala + neon
### 66. `animacja:wave_aurora` - Fala + aurora
### 67. `animacja:wave_fire` - Fala + ogień
### 68. `animacja:wave_ice` - Fala + lód
### 69. `animacja:wave_gold` - Fala + złoto
### 70. `animacja:shake_rainbow` - Trzęsienie + tęcza
### 71. `animacja:shake_neon` - Trzęsienie + neon
### 72. `animacja:shake_glitch` - Trzęsienie + glicz
### 73. `animacja:bouncy_rainbow` - Podskoki + tęcza
### 74. `animacja:bouncy_neon` - Podskoki + różowy neon
### 75. `animacja:bouncy_fire` - Podskoki + ogień
### 76. `animacja:pulse_rainbow` - Pulsowanie + tęcza
### 77. `animacja:pulse_gold` - Pulsowanie + złoto
### 78. `animacja:heartbeat_neon` - Serce + neon
### 79. `animacja:spin_rainbow` - Obrót + tęcza
### 80. `animacja:spin_neon` - Obrót + neon
### 81. `animacja:flip_aurora` - Przewracanie + aurora
### 82. `animacja:fade_rainbow` - Zanikanie + tęcza
### 83. `animacja:float_rainbow` - Unoszenie + tęcza
### 84. `animacja:float_neon` - Unoszenie + neon
### 85. `animacja:sway_ice` - Kołysanie + lód
### 86. `animacja:zigzag_bouncy` - Zigzag + podskoki
### 87. `animacja:wobble_rainbow` - Chodzenie + tęcza
### 88. `animacja:orbit_rainbow` - Krążenie + tęcza
### 89. `animacja:drift_ice` - Dryfowanie + lód
### 90. `animacja:type_neon` - Pisanie + neon
### 91. `animacja:erase_glitch` - Kasowanie + glicz
### 92. `animacja:glitch_chroma` - Glicz + aberracja
### 93. `animacja:lava_shake` - Lawa + trzęsienie
### 94. `animacja:lava_extrude` - Lawa + 3D
### 95. `animacja:water_wave` - Woda + fala
### 96. `animacja:liquid_neon` - Ciecz + neon
### 97. `animacja:noise_glitch` - Szum + glicz
### 98. `animacja:split_shake` - Rozdzielanie + trzęsienie
### 99. `animacja:outline_bouncy` - Kontur + podskoki
### 100. `animacja:mega` - Fala + trzęsienie + tęcza
### 101. `animacja:blask` - Błyszczący przebieg światła po literach
### 102. `animacja:blask_wave` - Blask + fala
### 103. `animacja:blask_shake` - Blask + trzęsienie
### 104. `animacja:iskry` - Rozbłyskujące iskierki / gwiazdki na literach
### 105. `animacja:iskry_float` - Iskry + unoszenie
### 106. `animacja:iskry_bouncy` - Iskry + podskoki
### 107. `animacja:plomien` - Płomienie na literach
### 108. `animacja:plomien_wave` - Płomienie + fala
### 109. `animacja:plomien_shake` - Płomienie + trzęsienie
### 110. `animacja:popcorn` - Literki wyskakują jak kukurydza
### 111. `animacja:eksplozja` - Literki eksplodują na zewnątrz (z zanikiem)
### 112. `animacja:winda` - Tekst wjeżdża z dołu (pętla)
### 113. `animacja:deszcz` - Tekst spada jak deszcz (pętla)
### 114. `animacja:mrugacz` - Losowe literki znikają i wracają
### 115. `animacja:skoczki` - Górne litery podskakują jak piłeczki
### 116. `animacja:mega_blask` - Fala + trzęsienie + blask

```
/tellraw @a {"text":"Witaj w świecie","color":"#F8F800"}
/tellraw @a {"text":"Animacje działają","color":"#F8F804"}
/tellraw @a {"text":"To jest test tekstu","color":"#F8F808"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#F8F80C"}
/tellraw @a {"text":"Super serwer","color":"#F8F810"}
/tellraw @a {"text":"Gramy dalej","color":"#F8F814"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#F8F818"}
/tellraw @a {"text":"Do zobaczenia","color":"#F8F81C"}
/tellraw @a {"text":"Nowa przygoda","color":"#F8F820"}
/tellraw @a {"text":"Legendarny tekst","color":"#F8F824"}
/tellraw @a {"text":"Witaj w świecie","color":"#F8F828"}
/tellraw @a {"text":"Animacje działają","color":"#F8F82C"}
/tellraw @a {"text":"To jest test tekstu","color":"#F8F830"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#F8F834"}
/tellraw @a {"text":"Super serwer","color":"#F8F838"}
/tellraw @a {"text":"Gramy dalej","color":"#F8F83C"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#F8F840"}
/tellraw @a {"text":"Do zobaczenia","color":"#F8F844"}
/tellraw @a {"text":"Nowa przygoda","color":"#F8F848"}
/tellraw @a {"text":"Legendarny tekst","color":"#F8F84C"}
/tellraw @a {"text":"Witaj w świecie","color":"#F8F850"}
/tellraw @a {"text":"Animacje działają","color":"#F8F854"}
/tellraw @a {"text":"To jest test tekstu","color":"#F8F858"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#F8F85C"}
/tellraw @a {"text":"Super serwer","color":"#F8F860"}
/tellraw @a {"text":"Gramy dalej","color":"#F8F864"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#F8F868"}
/tellraw @a {"text":"Do zobaczenia","color":"#F8F86C"}
/tellraw @a {"text":"Nowa przygoda","color":"#F8F870"}
/tellraw @a {"text":"Legendarny tekst","color":"#F8F874"}
/tellraw @a {"text":"Witaj w świecie","color":"#F8F878"}
/tellraw @a {"text":"Animacje działają","color":"#F8F87C"}
/tellraw @a {"text":"To jest test tekstu","color":"#F8F880"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#F8F884"}
/tellraw @a {"text":"Super serwer","color":"#F8F888"}
/tellraw @a {"text":"Gramy dalej","color":"#F8F88C"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#F8F890"}
/tellraw @a {"text":"Do zobaczenia","color":"#F8F894"}
/tellraw @a {"text":"Nowa przygoda","color":"#F8F898"}
/tellraw @a {"text":"Legendarny tekst","color":"#F8F89C"}
/tellraw @a {"text":"Witaj w świecie","color":"#F8F8A0"}
/tellraw @a {"text":"Animacje działają","color":"#F8F8A4"}
/tellraw @a {"text":"To jest test tekstu","color":"#F8F8A8"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#F8F8AC"}
/tellraw @a {"text":"Super serwer","color":"#F8F8B0"}
/tellraw @a {"text":"Gramy dalej","color":"#F8F8B4"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#F8F8B8"}
/tellraw @a {"text":"Do zobaczenia","color":"#F8F8BC"}
/tellraw @a {"text":"Nowa przygoda","color":"#F8F8C0"}
/tellraw @a {"text":"Legendarny tekst","color":"#F8F8C4"}
/tellraw @a {"text":"Witaj w świecie","color":"#F8F8C8"}
/tellraw @a {"text":"Animacje działają","color":"#F8F8CC"}
/tellraw @a {"text":"To jest test tekstu","color":"#F8F8D0"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#F8F8D4"}
/tellraw @a {"text":"Super serwer","color":"#F8F8D8"}
/tellraw @a {"text":"Gramy dalej","color":"#F8F8DC"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#F8F8E0"}
/tellraw @a {"text":"Do zobaczenia","color":"#F8F8E4"}
/tellraw @a {"text":"Nowa przygoda","color":"#F8F8E8"}
/tellraw @a {"text":"Legendarny tekst","color":"#F8F8EC"}
/tellraw @a {"text":"Witaj w świecie","color":"#F8F8F0"}
/tellraw @a {"text":"Animacje działają","color":"#F8F8F4"}
/tellraw @a {"text":"To jest test tekstu","color":"#F8F8F8"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#F0F000"}
/tellraw @a {"text":"Super serwer","color":"#F0F004"}
/tellraw @a {"text":"Gramy dalej","color":"#F0F008"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#F0F00C"}
/tellraw @a {"text":"Do zobaczenia","color":"#F0F010"}
/tellraw @a {"text":"Nowa przygoda","color":"#F0F014"}
/tellraw @a {"text":"Legendarny tekst","color":"#F0F018"}
/tellraw @a {"text":"Witaj w świecie","color":"#F0F01C"}
/tellraw @a {"text":"Animacje działają","color":"#F0F020"}
/tellraw @a {"text":"To jest test tekstu","color":"#F0F024"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#F0F028"}
/tellraw @a {"text":"Super serwer","color":"#F0F02C"}
/tellraw @a {"text":"Gramy dalej","color":"#F0F030"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#F0F034"}
/tellraw @a {"text":"Do zobaczenia","color":"#F0F038"}
/tellraw @a {"text":"Nowa przygoda","color":"#F0F03C"}
/tellraw @a {"text":"Legendarny tekst","color":"#F0F040"}
/tellraw @a {"text":"Witaj w świecie","color":"#F0F044"}
/tellraw @a {"text":"Animacje działają","color":"#F0F048"}
/tellraw @a {"text":"To jest test tekstu","color":"#F0F04C"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#F0F050"}
/tellraw @a {"text":"Super serwer","color":"#F0F054"}
/tellraw @a {"text":"Gramy dalej","color":"#F0F058"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#F0F05C"}
/tellraw @a {"text":"Do zobaczenia","color":"#F0F060"}
/tellraw @a {"text":"Nowa przygoda","color":"#F0F064"}
/tellraw @a {"text":"Legendarny tekst","color":"#F0F068"}
/tellraw @a {"text":"Witaj w świecie","color":"#F0F06C"}
/tellraw @a {"text":"Animacje działają","color":"#F0F070"}
/tellraw @a {"text":"To jest test tekstu","color":"#F0F074"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#F0F078"}
/tellraw @a {"text":"Super serwer","color":"#F0F07C"}
/tellraw @a {"text":"Gramy dalej","color":"#F0F080"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#F0F084"}
/tellraw @a {"text":"Do zobaczenia","color":"#F0F088"}
/tellraw @a {"text":"Nowa przygoda","color":"#F0F08C"}
/tellraw @a {"text":"Legendarny tekst","color":"#F0F090"}
/tellraw @a {"text":"Witaj w świecie","color":"#E8E800"}
/tellraw @a {"text":"Animacje działają","color":"#E8E804"}
/tellraw @a {"text":"To jest test tekstu","color":"#E8E808"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#E8E80C"}
/tellraw @a {"text":"Super serwer","color":"#E8E810"}
/tellraw @a {"text":"Gramy dalej","color":"#E8E814"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#E8E818"}
/tellraw @a {"text":"Do zobaczenia","color":"#E8E81C"}
/tellraw @a {"text":"Nowa przygoda","color":"#E8E820"}
/tellraw @a {"text":"Legendarny tekst","color":"#E8E824"}
/tellraw @a {"text":"Witaj w świecie","color":"#E8E828"}
/tellraw @a {"text":"Animacje działają","color":"#E8E82C"}
/tellraw @a {"text":"To jest test tekstu","color":"#E8E830"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#E8E834"}
/tellraw @a {"text":"Super serwer","color":"#E8E838"}
/tellraw @a {"text":"Gramy dalej","color":"#E8E83C"}
```

## 6. Łączenie efektów

Tagi 64-100 to gotowe kombinacje. Tagi 101-116 to nowa generacja efektów, w tym gotowe kombinacje.

Zasady:

- efekt wierzchołkowy + efekt wierzchołkowy: tak
- efekt wierzchołkowy + efekt fragmentowy (blask, iskry, plomien): tak
- efekt fragmentowy + kolor/faza (tęcza, neon): nie - fragmentowy ma pierwszeństwo
- dwa fragmentowe: nie (jeden na kolor)

Własne kombinacje: `assets/minecraft/shaders/include/_config.glsl` (patrz README).

Nakładanie dwóch efektów jednym rozkazem przez `extra`:

```
/tellraw @a {"text":"Test","color":"#F8F800","extra":[{"text":"Test","color":"#F0F004"}]}
```

## 7. Tytuły i actionbar

Te same kolory spustowe działają w `/title` i `/title ... actionbar` oraz w `title`/`subtitles` z komponentami.

```
/title @a title {"text":"Witaj","color":"#E8E800"}

/title @a actionbar {"text":"ekipa!","color":"#F8F824"}
```

## 8. Zaawansowana konfiguracja

Parametry każdego efektu można zmienić w `assets/minecraft/shaders/include/defaults.glsl` (makra `#define`), np.:

```
#define BLASK_SPEED 1.5
#define PLOMIEN_SPEED 0.7
#define POPCORN_SIZE 0.8
```

Parametry można też nadpisać per tag w `_config.glsl`, wywołując funkcje z argumentami:

```
TEXT_EFFECT(rgb(232, 232, 0)) {
    apply_blask(1.5, 2.0, 0.4);
    apply_color(rgb(255, 255, 255));
}
```

## 9. Nick i hologramy (Animacje-Datapack, 1.21.11)

Vanilla Minecrafta **nie pozwala** bezpośrednio animować ani kolorować własnego nickname'u - paski nad głową graczy i nazwy serwerów nie są tekstami sterowanymi komponentami. Obchodzimy to przez `CustomName`:

1. Wrzuć `Animacje-Datapack.zip` do `.minecraft/datapacks` (serwer lub singleplayer)
2. Wykonaj w grze: `/function animacje:tag` - twój nick zamieni się w animowany tag (np. fala + twój nick)
3. Wykonaj: `/function animacje:nick` - nad głową pojawi się napis `TwójNick` w kolorze animacji (zmień tekst w `data/animacje/functions/nick.mcfunction`, jeśli chcesz własny)
4. Wykonaj: `/function animacje:reset` - przywróca zwykły nick

Ważne: kolory spustowe muszą znajdować się w rozkazach jako pełny 16-hex `color`, dokładnie jak w `tellraw`. Datapack robi to za Ciebie.

Hologramy z animacjami (stos typu FancyHologram, ale bez zewnętrznego moda):

- `/function animacje:hologram` - stawia hologram z animowanym tekstem (np. `animacja:blask` na linii 1)
- `/function animacje:hologram_nazwa` - hologram z nazwą gracza (zmień tekst w funkcji)
- `/function animacje:hologram_usun` - usuwa wszystkie hologramy z tego datapacku

Linie hologramu to zwykły tekst z komponentami - każda linia może mieć inny kolor spustowy. Nazwa gracza nie da się wstrzyknąć dynamicznie w NBT (makra komend podmieniają tylko wyniki scores), dlatego tekst w funkcjach jest edytowalny.

## 10. Problemy

- Brak animacji: upewnij się, że pack jest włączony i żaden inny pack nie nadpisuje `rendertype_text`
- Animacja na wszystkich kolorach: sprawdź, czy nie używasz kolorów z tabeli w innym packu
- Zmiany w `_config.glsl` wymagają restartu gry

## 11. Licencja

MIT. Pack oparty na TheSalt's Text Effects (MIT, TheSalt). Szczegóły w `LICENSE`.

