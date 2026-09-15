# Animacje 140

Resourcepack z **140 animacjami tekstu** dla Minecraft Java Edition.

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

## Nowa generacja efektów (ostatnie 43 tagi)

Fragmentowe (piksel-po-pikselu, najładniejsze):

- **blysk** - jasny rozbłysk rozchodzący się przez tekst, **smuga** - świetlna smuga
- **iskrenice** - iskry na krawędziach, **tecafala** - płynąca tęczowa fala
- **serce** - pulsujące serce, **kula** - świetlne kule, **luk** - świetlne łuki
- **mglawica** - dryfująca mgławica, **snieg** - padający śnieg, **refleks** - przeskakujący refleks
- **kaskada** - spływająca kaskada światła, **neonfala** - neonowa fala
- **perla** - perłowy połysk, **zar** - żarzące się węgle, **firerain** - deszcz ognia
- **kolumna** - świetlne kolumny, **laser2** - laserowe skanowanie
- **odlamki** - świetlne odłamki, **grzmot** - gwałtowne rozbłyski
- **swiatlo** - migoczące źródło światła, **obrys** - świecący obrys liter
- **gwiazdy** - migoczące gwiazdy w tekście

Kinetyczne: **elastyk** (odbijanie), **zel** (drżenie żelu), **skok** (rytmiczne skakanie), **fala2** (podwójna fala), **orbit2** (krążenie po orbitach), **grzmot_w** (wstrząsy grzmotu), **tsunami** (potężna fala), **ekspres** (szybkie faliowanie), **tectno** (tętniący rytm).

Poza tym 12 gotowych kombinacji: blysk_wavy, blysk_shake, smuga_wavy, serce_heartbeat, luk_shake, snieg_float, mglawica_spin, kaskada_wavy, neonfala_bouncy, zar_shake, kula_spin i **mega_blysk** (błysk + fala + trzęsienie).

## Usunięte słabe efekty

Usunięto 53 słabe lub redundantne efekty (11 prostych wariantów, 6 wariantów generacji 2 i 36 kombinacji):

- proste warianty: `wave_slow`, `tremor`, `blinking`, `glitch_soft`, `sway`, `wobble`, `drift`, `gradient_gd`, `gradient_rb`, `outline`, `water_tall`
- generacja 2: `blask_wave`, `blask_shake`, `iskry_float`, `iskry_bouncy`, `plomien_wave`, `plomien_shake`
- kombinacje generacji 3: `laser_wavy`, `laser_shake`, `holo_float`, `holo_shake`, `glitch_killer`, `matrix_shake`, `caustics_float`, `warp_breathe`, `krysztal_pulse`, `portal_spin`, `xray_flicker`, `thermo_wavy`, `tornado_rainbow`, `tornado_blask`, `wahadlo_gold`, `przegon_neon`, `bumper_bouncy`, `harmonijka_glitch`
- kombinacje generacji 4: `glow_wavy`, `szklo_shake`, `zloty_bouncy`, `diamet_float`, `krew_shake`, `piorun_shake`, `pulsar_breathe`, `galaktyka_spin`, `tron_holo`, `prizma_wavy`, `ocean_wavy`, `dziura_shake`, `mrozy_float`, `magma_shake`, `plasma_breathe`, `karuzela_rainbow`, `aureola_wavy`, `cukierek_shake`

W zamian dodano 43 nowe, mocniejsze efekty (ostatnie 43 wiersze tabeli).

## 140 animacji

Kolor = tag. Każdy tag ma swój unikalny kolor spustowy. Wszystkie tagi są animowane.

| # | Tag | Kolor | Efekt |
|---|-----|-------|-------|
| 1 | `animacja:wave` | `#F8F800` | Fala podnosząca litery |
| 2 | `animacja:wave_big` | `#F8F804` | Wysoka fala |
| 3 | `animacja:wave_fast` | `#F8F80C` | Szybka fala |
| 4 | `animacja:shake` | `#F8F814` | Losowe trzęsienie |
| 5 | `animacja:shake_fast` | `#F8F818` | Szybkie trzęsienie |
| 6 | `animacja:shake_mega` | `#F8F81C` | Mocne trzęsienie |
| 7 | `animacja:rainbow` | `#F8F824` | Tęczowy przebieg kolorów |
| 8 | `animacja:bouncy` | `#F8F82C` | Podskoki |
| 9 | `animacja:pulse` | `#F8F83C` | Pulsowanie |
| 10 | `animacja:heartbeat` | `#F8F844` | Uderzenia serca |
| 11 | `animacja:spin` | `#F8F848` | Obrót (przewracanie) |
| 12 | `animacja:flip` | `#F8F850` | Przewracanie liter kolejno |
| 13 | `animacja:fade` | `#F8F858` | Zanikanie i pojawianie |
| 14 | `animacja:breathe` | `#F8F85C` | Delikatny oddech |
| 15 | `animacja:flicker` | `#F8F860` | Szybkie migotanie |
| 16 | `animacja:jump` | `#F8F864` | Skoki liter kolejno |
| 17 | `animacja:glitch` | `#F8F868` | Glicz / losowe przesunięcia |
| 18 | `animacja:float` | `#F8F884` | Unoszenie góra-dół |
| 19 | `animacja:zigzag` | `#F8F88C` | Literki na zmianę w górę/dół |
| 20 | `animacja:fall` | `#F8F894` | Spadanie tekstu |
| 21 | `animacja:rise` | `#F8F898` | Wznoszenie tekstu |
| 22 | `animacja:orbit` | `#F8F89C` | Krążenie liter po okręgu |
| 23 | `animacja:type` | `#F8F8A4` | Pisanie maszynowe |
| 24 | `animacja:erase` | `#F8F8A8` | Kasowanie liter kolejno |
| 25 | `animacja:gradient_anim` | `#F8F8B4` | Animowany gradient |
| 26 | `animacja:lava` | `#F8F8B8` | Płynąca lawa |
| 27 | `animacja:aurora` | `#F8F8BC` | Aurora (3 kolory) |
| 28 | `animacja:fire` | `#F8F8C0` | Ogień |
| 29 | `animacja:ice` | `#F8F8C4` | Lód |
| 30 | `animacja:gold` | `#F8F8C8` | Złoto |
| 31 | `animacja:split` | `#F8F8CC` | Rozdzielanie liter na pół |
| 32 | `animacja:hatch` | `#F8F8D4` | Kreskowanie |
| 33 | `animacja:neon` | `#F8F8D8` | Neonowy blask |
| 34 | `animacja:neon_pink` | `#F8F8DC` | Różowy neon |
| 35 | `animacja:chroma` | `#F8F8E0` | Aberracja chromatyczna |
| 36 | `animacja:extrude` | `#F8F8E4` | 3D / cień głębokości |
| 37 | `animacja:extrude_deep` | `#F8F8E8` | Głębokie 3D |
| 38 | `animacja:noise` | `#F8F8EC` | Szum / statyczny |
| 39 | `animacja:liquid` | `#F8F8F0` | Płynna ciecz |
| 40 | `animacja:water` | `#F8F8F4` | Wypełnianie wodą |
| 41 | `animacja:mega` | `#F0F090` | Fala + trzęsienie + tęcza |
| 42 | `animacja:blask` | `#E8E800` | Błyszczący przebieg światła po literach |
| 43 | `animacja:iskry` | `#E8E80C` | Rozbłyskujące iskierki / gwiazdki na literach |
| 44 | `animacja:plomien` | `#E8E818` | Płomienie na literach |
| 45 | `animacja:popcorn` | `#E8E824` | Literki wyskakują jak kukurydza |
| 46 | `animacja:eksplozja` | `#E8E828` | Literki eksplodują na zewnątrz (z zanikiem) |
| 47 | `animacja:winda` | `#E8E82C` | Tekst wjeżdża z dołu (pętla) |
| 48 | `animacja:deszcz` | `#E8E830` | Tekst spada jak deszcz (pętla) |
| 49 | `animacja:mrugacz` | `#E8E834` | Losowe literki znikają i wracają |
| 50 | `animacja:skoczki` | `#E8E838` | Górne litery podskakują jak piłeczki |
| 51 | `animacja:mega_blask` | `#E8E83C` | Fala + trzęsienie + blask |
| 52 | `animacja:laser` | `#E0E004` | Laserowy skan przeszywający litery |
| 53 | `animacja:holo` | `#E0E008` | Hologram (scanlines + migotanie) |
| 54 | `animacja:glitch_hard` | `#E0E00C` | Twardy glicz: bloki wysuwają się + separacja RGB |
| 55 | `animacja:matrix` | `#E0E010` | Zielony deszcz kodu (Matrix) |
| 56 | `animacja:caustics` | `#E0E014` | Podwodne kaustyki (sieć światła) |
| 57 | `animacja:warp` | `#E0E018` | Roztapianie / wir UV |
| 58 | `animacja:krysztal` | `#E0E01C` | Fasetowany kryształ z błyskami |
| 59 | `animacja:portal` | `#E0E020` | Wirujący fioletowy portal |
| 60 | `animacja:xray` | `#E0E024` | Prześwietlenie (świecące obrysy + skan) |
| 61 | `animacja:termowizja` | `#E0E028` | Animowana paleta kamery termowizyjnej |
| 62 | `animacja:tornado` | `#E0E02C` | Literki wirowają jak w tornado |
| 63 | `animacja:wahadlo` | `#E0E030` | Literki huśtają się jak wahadła |
| 64 | `animacja:wibracja` | `#E0E034` | Wysokoczęstotliwościowa wibracja |
| 65 | `animacja:przegon` | `#E0E038` | Fala przelatuje przez litery |
| 66 | `animacja:bumper` | `#E0E03C` | Literki podskakują sekwencyjnie |
| 67 | `animacja:harmonijka` | `#E0E040` | Literki składają się i rozchodzą |
| 68 | `animacja:mega_2` | `#E0E08C` | Tornado + trzęsienie + blask |
| 69 | `animacja:mega_cyber` | `#E0E090` | Fala + trzęsienie + twardy glicz |
| 70 | `animacja:neon_puls` | `#D8D800` | Pulsujący neonowy blask (oddychająca poświata) |
| 71 | `animacja:szklo` | `#D8D804` | Szklisty metaliczny blask (ostry refleks) |
| 72 | `animacja:zloty_blask` | `#D8D808` | Złoty blask (błysk po złocie) |
| 73 | `animacja:diamet` | `#D8D80C` | Diament (mocne białoniebieskie iskrzenie) |
| 74 | `animacja:krew` | `#D8D810` | Ciemnoczerwone krople spływające po literach |
| 75 | `animacja:pianka` | `#D8D814` | Bąbelki wypływające w górę |
| 76 | `animacja:dym` | `#D8D818` | Dym unoszący się z liter |
| 77 | `animacja:piorun` | `#D8D81C` | Błyski piorunowe (losowe rozbłyski) |
| 78 | `animacja:radioaktywny` | `#D8D820` | Trujące zielone światło z szumem |
| 79 | `animacja:pulsar` | `#D8D824` | Rozszerzające się pierścienie |
| 80 | `animacja:galaktyka` | `#D8D828` | Galaktyka (mgławica + migoczące gwiazdy) |
| 81 | `animacja:tron` | `#D8D82C` | Neonowa siatka (styl Tron) |
| 82 | `animacja:prizma` | `#D8D830` | Prizma (każdy wiersz w innym kolorze, animowane) |
| 83 | `animacja:cukierek` | `#D8D834` | Cukierkowe paski (przesuwane) |
| 84 | `animacja:ocean` | `#D8D838` | Ocean (fale + biała piana) |
| 85 | `animacja:czarna_dziura` | `#D8D83C` | Czarna dziura (litery wciągane w środek) |
| 86 | `animacja:mrozy` | `#D8D840` | Mrozy (kryształowa siatka + błyski) |
| 87 | `animacja:magma` | `#D8D844` | Magma (ciemna skała + świecące pęknięcia) |
| 88 | `animacja:plasma` | `#D8D848` | Płynąca plazma (fioletowa/zieleń) |
| 89 | `animacja:aureola` | `#D8D84C` | Tęczowa aureola wokół liter |
| 90 | `animacja:karuzela` | `#D8D850` | Literki krążą po kole (karuzela) |
| 91 | `animacja:spirala` | `#D8D854` | Literki wirują w spiralę (wypychanie/wciąganie) |
| 92 | `animacja:pociag` | `#D8D858` | Literki jadą jak wagoniki (fala po przekątnej) |
| 93 | `animacja:burza` | `#D8D85C` | Literki teleportują się losowo (burza) |
| 94 | `animacja:titan` | `#D8D860` | Wolna gigantyczna fala |
| 95 | `animacja:metronom` | `#D8D864` | Szybkie huśtanie jak metronom |
| 96 | `animacja:fala_3d` | `#D8D868` | Fala 3D (iluzja przestrzennej fali) |
| 97 | `animacja:piorka` | `#D8D86C` | Piórka (powolne dryfowanie w dół + kołysanie) |
| 98 | `animacja:blysk` | `#D0D000` | Błysk - jasny rozbłysk rozchodzący się przez tekst |
| 99 | `animacja:smuga` | `#D0D004` | Świetlna smuga przecinająca tekst |
| 100 | `animacja:iskrenice` | `#D0D008` | Iskry iskrzące na krawędziach liter |
| 101 | `animacja:tecafala` | `#D0D00C` | Tęczowa fala płynąca przez tekst |
| 102 | `animacja:serce` | `#D0D010` | Pulsujące serce w tekście |
| 103 | `animacja:kula` | `#D0D014` | Świetlne kule płynące po tekście |
| 104 | `animacja:luk` | `#D0D018` | Krążące świetlne łuki |
| 105 | `animacja:mglawica` | `#D0D01C` | Fioletowa mgławica dryfująca przez litery |
| 106 | `animacja:snieg` | `#D0D020` | Padający śnieg na tekście |
| 107 | `animacja:refleks` | `#D0D024` | Przeskakujący refleks świetlny |
| 108 | `animacja:kaskada` | `#D0D028` | Kaskada światła spływająca w dół |
| 109 | `animacja:neonfala` | `#D0D02C` | Neonowa fala światła |
| 110 | `animacja:perla` | `#D0D030` | Perłowy połysk z iryzacją |
| 111 | `animacja:zar` | `#D0D034` | Żarzące się węgle |
| 112 | `animacja:firerain` | `#D0D038` | Deszcz ognia |
| 113 | `animacja:kolumna` | `#D0D03C` | Świetlne kolumny przesuwające się po tekście |
| 114 | `animacja:laser2` | `#D0D040` | Laserowe skanowanie tekstu |
| 115 | `animacja:odlamki` | `#D0D044` | Rozsypujące się świetlne odłamki |
| 116 | `animacja:grzmot` | `#D0D048` | Grzmot - gwałtowne rozbłyski |
| 117 | `animacja:swiatlo` | `#D0D04C` | Migoczące źródło światła |
| 118 | `animacja:obrys` | `#D0D050` | Świecący obrys liter |
| 119 | `animacja:gwiazdy` | `#D0D054` | Migoczące gwiazdy w tekście |
| 120 | `animacja:elastyk` | `#D0D058` | Elastyczne odbijanie liter |
| 121 | `animacja:zel` | `#D0D05C` | Miękkie drżenie żelu |
| 122 | `animacja:skok` | `#D0D060` | Rytmiczne skakanie liter |
| 123 | `animacja:fala2` | `#D0D064` | Złożona podwójna fala |
| 124 | `animacja:orbit2` | `#D0D068` | Litery krążą po orbitach |
| 125 | `animacja:grzmot_w` | `#D0D06C` | Wstrząsy grzmotu |
| 126 | `animacja:tsunami` | `#D0D070` | Potężna fala tsunami |
| 127 | `animacja:ekspres` | `#D0D074` | Ekspresowe szybkie faliowanie |
| 128 | `animacja:tectno` | `#D0D078` | Tętniący rytm tecta |
| 129 | `animacja:blysk_wavy` | `#D0D07C` | Błysk + fala |
| 130 | `animacja:blysk_shake` | `#D0D080` | Błysk + trzęsienie |
| 131 | `animacja:smuga_wavy` | `#D0D084` | Smuga + fala |
| 132 | `animacja:serce_heartbeat` | `#D0D088` | Serce + rytm serca |
| 133 | `animacja:luk_shake` | `#D0D08C` | Łuki + trzęsienie |
| 134 | `animacja:snieg_float` | `#D0D090` | Śnieg + unoszenie |
| 135 | `animacja:mglawica_spin` | `#D0D094` | Mgławica + obrót |
| 136 | `animacja:kaskada_wavy` | `#D0D098` | Kaskada + fala |
| 137 | `animacja:neonfala_bouncy` | `#D0D09C` | Neonfala + podskoki |
| 138 | `animacja:zar_shake` | `#D0D0A0` | Żar + trzęsienie |
| 139 | `animacja:kula_spin` | `#D0D0A4` | Kule + obrót |
| 140 | `animacja:mega_blysk` | `#D0D0A8` | MEGA błysk: błysk + fala + trzęsienie |

## Wszystkie rozkazy /tellraw

Każdy z 140 tagów jako gotowy rozkaz (tekst `Test`):

```
/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
0
0
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
0
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
0
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
1
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
1
8
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
1
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
2
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
2
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
3
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
4
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
4
8
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
5
0
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
5
8
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
5
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
6
0
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
6
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
6
8
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
8
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
8
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
9
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
9
8
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
9
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
A
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
A
8
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
B
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
B
8
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
B
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
C
0
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
C
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
C
8
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
C
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
D
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
D
8
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
D
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
E
0
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
E
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
E
8
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
E
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
F
0
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
8
F
8
F
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
F
0
F
0
9
0
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
E
8
E
8
0
0
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
E
8
E
8
0
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
E
8
E
8
1
8
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
E
8
E
8
2
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
E
8
E
8
2
8
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
E
8
E
8
2
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
E
8
E
8
3
0
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
E
8
E
8
3
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
E
8
E
8
3
8
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
E
8
E
8
3
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
E
0
E
0
0
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
E
0
E
0
0
8
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
E
0
E
0
0
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
E
0
E
0
1
0
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
E
0
E
0
1
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
E
0
E
0
1
8
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
E
0
E
0
1
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
E
0
E
0
2
0
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
E
0
E
0
2
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
E
0
E
0
2
8
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
E
0
E
0
2
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
E
0
E
0
3
0
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
E
0
E
0
3
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
E
0
E
0
3
8
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
E
0
E
0
3
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
E
0
E
0
4
0
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
E
0
E
0
8
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
E
0
E
0
9
0
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
8
D
8
0
0
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
8
D
8
0
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
8
D
8
0
8
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
8
D
8
0
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
8
D
8
1
0
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
8
D
8
1
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
8
D
8
1
8
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
8
D
8
1
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
8
D
8
2
0
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
8
D
8
2
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
8
D
8
2
8
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
8
D
8
2
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
8
D
8
3
0
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
8
D
8
3
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
8
D
8
3
8
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
8
D
8
3
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
8
D
8
4
0
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
8
D
8
4
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
8
D
8
4
8
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
8
D
8
4
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
8
D
8
5
0
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
8
D
8
5
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
8
D
8
5
8
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
8
D
8
5
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
8
D
8
6
0
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
8
D
8
6
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
8
D
8
6
8
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
8
D
8
6
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
0
0
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
0
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
0
8
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
0
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
1
0
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
1
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
1
8
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
1
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
2
0
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
2
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
2
8
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
2
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
3
0
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
3
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
3
8
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
3
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
4
0
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
4
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
4
8
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
4
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
5
0
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
5
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
5
8
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
5
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
6
0
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
6
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
6
8
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
6
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
7
0
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
7
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
7
8
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
7
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
8
0
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
8
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
8
8
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
8
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
9
0
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
9
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
9
8
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
9
C
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
A
0
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
A
4
"
}


/
t
e
l
l
r
a
w
 
@
a
 
{
"
t
e
x
t
"
:
"
T
e
s
t
"
,
"
c
o
l
o
r
"
:
"
#
D
0
D
0
A
8
"
}
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
/tellraw @a {"text":"Test","color":"#F8F800"}
/tellraw @a {"text":"Test","color":"#F8F804"}
/tellraw @a {"text":"Test","color":"#F8F80C"}
/tellraw @a {"text":"Test","color":"#F8F814"}
/tellraw @a {"text":"Test","color":"#F8F818"}
/tellraw @a {"text":"Test","color":"#F8F81C"}
/tellraw @a {"text":"Test","color":"#F8F824"}
/tellraw @a {"text":"Test","color":"#F8F82C"}
/tellraw @a {"text":"Test","color":"#F8F83C"}
/tellraw @a {"text":"Test","color":"#F8F844"}
/tellraw @a {"text":"Test","color":"#F8F848"}
/tellraw @a {"text":"Test","color":"#F8F850"}
/tellraw @a {"text":"Test","color":"#F8F858"}
/tellraw @a {"text":"Test","color":"#F8F85C"}
/tellraw @a {"text":"Test","color":"#F8F860"}
/tellraw @a {"text":"Test","color":"#F8F864"}
/tellraw @a {"text":"Test","color":"#F8F868"}
/tellraw @a {"text":"Test","color":"#F8F884"}
/tellraw @a {"text":"Test","color":"#F8F88C"}
/tellraw @a {"text":"Test","color":"#F8F894"}
/tellraw @a {"text":"Test","color":"#F8F898"}
/tellraw @a {"text":"Test","color":"#F8F89C"}
/tellraw @a {"text":"Test","color":"#F8F8A4"}
/tellraw @a {"text":"Test","color":"#F8F8A8"}
/tellraw @a {"text":"Test","color":"#F8F8B4"}
/tellraw @a {"text":"Test","color":"#F8F8B8"}
/tellraw @a {"text":"Test","color":"#F8F8BC"}
/tellraw @a {"text":"Test","color":"#F8F8C0"}
/tellraw @a {"text":"Test","color":"#F8F8C4"}
/tellraw @a {"text":"Test","color":"#F8F8C8"}
/tellraw @a {"text":"Test","color":"#F8F8CC"}
/tellraw @a {"text":"Test","color":"#F8F8D4"}
/tellraw @a {"text":"Test","color":"#F8F8D8"}
/tellraw @a {"text":"Test","color":"#F8F8DC"}
/tellraw @a {"text":"Test","color":"#F8F8E0"}
/tellraw @a {"text":"Test","color":"#F8F8E4"}
/tellraw @a {"text":"Test","color":"#F8F8E8"}
/tellraw @a {"text":"Test","color":"#F8F8EC"}
/tellraw @a {"text":"Test","color":"#F8F8F0"}
/tellraw @a {"text":"Test","color":"#F8F8F4"}
/tellraw @a {"text":"Test","color":"#F0F090"}
/tellraw @a {"text":"Test","color":"#E8E800"}
/tellraw @a {"text":"Test","color":"#E8E80C"}
/tellraw @a {"text":"Test","color":"#E8E818"}
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
/tellraw @a {"text":"Test","color":"#D0D000"}
/tellraw @a {"text":"Test","color":"#D0D004"}
/tellraw @a {"text":"Test","color":"#D0D008"}
/tellraw @a {"text":"Test","color":"#D0D00C"}
/tellraw @a {"text":"Test","color":"#D0D010"}
/tellraw @a {"text":"Test","color":"#D0D014"}
/tellraw @a {"text":"Test","color":"#D0D018"}
/tellraw @a {"text":"Test","color":"#D0D01C"}
/tellraw @a {"text":"Test","color":"#D0D020"}
/tellraw @a {"text":"Test","color":"#D0D024"}
/tellraw @a {"text":"Test","color":"#D0D028"}
/tellraw @a {"text":"Test","color":"#D0D02C"}
/tellraw @a {"text":"Test","color":"#D0D030"}
/tellraw @a {"text":"Test","color":"#D0D034"}
/tellraw @a {"text":"Test","color":"#D0D038"}
/tellraw @a {"text":"Test","color":"#D0D03C"}
/tellraw @a {"text":"Test","color":"#D0D040"}
/tellraw @a {"text":"Test","color":"#D0D044"}
/tellraw @a {"text":"Test","color":"#D0D048"}
/tellraw @a {"text":"Test","color":"#D0D04C"}
/tellraw @a {"text":"Test","color":"#D0D050"}
/tellraw @a {"text":"Test","color":"#D0D054"}
/tellraw @a {"text":"Test","color":"#D0D058"}
/tellraw @a {"text":"Test","color":"#D0D05C"}
/tellraw @a {"text":"Test","color":"#D0D060"}
/tellraw @a {"text":"Test","color":"#D0D064"}
/tellraw @a {"text":"Test","color":"#D0D068"}
/tellraw @a {"text":"Test","color":"#D0D06C"}
/tellraw @a {"text":"Test","color":"#D0D070"}
/tellraw @a {"text":"Test","color":"#D0D074"}
/tellraw @a {"text":"Test","color":"#D0D078"}
/tellraw @a {"text":"Test","color":"#D0D07C"}
/tellraw @a {"text":"Test","color":"#D0D080"}
/tellraw @a {"text":"Test","color":"#D0D084"}
/tellraw @a {"text":"Test","color":"#D0D088"}
/tellraw @a {"text":"Test","color":"#D0D08C"}
/tellraw @a {"text":"Test","color":"#D0D090"}
/tellraw @a {"text":"Test","color":"#D0D094"}
/tellraw @a {"text":"Test","color":"#D0D098"}
/tellraw @a {"text":"Test","color":"#D0D09C"}
/tellraw @a {"text":"Test","color":"#D0D0A0"}
/tellraw @a {"text":"Test","color":"#D0D0A4"}
/tellraw @a {"text":"Test","color":"#D0D0A8"}
```

## Przykłady

- **Najlepsze / mega dobre:** `MEGA_KOMENDY.md` (wybrane perełki z TOP 10)
- 140 gotowych rozkazów: `TUTORIAL.md` (rozdział 5)
- 1000 gotowych rozkazów: `PRZYKLADY_1000.md`

## Wersje

Pack format 7-100 (Minecraft 1.17 i nowsze, w tym 1.21.11). Overlady dla 1.21.2, 1.21.6, 26.1 i 26.2.

## Licencja

MIT. Pack oparty na TheSalt's Text Effects (MIT, TheSalt). Szczegóły w `LICENSE`.

