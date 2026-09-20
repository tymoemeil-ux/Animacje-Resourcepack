# Animacje Resourcepack 3.0 — Top 50

Lekki resourcepack do animowania tekstu w Minecraft Java Edition. Wersja 3.0 została
odchudzona do **dokładnie 50** najbardziej efektownych animacji. Zostawiono różne style:
neon, ogień i lód, kosmos, cyber, ruch oraz efekty imprezowe. Cztery efekty oznaczone
`NOWE` powstały specjalnie w tej wersji.

## Instalacja

1. Włącz `Animacje3.0.zip` jako jedyny pack tekstowych shaderów.
2. Pack musi być aktywny u osoby, która ma widzieć animację (serwer może go wysłać graczom).
3. Nie włączaj równocześnie Animacje1.0/2.0 — wszystkie nadpisują renderer tekstu.
4. Plugin `AnimacjeHub` v2 korzysta z tego samego katalogu 50 efektów.

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

## Technicznie

- Wspólny shader importuje wyłącznie 50 par `tfx_<nazwa>.vsh`/`.fsh`.
- Każdy efekt ma własny kolor spustowy i dispatcher ID 1–50.
- Pack bazuje na shader API Minecrafta 1.21.6+ i deklaruje obsługę formatów 42–110.
- `effects.json` jest źródłem prawdy dla konwertera i katalogu pluginu.

W razie problemów sprawdź log klienta po włączeniu packa. Na serwerze włącz tylko jedną
wersję packa, ponieważ shadery tekstu nie mogą być aktywne z dwóch packów naraz.
