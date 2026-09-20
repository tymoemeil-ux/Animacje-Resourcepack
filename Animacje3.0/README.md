# Animacje Resourcepack 3.1 — Top 85

Lekki resourcepack do animowania tekstu w Minecraft Java Edition. Wersja 3.1 zawiera
**dokładnie 85** efektów: bazowe animacje, 25 nowych efektów premium i 10 efektów
hakerskich. Shader działa płynnie per klatka renderowania; przy 60 FPS animacje są
renderowane bez klatkowania. Efekty hakerskie wymagają permissionu pluginu.

## Instalacja

1. Włącz `Animacje3.0.zip` jako jedyny pack tekstowych shaderów.
2. Pack musi być aktywny u osoby, która ma widzieć animację (serwer może go wysłać graczom).
3. Nie włączaj równocześnie Animacje1.0/2.0 — wszystkie nadpisują renderer tekstu.
4. Plugin `AnimacjeHub` v2 korzysta z tego samego katalogu 85 efektów.

## Szybki przykład

```text
python3 konwerter.py '<animacja:rainbow>Witaj!</animacja>'
python3 konwerter.py --lista
```

Kolor spustowy jest niewidoczny po uruchomieniu shaderów: shader rozpoznaje go
i zamienia w żywą animację. Tekst pozostaje zwykłym komponentem Minecrafta, więc
działa w czacie, tytułach, nazwach itemów, hologramach i GUI.

## Lista efektów

| # | Efekt | Rodzina | Opis |
|---:|---|---|---|
| 1 | `blysk` | fragment | Szybkie świetlne rozbłyski |
| 2 | `neonfala` | neon | Płynąca fala neonowa |
| 3 | `tecafala` | neon | Tęczowa fala |
| 4 | `kaskada` | ruch | Kaskada światła spływająca po literach |
| 5 | `laser2` | neon | Przelatujący laser |
| 6 | `grzmot` | energia | Elektryczne, krótkie uderzenia |
| 7 | `neon` | neon | Czysty pulsujący neon |
| 8 | `neon_puls` | neon | Neon z mocnym pulsem |
| 9 | `zloty_blask` | metal | Złoty, przesuwający się blask |
| 10 | `galaktyka` | kosmos | Głębia galaktycznych kolorów |
| 11 | `piorun` | energia | Jasne wyładowania pioruna |
| 12 | `plazma` | energia | Gorąca, wirująca plazma |
| 13 | `ogien` | zywioly | Żywy ogień |
| 14 | `lod` | zywioly | Chłodny lodowy połysk |
| 15 | `diament` | klejnot | Iskrzący diament |
| 16 | `aurora` | kosmos | Zorza polarna |
| 17 | `ocean` | zywioly | Głębinowa fala oceanu |
| 18 | `neon_grad` | neon | Gradient neonowych barw |
| 19 | `chroma` | neon | Płynna zmiana chromy |
| 20 | `wave` | ruch | Delikatne falowanie |
| 21 | `rainbow` | neon | Pełna tęcza przesuwająca się po tekście |
| 22 | `glitch_hard` | cyber | Mocny cyfrowy glitch |
| 23 | `tsunami` | ruch | Duża morska fala |
| 24 | `karuzela` | ruch | Kolorowa karuzela |
| 25 | `tornado` | ruch | Wirujący tornado |
| 26 | `pulse` | energia | Równy puls |
| 27 | `heartbeat` | energia | Podwójne bicie serca |
| 28 | `ripple` | ruch | Kręgi rozchodzące się po tekście |
| 29 | `orbita` | kosmos | Orbitalny ruch światła |
| 30 | `skok` | ruch | Sprężysty skok liter |
| 31 | `spin` | ruch | Miękki obrót |
| 32 | `floaty` | ruch | Lekkie unoszenie |
| 33 | `zigzag` | ruch | Energetyczny zygzak |
| 34 | `tancuj` | ruch | Taneczny rytm |
| 35 | `lawina` | ruch | Spadająca lawina iskier |
| 36 | `dym` | zywioly | Dryfujący dym |
| 37 | `neon_deszcz` | neon | Deszcz neonowych smug |
| 38 | `konfetti` | ruch | Konfetti i świętowanie |
| 39 | `fala_wodna` | zywioly | Wodna fala od lewej do prawej |
| 40 | `spirala` | ruch | Spiralny ruch w górę |
| 41 | `metronom` | ruch | Rytmiczny metronom |
| 42 | `matrix` | cyber | Zielony kod Matrixa |
| 43 | `gwiazdy_zloto` | kosmos | Złote gwiazdy |
| 44 | `pulsar_neonowy` | kosmos | Jasny neonowy pulsar |
| 45 | `wir_galaktyka` | kosmos | Galaktyczny wir |
| 46 | `kap_wodny` | zywioly | Krople wody |
| 47 | `kometa` **NOWE** | nowe | Nowa: świetlna kometa z ogonem |
| 48 | `iskry` **NOWE** | nowe | Nowa: losowo migoczące iskry |
| 49 | `pryzmat` **NOWE** | nowe | Nowa: kryształowy pryzmat |
| 50 | `szklo` **NOWE** | nowe | Nowa: szklany połysk |
| 51 | `spectrum` **NOWE** | premium | Płynne spektrum kolorów |
| 52 | `aurora_flow` **NOWE** | premium | Wolno płynąca zorza |
| 53 | `sunset` **NOWE** | premium | Ciepły gradient zachodu słońca |
| 54 | `firefly` **NOWE** | premium | Migoczące świetliki |
| 55 | `electric` **NOWE** | premium | Szybkie elektryczne impulsy |
| 56 | `glow` **NOWE** | premium | Miękka poświata oddechu |
| 57 | `ice_crystal` **NOWE** | premium | Krystaliczny lodowy blask |
| 58 | `lava` **NOWE** | premium | Płynna lawa i żar |
| 59 | `moonlight` **NOWE** | premium | Chłodne światło księżyca |
| 60 | `starlight` **NOWE** | premium | Gwiezdne migotanie |
| 61 | `gold_rush` **NOWE** | premium | Złoty pęd światła |
| 62 | `pixel` **NOWE** | premium | Pikselowy skok kolorów |
| 63 | `scanline` **NOWE** | premium | Cybernetyczna linia skanu |
| 64 | `wave2` **NOWE** | premium | Głęboka fala świetlna |
| 65 | `ripple2` **NOWE** | premium | Koncentryczne pulsowanie |
| 66 | `bounce` **NOWE** | premium | Sprężyste odbicie liter |
| 67 | `swing` **NOWE** | premium | Rytmiczne wychylenie |
| 68 | `jelly` **NOWE** | premium | Miękkie żelowe falowanie |
| 69 | `orbit2` **NOWE** | premium | Kolorowa orbita |
| 70 | `comet2` **NOWE** | premium | Szybka kometa neonowa |
| 71 | `sparkle` **NOWE** | premium | Czyste iskierki |
| 72 | `prism2` **NOWE** | premium | Pryzmatyczny połysk |
| 73 | `breath` **NOWE** | premium | Spokojny oddech koloru |
| 74 | `gradient` **NOWE** | premium | Elegancki gradient |
| 75 | `mirror` **NOWE** | premium | Lustrzane przejście |
| 76 | `hack_matrix` **NOWE** | hakerskie | Hakerski deszcz kodu Matrix |
| 77 | `hack_terminal` **NOWE** | hakerskie | Zielony terminal CRT |
| 78 | `hack_cyber` **NOWE** | hakerskie | Cyberpunkowy skan cyan/magenta |
| 79 | `hack_redteam` **NOWE** | hakerskie | Czerwony tryb red team |
| 80 | `hack_zeroday` **NOWE** | hakerskie | Agresywny zero-day glitch |
| 81 | `hack_root` **NOWE** | hakerskie | Fioletowy dostęp root |
| 82 | `hack_binary` **NOWE** | hakerskie | Binarny strumień danych |
| 83 | `hack_glitch` **NOWE** | hakerskie | Kompresyjny glitch terminala |
| 84 | `hack_virus` **NOWE** | hakerskie | Zielono-czerwony wirus |
| 85 | `hack_overclock` **NOWE** | hakerskie | Przegrzany overclock |

## Technicznie

- Wspólny shader importuje wyłącznie 85 par `tfx_<nazwa>.vsh`/`.fsh`.
- Każdy efekt ma własny kolor spustowy i dispatcher ID 1–85.
- Tryb custom koduje kolor #RGB/#RRGGBB w zarezerwowanym triggerze, więc działa z każdym FX.
- Pack bazuje na shader API Minecrafta 1.21.6+ i deklaruje obsługę formatów 42–110.
- `effects.json` jest źródłem prawdy dla konwertera i katalogu pluginu.

W razie problemów sprawdź log klienta po włączeniu packa. Na serwerze włącz tylko jedną
wersję packa, ponieważ shadery tekstu nie mogą być aktywne z dwóch packów naraz.
