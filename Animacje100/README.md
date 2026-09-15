# Animacje 150

Resourcepack z **150 animacjami tekstu** dla Minecraft Java Edition.

Napisz tekst w specjalnym kolorze, a client z włączonym packiem wyświetli go z animacją. Na serwerze i u graczy bez packa pozostaje zwykły tekst - animacja działa wyłącznie po stronie klienta.

> Nie jest kompatybilny z innymi packami nadpisującymi shader `rendertype_text`.

## Czym to animuje (nie tylko czat!)

Pack nadpisuje **cały pipeline renderowania tekstu** (wszystkie warianty `rendertype_text`), więc animowane są: czat, tytuły (`/title`), actionbar, **tabliczki**, **nazwy manekinów** i tekst w GUI (1.21.4+). Nick gracza - przez datapack `Animacje-Datapack` (1.21.11).

## Instalacja

1. Wrzuć folder `Animacje100` (lub `Animacje100.zip`) do `.minecraft/resourcepacks`
2. W opcjach gry włącz pack w sekcji `Pakiety zasobów`
3. Wpisuj kolory z tabeli poniżej w `/tellraw`, `/title` itp.

Opcjonalnie: `Animacje-Datapack` (1.21.11) - animowany nick i hologramy (TUTORIAL rozdz. 9).

## Szybki start

```
/tellraw @a {"text":"Test","color":"#F8F800"}
```

```
python3 konwerter.py "<animacja:wave>Test</animacja>"

/tellraw @a {"text": "Test", "color": "#F8F800"}
```

## Rangi na serwerze (LuckPerms)

Prefixy i suffiksy w LuckPerms przyjmują pełne komponenty JSON z kolorami hex - czyli **rangi mogą być animowane**:

```
/lp user <gracz> prefix set {"text":"[OP] ","color":"#D8D82C"}

/lp user <gracz> suffix set {"text":" | Ekipa","color":"#D8D800"}
```

- `<gracz>` - nazwa gracza; kolor spustowy bierzesz z tabeli (tu: `tron` i `neon_puls`)
- Każdy wpis w czacie od tego gracza będzie mieć animowany prefix (u klientów z włączonym packiem; bez packa widać zwykły kolor)
- Można też przez edytor webowy LuckPerms (luckperms.net): user - prefix/suffix - wklej JSON
- Na singleplayer: `/function animacje:tag` / `animacje:nick` (datapack) zmienia twój nick na animowany

## Nowa generacja efektów (ostatnie 46 tagów)

Fragmentowe (piksel-po-pikselu, najładniejsze):

- **neon_puls** - pulsująca neonowa poświata, **szklo** - ostry metaliczny refleks
- **zloty_blask** - błysk po złocie, **diamet** - mocne białoniebieskie iskrzenie
- **krew** - spływające krople, **pianka** - bąbelki, **dym** - unoszący się dym
- **piorun** - losowe rozbłyski, **radioaktywny** - trujące zielone światło
- **pulsar** - rozszerzające się pierścienie, **galaktyka** - mgławica + gwiazdy
- **tron** - neonowa siatka, **prizma** - tęczowe wiersze, **cukierek** - paski
- **ocean** - fale + piana, **czarna_dziura** - wciąganie w środek
- **mrozy** - kryształowa siatka, **magma** - świecące pęknięcia, **plasma** - płynna plazma
- **aureola** - tęczowa poświata wokół liter

Kinetyczne: **karuzela** (krążenie), **spirala**, **pociag** (wagoniki), **burza** (teleporty), **titan** (gigantyczna fala), **metronom**, **fala_3d**, **piorka** (dryfowanie).

Poza tym 18 gotowych kombinacji premium (glow_wavy, szklo_shake, tron_holo, galaktyka_spin, dziura_shake, magma_shake, karuzela_rainbow, aureola_wavy i inne).

## Usunięte słabe efekty

Zgodnie z polityką jakości usunięto 48 słabych/redundantnych efektów: proste warianty (wave_soft, rainbow_fast, bouncy_high, blink_slow, pulse_big, spin_slow, flip_fast), statyczne przesunięcia i skalowanie (big, huge, small, up, down) oraz 36 prostych kombinacji (wave_rainbow, shake_neon, mega-lite i podobne). Pełna lista w historii commitów.

## 150 animacji

Kolor = tag. Każdy tag ma swój unikalny kolor spustowy. Wszystkie tagi są animowane.

| # | Tag | Kolor | Efekt |
|---|-----|-------|-------|
| 1 | `animacja:wave` | `#F8F800` | Fala podnosząca litery |
| 2 | `animacja:wave_big` | `#F8F804` | Wysoka fala |
| 3 | `animacja:wave_slow` | `#F8F808` | Wolna fala |
| 4 | `animacja:wave_fast` | `#F8F80C` | Szybka fala |
| 5 | `animacja:shake` | `#F8F814` | Losowe trzęsienie |
| 6 | `animacja:shake_fast` | `#F8F818` | Szybkie trzęsienie |
| 7 | `animacja:shake_mega` | `#F8F81C` | Mocne trzęsienie |
| 8 | `animacja:tremor` | `#F8F820` | Drobne drżenie |
| 9 | `animacja:rainbow` | `#F8F824` | Tęczowy przebieg kolorów |
| 10 | `animacja:bouncy` | `#F8F82C` | Podskoki |
| 11 | `animacja:blinking` | `#F8F834` | Miganie |
| 12 | `animacja:pulse` | `#F8F83C` | Pulsowanie |
| 13 | `animacja:heartbeat` | `#F8F844` | Uderzenia serca |
| 14 | `animacja:spin` | `#F8F848` | Obrót (przewracanie) |
| 15 | `animacja:flip` | `#F8F850` | Przewracanie liter kolejno |
| 16 | `animacja:fade` | `#F8F858` | Zanikanie i pojawianie |
| 17 | `animacja:breathe` | `#F8F85C` | Delikatny oddech |
| 18 | `animacja:flicker` | `#F8F860` | Szybkie migotanie |
| 19 | `animacja:jump` | `#F8F864` | Skoki liter kolejno |
| 20 | `animacja:glitch` | `#F8F868` | Glicz / losowe przesunięcia |
| 21 | `animacja:glitch_soft` | `#F8F86C` | Delikatny glicz |
| 22 | `animacja:float` | `#F8F884` | Unoszenie góra-dół |
| 23 | `animacja:sway` | `#F8F888` | Kołysanie na boki |
| 24 | `animacja:zigzag` | `#F8F88C` | Literki na zmianę w górę/dół |
| 25 | `animacja:wobble` | `#F8F890` | Chodzenie na zmianę |
| 26 | `animacja:fall` | `#F8F894` | Spadanie tekstu |
| 27 | `animacja:rise` | `#F8F898` | Wznoszenie tekstu |
| 28 | `animacja:orbit` | `#F8F89C` | Krążenie liter po okręgu |
| 29 | `animacja:drift` | `#F8F8A0` | Dryfowanie po przekątnej |
| 30 | `animacja:type` | `#F8F8A4` | Pisanie maszynowe |
| 31 | `animacja:erase` | `#F8F8A8` | Kasowanie liter kolejno |
| 32 | `animacja:gradient_gd` | `#F8F8AC` | Gradient zielony→żółty |
| 33 | `animacja:gradient_rb` | `#F8F8B0` | Gradient czerwony→niebieski |
| 34 | `animacja:gradient_anim` | `#F8F8B4` | Animowany gradient |
| 35 | `animacja:lava` | `#F8F8B8` | Płynąca lawa |
| 36 | `animacja:aurora` | `#F8F8BC` | Aurora (3 kolory) |
| 37 | `animacja:fire` | `#F8F8C0` | Ogień |
| 38 | `animacja:ice` | `#F8F8C4` | Lód |
| 39 | `animacja:gold` | `#F8F8C8` | Złoto |
| 40 | `animacja:split` | `#F8F8CC` | Rozdzielanie liter na pół |
| 41 | `animacja:outline` | `#F8F8D0` | Kontur wokół liter |
| 42 | `animacja:hatch` | `#F8F8D4` | Kreskowanie |
| 43 | `animacja:neon` | `#F8F8D8` | Neonowy blask |
| 44 | `animacja:neon_pink` | `#F8F8DC` | Różowy neon |
| 45 | `animacja:chroma` | `#F8F8E0` | Aberracja chromatyczna |
| 46 | `animacja:extrude` | `#F8F8E4` | 3D / cień głębokości |
| 47 | `animacja:extrude_deep` | `#F8F8E8` | Głębokie 3D |
| 48 | `animacja:noise` | `#F8F8EC` | Szum / statyczny |
| 49 | `animacja:liquid` | `#F8F8F0` | Płynna ciecz |
| 50 | `animacja:water` | `#F8F8F4` | Wypełnianie wodą |
| 51 | `animacja:water_tall` | `#F8F8F8` | Woda do góry (85%) |
| 52 | `animacja:mega` | `#F0F090` | Fala + trzęsienie + tęcza |
| 53 | `animacja:blask` | `#E8E800` | Błyszczący przebieg światła po literach |
| 54 | `animacja:blask_wave` | `#E8E804` | Blask + fala |
| 55 | `animacja:blask_shake` | `#E8E808` | Blask + trzęsienie |
| 56 | `animacja:iskry` | `#E8E80C` | Rozbłyskujące iskierki / gwiazdki na literach |
| 57 | `animacja:iskry_float` | `#E8E810` | Iskry + unoszenie |
| 58 | `animacja:iskry_bouncy` | `#E8E814` | Iskry + podskoki |
| 59 | `animacja:plomien` | `#E8E818` | Płomienie na literach |
| 60 | `animacja:plomien_wave` | `#E8E81C` | Płomienie + fala |
| 61 | `animacja:plomien_shake` | `#E8E820` | Płomienie + trzęsienie |
| 62 | `animacja:popcorn` | `#E8E824` | Literki wyskakują jak kukurydza |
| 63 | `animacja:eksplozja` | `#E8E828` | Literki eksplodują na zewnątrz (z zanikiem) |
| 64 | `animacja:winda` | `#E8E82C` | Tekst wjeżdża z dołu (pętla) |
| 65 | `animacja:deszcz` | `#E8E830` | Tekst spada jak deszcz (pętla) |
| 66 | `animacja:mrugacz` | `#E8E834` | Losowe literki znikają i wracają |
| 67 | `animacja:skoczki` | `#E8E838` | Górne litery podskakują jak piłeczki |
| 68 | `animacja:mega_blask` | `#E8E83C` | Fala + trzęsienie + blask |
| 69 | `animacja:laser` | `#E0E004` | Laserowy skan przeszywający litery |
| 70 | `animacja:holo` | `#E0E008` | Hologram (scanlines + migotanie) |
| 71 | `animacja:glitch_hard` | `#E0E00C` | Twardy glicz: bloki wysuwają się + separacja RGB |
| 72 | `animacja:matrix` | `#E0E010` | Zielony deszcz kodu (Matrix) |
| 73 | `animacja:caustics` | `#E0E014` | Podwodne kaustyki (sieć światła) |
| 74 | `animacja:warp` | `#E0E018` | Roztapianie / wir UV |
| 75 | `animacja:krysztal` | `#E0E01C` | Fasetowany kryształ z błyskami |
| 76 | `animacja:portal` | `#E0E020` | Wirujący fioletowy portal |
| 77 | `animacja:xray` | `#E0E024` | Prześwietlenie (świecące obrysy + skan) |
| 78 | `animacja:termowizja` | `#E0E028` | Animowana paleta kamery termowizyjnej |
| 79 | `animacja:tornado` | `#E0E02C` | Literki wirowają jak w tornado |
| 80 | `animacja:wahadlo` | `#E0E030` | Literki huśtają się jak wahadła |
| 81 | `animacja:wibracja` | `#E0E034` | Wysokoczęstotliwościowa wibracja |
| 82 | `animacja:przegon` | `#E0E038` | Fala przelatuje przez litery |
| 83 | `animacja:bumper` | `#E0E03C` | Literki podskakują sekwencyjnie |
| 84 | `animacja:harmonijka` | `#E0E040` | Literki składają się i rozchodzą |
| 85 | `animacja:laser_wavy` | `#E0E044` | Laser + fala |
| 86 | `animacja:laser_shake` | `#E0E048` | Laser + trzęsienie |
| 87 | `animacja:holo_float` | `#E0E04C` | Hologram + unoszenie |
| 88 | `animacja:holo_shake` | `#E0E050` | Hologram + trzęsienie |
| 89 | `animacja:glitch_killer` | `#E0E054` | Twardy glicz + trzęsienie |
| 90 | `animacja:matrix_shake` | `#E0E058` | Matrix + trzęsienie |
| 91 | `animacja:caustics_float` | `#E0E05C` | Kaustyki + unoszenie |
| 92 | `animacja:warp_breathe` | `#E0E060` | Roztapianie + oddech |
| 93 | `animacja:krysztal_pulse` | `#E0E064` | Kryształ + pulsowanie |
| 94 | `animacja:portal_spin` | `#E0E068` | Portal + obrót |
| 95 | `animacja:xray_flicker` | `#E0E06C` | Prześwietlenie + migotanie |
| 96 | `animacja:thermo_wavy` | `#E0E070` | Termowizja + fala |
| 97 | `animacja:tornado_rainbow` | `#E0E074` | Tornado + tęcza |
| 98 | `animacja:tornado_blask` | `#E0E078` | Tornado + blask |
| 99 | `animacja:wahadlo_gold` | `#E0E07C` | Wahadła + złoto |
| 100 | `animacja:przegon_neon` | `#E0E080` | Przegon + neon |
| 101 | `animacja:bumper_bouncy` | `#E0E084` | Bumper + podskoki |
| 102 | `animacja:harmonijka_glitch` | `#E0E088` | Harmonijka + glicz |
| 103 | `animacja:mega_2` | `#E0E08C` | Tornado + trzęsienie + blask |
| 104 | `animacja:mega_cyber` | `#E0E090` | Fala + trzęsienie + twardy glicz |
| 105 | `animacja:neon_puls` | `#D8D800` | Pulsujący neonowy blask (oddychająca poświata) |
| 106 | `animacja:szklo` | `#D8D804` | Szklisty metaliczny blask (ostry refleks) |
| 107 | `animacja:zloty_blask` | `#D8D808` | Złoty blask (błysk po złocie) |
| 108 | `animacja:diamet` | `#D8D80C` | Diament (mocne białoniebieskie iskrzenie) |
| 109 | `animacja:krew` | `#D8D810` | Ciemnoczerwone krople spływające po literach |
| 110 | `animacja:pianka` | `#D8D814` | Bąbelki wypływające w górę |
| 111 | `animacja:dym` | `#D8D818` | Dym unoszący się z liter |
| 112 | `animacja:piorun` | `#D8D81C` | Błyski piorunowe (losowe rozbłyski) |
| 113 | `animacja:radioaktywny` | `#D8D820` | Trujące zielone światło z szumem |
| 114 | `animacja:pulsar` | `#D8D824` | Rozszerzające się pierścienie |
| 115 | `animacja:galaktyka` | `#D8D828` | Galaktyka (mgławica + migoczące gwiazdy) |
| 116 | `animacja:tron` | `#D8D82C` | Neonowa siatka (styl Tron) |
| 117 | `animacja:prizma` | `#D8D830` | Prizma (każdy wiersz w innym kolorze, animowane) |
| 118 | `animacja:cukierek` | `#D8D834` | Cukierkowe paski (przesuwane) |
| 119 | `animacja:ocean` | `#D8D838` | Ocean (fale + biała piana) |
| 120 | `animacja:czarna_dziura` | `#D8D83C` | Czarna dziura (litery wciągane w środek) |
| 121 | `animacja:mrozy` | `#D8D840` | Mrozy (kryształowa siatka + błyski) |
| 122 | `animacja:magma` | `#D8D844` | Magma (ciemna skała + świecące pęknięcia) |
| 123 | `animacja:plasma` | `#D8D848` | Płynąca plazma (fioletowa/zieleń) |
| 124 | `animacja:aureola` | `#D8D84C` | Tęczowa aureola wokół liter |
| 125 | `animacja:karuzela` | `#D8D850` | Literki krążą po kole (karuzela) |
| 126 | `animacja:spirala` | `#D8D854` | Literki wirują w spiralę (wypychanie/wciąganie) |
| 127 | `animacja:pociag` | `#D8D858` | Literki jadą jak wagoniki (fala po przekątnej) |
| 128 | `animacja:burza` | `#D8D85C` | Literki teleportują się losowo (burza) |
| 129 | `animacja:titan` | `#D8D860` | Wolna gigantyczna fala |
| 130 | `animacja:metronom` | `#D8D864` | Szybkie huśtanie jak metronom |
| 131 | `animacja:fala_3d` | `#D8D868` | Fala 3D (iluzja przestrzennej fali) |
| 132 | `animacja:piorka` | `#D8D86C` | Piórka (powolne dryfowanie w dół + kołysanie) |
| 133 | `animacja:glow_wavy` | `#D8D870` | Neonowy puls + fala |
| 134 | `animacja:szklo_shake` | `#D8D874` | Szkło + trzęsienie |
| 135 | `animacja:zloty_bouncy` | `#D8D878` | Złoty blask + podskoki |
| 136 | `animacja:diamet_float` | `#D8D87C` | Diamet + unoszenie |
| 137 | `animacja:krew_shake` | `#D8D880` | Krew + trzęsienie |
| 138 | `animacja:piorun_shake` | `#D8D884` | Piorun + trzęsienie |
| 139 | `animacja:pulsar_breathe` | `#D8D888` | Pulsar + oddech |
| 140 | `animacja:galaktyka_spin` | `#D8D88C` | Galaktyka + obrót |
| 141 | `animacja:tron_holo` | `#D8D890` | Tron + hologram |
| 142 | `animacja:prizma_wavy` | `#D8D894` | Prizma + fala |
| 143 | `animacja:ocean_wavy` | `#D8D898` | Ocean + fala |
| 144 | `animacja:dziura_shake` | `#D8D89C` | Czarna dziura + trzęsienie |
| 145 | `animacja:mrozy_float` | `#D8D8A0` | Mrozy + unoszenie |
| 146 | `animacja:magma_shake` | `#D8D8A4` | Magma + trzęsienie |
| 147 | `animacja:plasma_breathe` | `#D8D8A8` | Plazma + oddech |
| 148 | `animacja:karuzela_rainbow` | `#D8D8AC` | Karuzela + tęcza |
| 149 | `animacja:aureola_wavy` | `#D8D8B0` | Aureola + fala |
| 150 | `animacja:cukierek_shake` | `#D8D8B4` | Cukierek + trzęsienie |

## Wszystkie rozkazy /tellraw

Każdy z 150 tagów jako gotowy rozkaz (tekst `Test`):

```
/tellraw @a {"text":"Test","color":"#F8F800"}
/tellraw @a {"text":"Test","color":"#F8F804"}
/tellraw @a {"text":"Test","color":"#F8F808"}
/tellraw @a {"text":"Test","color":"#F8F80C"}
/tellraw @a {"text":"Test","color":"#F8F814"}
/tellraw @a {"text":"Test","color":"#F8F818"}
/tellraw @a {"text":"Test","color":"#F8F81C"}
/tellraw @a {"text":"Test","color":"#F8F820"}
/tellraw @a {"text":"Test","color":"#F8F824"}
/tellraw @a {"text":"Test","color":"#F8F82C"}
/tellraw @a {"text":"Test","color":"#F8F834"}
/tellraw @a {"text":"Test","color":"#F8F83C"}
/tellraw @a {"text":"Test","color":"#F8F844"}
/tellraw @a {"text":"Test","color":"#F8F848"}
/tellraw @a {"text":"Test","color":"#F8F850"}
/tellraw @a {"text":"Test","color":"#F8F858"}
/tellraw @a {"text":"Test","color":"#F8F85C"}
/tellraw @a {"text":"Test","color":"#F8F860"}
/tellraw @a {"text":"Test","color":"#F8F864"}
/tellraw @a {"text":"Test","color":"#F8F868"}
/tellraw @a {"text":"Test","color":"#F8F86C"}
/tellraw @a {"text":"Test","color":"#F8F884"}
/tellraw @a {"text":"Test","color":"#F8F888"}
/tellraw @a {"text":"Test","color":"#F8F88C"}
/tellraw @a {"text":"Test","color":"#F8F890"}
/tellraw @a {"text":"Test","color":"#F8F894"}
/tellraw @a {"text":"Test","color":"#F8F898"}
/tellraw @a {"text":"Test","color":"#F8F89C"}
/tellraw @a {"text":"Test","color":"#F8F8A0"}
/tellraw @a {"text":"Test","color":"#F8F8A4"}
/tellraw @a {"text":"Test","color":"#F8F8A8"}
/tellraw @a {"text":"Test","color":"#F8F8AC"}
/tellraw @a {"text":"Test","color":"#F8F8B0"}
/tellraw @a {"text":"Test","color":"#F8F8B4"}
/tellraw @a {"text":"Test","color":"#F8F8B8"}
/tellraw @a {"text":"Test","color":"#F8F8BC"}
/tellraw @a {"text":"Test","color":"#F8F8C0"}
/tellraw @a {"text":"Test","color":"#F8F8C4"}
/tellraw @a {"text":"Test","color":"#F8F8C8"}
/tellraw @a {"text":"Test","color":"#F8F8CC"}
/tellraw @a {"text":"Test","color":"#F8F8D0"}
/tellraw @a {"text":"Test","color":"#F8F8D4"}
/tellraw @a {"text":"Test","color":"#F8F8D8"}
/tellraw @a {"text":"Test","color":"#F8F8DC"}
/tellraw @a {"text":"Test","color":"#F8F8E0"}
/tellraw @a {"text":"Test","color":"#F8F8E4"}
/tellraw @a {"text":"Test","color":"#F8F8E8"}
/tellraw @a {"text":"Test","color":"#F8F8EC"}
/tellraw @a {"text":"Test","color":"#F8F8F0"}
/tellraw @a {"text":"Test","color":"#F8F8F4"}
/tellraw @a {"text":"Test","color":"#F8F8F8"}
/tellraw @a {"text":"Test","color":"#F0F090"}
/tellraw @a {"text":"Test","color":"#E8E800"}
/tellraw @a {"text":"Test","color":"#E8E804"}
/tellraw @a {"text":"Test","color":"#E8E808"}
/tellraw @a {"text":"Test","color":"#E8E80C"}
/tellraw @a {"text":"Test","color":"#E8E810"}
/tellraw @a {"text":"Test","color":"#E8E814"}
/tellraw @a {"text":"Test","color":"#E8E818"}
/tellraw @a {"text":"Test","color":"#E8E81C"}
/tellraw @a {"text":"Test","color":"#E8E820"}
/tellraw @a {"text":"Test","color":"#E8E824"}
/tellraw @a {"text":"Test","color":"#E8E828"}
/tellraw @a {"text":"Test","color":"#E8E82C"}
/tellraw @a {"text":"Test","color":"#E8E830"}
/tellraw @a {"text":"Test","color":"#E8E834"}
/tellraw @a {"text":"Test","color":"#E8E838"}
/tellraw @a {"text":"Test","color":"#E8E83C"}
/tellraw @a {"text":"Test","color":"#E0E004"}
/tellraw @a {"text":"Test","color":"#E0E008"}
/tellraw @a {"text":"Test","color":"#E0E00C"}
/tellraw @a {"text":"Test","color":"#E0E010"}
/tellraw @a {"text":"Test","color":"#E0E014"}
/tellraw @a {"text":"Test","color":"#E0E018"}
/tellraw @a {"text":"Test","color":"#E0E01C"}
/tellraw @a {"text":"Test","color":"#E0E020"}
/tellraw @a {"text":"Test","color":"#E0E024"}
/tellraw @a {"text":"Test","color":"#E0E028"}
/tellraw @a {"text":"Test","color":"#E0E02C"}
/tellraw @a {"text":"Test","color":"#E0E030"}
/tellraw @a {"text":"Test","color":"#E0E034"}
/tellraw @a {"text":"Test","color":"#E0E038"}
/tellraw @a {"text":"Test","color":"#E0E03C"}
/tellraw @a {"text":"Test","color":"#E0E040"}
/tellraw @a {"text":"Test","color":"#E0E044"}
/tellraw @a {"text":"Test","color":"#E0E048"}
/tellraw @a {"text":"Test","color":"#E0E04C"}
/tellraw @a {"text":"Test","color":"#E0E050"}
/tellraw @a {"text":"Test","color":"#E0E054"}
/tellraw @a {"text":"Test","color":"#E0E058"}
/tellraw @a {"text":"Test","color":"#E0E05C"}
/tellraw @a {"text":"Test","color":"#E0E060"}
/tellraw @a {"text":"Test","color":"#E0E064"}
/tellraw @a {"text":"Test","color":"#E0E068"}
/tellraw @a {"text":"Test","color":"#E0E06C"}
/tellraw @a {"text":"Test","color":"#E0E070"}
/tellraw @a {"text":"Test","color":"#E0E074"}
/tellraw @a {"text":"Test","color":"#E0E078"}
/tellraw @a {"text":"Test","color":"#E0E07C"}
/tellraw @a {"text":"Test","color":"#E0E080"}
/tellraw @a {"text":"Test","color":"#E0E084"}
/tellraw @a {"text":"Test","color":"#E0E088"}
/tellraw @a {"text":"Test","color":"#E0E08C"}
/tellraw @a {"text":"Test","color":"#E0E090"}
/tellraw @a {"text":"Test","color":"#D8D800"}
/tellraw @a {"text":"Test","color":"#D8D804"}
/tellraw @a {"text":"Test","color":"#D8D808"}
/tellraw @a {"text":"Test","color":"#D8D80C"}
/tellraw @a {"text":"Test","color":"#D8D810"}
/tellraw @a {"text":"Test","color":"#D8D814"}
/tellraw @a {"text":"Test","color":"#D8D818"}
/tellraw @a {"text":"Test","color":"#D8D81C"}
/tellraw @a {"text":"Test","color":"#D8D820"}
/tellraw @a {"text":"Test","color":"#D8D824"}
/tellraw @a {"text":"Test","color":"#D8D828"}
/tellraw @a {"text":"Test","color":"#D8D82C"}
/tellraw @a {"text":"Test","color":"#D8D830"}
/tellraw @a {"text":"Test","color":"#D8D834"}
/tellraw @a {"text":"Test","color":"#D8D838"}
/tellraw @a {"text":"Test","color":"#D8D83C"}
/tellraw @a {"text":"Test","color":"#D8D840"}
/tellraw @a {"text":"Test","color":"#D8D844"}
/tellraw @a {"text":"Test","color":"#D8D848"}
/tellraw @a {"text":"Test","color":"#D8D84C"}
/tellraw @a {"text":"Test","color":"#D8D850"}
/tellraw @a {"text":"Test","color":"#D8D854"}
/tellraw @a {"text":"Test","color":"#D8D858"}
/tellraw @a {"text":"Test","color":"#D8D85C"}
/tellraw @a {"text":"Test","color":"#D8D860"}
/tellraw @a {"text":"Test","color":"#D8D864"}
/tellraw @a {"text":"Test","color":"#D8D868"}
/tellraw @a {"text":"Test","color":"#D8D86C"}
/tellraw @a {"text":"Test","color":"#D8D870"}
/tellraw @a {"text":"Test","color":"#D8D874"}
/tellraw @a {"text":"Test","color":"#D8D878"}
/tellraw @a {"text":"Test","color":"#D8D87C"}
/tellraw @a {"text":"Test","color":"#D8D880"}
/tellraw @a {"text":"Test","color":"#D8D884"}
/tellraw @a {"text":"Test","color":"#D8D888"}
/tellraw @a {"text":"Test","color":"#D8D88C"}
/tellraw @a {"text":"Test","color":"#D8D890"}
/tellraw @a {"text":"Test","color":"#D8D894"}
/tellraw @a {"text":"Test","color":"#D8D898"}
/tellraw @a {"text":"Test","color":"#D8D89C"}
/tellraw @a {"text":"Test","color":"#D8D8A0"}
/tellraw @a {"text":"Test","color":"#D8D8A4"}
/tellraw @a {"text":"Test","color":"#D8D8A8"}
/tellraw @a {"text":"Test","color":"#D8D8AC"}
/tellraw @a {"text":"Test","color":"#D8D8B0"}
/tellraw @a {"text":"Test","color":"#D8D8B4"}
```

## Łączenie efektów

Zasady łączenia:

- dwa efekty wierzchołkowe (np. fala + trzęsienie) - tak
- efekt wierzchołkowy + fragmentowy (np. karuzela + neon_puls) - tak
- efekt fragmentowy + kolor/faza (np. neon + blask) - nie, fragmentowy ma pierwszeństwo
- dwa fragmentowe naraz - nie (jeden efekt fragmentowy na kolor)

Własne kombinacje dodasz w `assets/minecraft/shaders/include/_config.glsl`:

```
TEXT_EFFECT_WITH_SHADOW(rgb(248, 244, 248)) {
    apply_wavy();
    apply_rainbow();
    apply_neon(rgb(80, 220, 255), 1.5);
}
```

Nakładanie dwóch efektów jednym rozkazem przez `extra`:

```
/tellraw @a {"text":"Test","color":"#F8F800","extra":[{"text":"Test","color":"#F0F090"}]}
```

## Przykłady

- 150 gotowych rozkazów: `TUTORIAL.md` (rozdział 5)
- 1000 gotowych rozkazów: `PRZYKLADY_1000.md`

## Wersje

Pack format 7-100 (Minecraft 1.17 i nowsze, w tym 1.21.11). Overlady dla 1.21.2, 1.21.6, 26.1 i 26.2.

## Licencja

MIT. Pack oparty na TheSalt's Text Effects (MIT, TheSalt). Szczegóły w `LICENSE`.

