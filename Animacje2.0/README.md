# Animacje 2.0 — nowy silnik efektów tekstu

Resourcepack, który animuje tekst w czacie Minecraft. **75 efektów animowanych + 11 czystych kolorów.** Każdy efekt to **połączenie koloru i ruchu**.
Zbudowany od zera: każdy efekt ma **osobny plik**, wspólny silnik jest mały i czytelny.

> Instaluj TYLKO JEDEN pack animacji naraz (1.0 i 2.0 konfliktują — oba nadpisują render tekstu).

## Jak to działa
1. `konwerter.py` zamienia `<animacja:NAZWA>tekst</animacja>` na gotowy rozkaz `/tellraw` z kolorem spustowym.
2. Shader (VSH) rozpoznaje dokładny kolor znaku i:
   - **efekt kinetyczny** (14–25, 39–50) — przesuwa/odwraca całe znaki w przestrzeni ekranu,
   - **efekt fragmentowy** (1–13, 26–38) — koloruje piksele znaku w czasie (FSH).
3. Kolor bez efektu = zwykły tekst (dlatego "czyste kolory" niczego nie uruchamiają).

## 75 efektów animowanych (każdy = kolor + ruch)

### Fragmentowe (kolor pikseli zmienia się w czasie)
| Tag | Kolor | Co robi |
|---|---|---|
| `blysk` | `#A0A000` | jasna iskra z ogonem przetacza się przez tekst |
| `neonfala` | `#A0A004` | neonowa fala kolorów (tęcza w tonie neonu) |
| `tecafala` | `#A0A008` | przesuwająca się taśma pełnego spektrum |
| `kaskada` | `#A0A00C` | spadające metaliczne pasma (złoto) |
| `laser2` | `#A0A010` | poziomy snop lasera skanuje tekst |
| `grzmot` | `#A0A014` | losowe białe błyski piorunów |
| `obrys` | `#A0A018` | pulsujący pomarańczowy obrys znaków (wnętrze ciemne) |
| `neon` | `#A0A01C` | pulsująca cyan-owa poświata |
| `neon_puls` | `#A0A020` | ostre, szybkie pulsowanie (magenta) |
| `zloty_blask` | `#A0A024` | złoty blask + przesuwający się połysk |
| `galaktyka` | `#A0A028` | fioletowo-niebieska mgławica + mieniące gwiazdki |
| `krew` | `#A0A02C` | pulsująca, cętkowana czerwień |
| `piorun` | `#A0A030` | szybkie migotanie + rzadkie mocne rozbłyski |
| `plazma` | `#A0A034` | **animowana plazma — nakładające się fale kolorów** |
| `ogien` | `#A0A038` | **ogień — iskrzące piksele: czerwień → pomarańcz → żółty** |
| `lod` | `#A0A03C` | **lód — zimna błękitność z ruchomymi iskrzeniami** |
| `diament` | `#A0A040` | **diament — jasny blask przetacza się skośnie** |
| `aurora` | `#A0A044` | **aurora — zielono-fioletowe zasłonki dryfują** |
| `ocean` | `#A0A048` | **ocean — migocące kaustyki światła na głębokiej wodzie** |
| `neon_grad` | `#A0A04C` | **neonowy gradient — pasmo odcienia przetacza się** |
| `chroma` | `#A0A050` | **cały tekst płynnie obiega pełne spektrum** |
| `morse` | `#A0A054` | **miga w rytmie kodu morse (krotko-krotko-długi)** |
| `radar` | `#A0A058` | **cyanowa linia skanu skośnie, z zanikającym ogonem** |
| `glow` | `#A0A05C` | **złoty blask, który delikatnie oddycha** |
| `holo` | `#A0A060` | **hologram — scanlines + losowe spadki sygnału** |
| `static_tv` | `#A0A064` | **szum telewizyjny — losowy szum pikselowy** |

### Kinetyczne (same znaki się ruszają)
| Tag | Kolor | Co robi |
|---|---|---|
| `wave` | `#40E0FF` | znaki falują w górę i w dół |
| `wave_big` | `#20B0FF` | duże, powolne fale |
| `rainbow` | `#FF40FF` | każdy znak zmienia kolor (tęcza po znakach) |
| `glitch_hard` | `#FF3050` | znaki szarpią się losowo (glitch) |
| `tsunami` | `#4080FF` | wielka fala niesie znaki |
| `karuzela` | `#FF9030` | znaki kręcą się w kółko |
| `tornado` | `#90FF30` | znaki wirują jak w tornadzie |
| `bumper` | `#FF30A0` | znaki podskakują jak bilardowe kulki |
| `pulse` | `#FFFF30` | znaki "oddychają" (parzyste w górę, nieparzyste w dół) |
| `heartbeat` | `#FF3030` | cały tekst bije jak serce (bum-bum) |
| `flicker` | `#F0F0F0` | znaki migają (znikają i wracają) |
| `shake` | `#FFA030` | cały tekst trzęsie się mocno |
| `ripple` | `#00E0C0` | **podwójna fala — dwie nachodzące na siebie fali** |
| `orbita` | `#C040FF` | **znaki kręcą elipsę (wężyk), faza od znaku** |
| `skok` | `#FF7000` | **cały tekst podskakuje (hop, hop, hop)** |
| `sway` | `#80FF80` | **delikatne kołysanie wahadłowe, faza po znakach** |
| `hopwave` | `#00FF90` | **znaki podskakują po kolei (fala skoków)** |
| `wobble` | `#E0C040` | **mikro-trzęsienie — jak kamera z ręki** |
| `spin` | `#FF80C0` | **szybkie kręcenie — znaki wirują w kółko** |
| `tremor` | `#A04000` | **trzęsienie ziemi — wybuchy trzęsienia co 3 s** |
| `floaty` | `#60A0FF` | **płynne dryfowanie — cały tekst unosi się i opada** |
| `zigzag` | `#B0B000` | **zygzak — twarde szarpnięcia w bok, fala po znakach** |
| `spryna` | `#FF5070` | **sprężyna — wysoce częstotliwy dzwon, amplituda pulsuje** |
| `szarp` | `#00B0B0` | **szarpanie — ciągłe szybkie przesuw w prawo i w lewo** |

### Czyste kolory (bez animacji — tekst po prostu kolorowy)
| Tag | Kolor |
|---|---|
| `czerwony` | `#FF0000` |
| `zielony` | `#00FF00` |
| `niebieski` | `#0000FF` |
| `zolty` | `#FFFF00` |
| `pomaranczowy` | `#FF9900` |
| `fioletowy` | `#CC00FF` |
| `rozowy` | `#FF66CC` |
| `cyjan` | `#00FFFF` |
| `bialy` | `#FFFFFF` |
| `szary` | `#999999` |
| `brazowy` | `#8B4513` |

### Hybrydowe — 25 nowych (51–75)
| `tancuj` | `#A0A068` | **znaki tańczą na przemian + pełna tęcza** |
| `lawina` | `#A0A06C` | **znaki spadają lawinowo + śnieżna biel** |
| `dym` | `#A0A070` | **znaki unoszą się jak dym + szaro-niebieskie migotanie** |
| `neon_oddech` | `#A0A074` | **neon oddycha: magenta↔cyjan + puls w dół** |
| `winda` | `#A0A078` | **tekst jeździ „windą” + gradient cyjan→fiolet** |
| `karuzela_neon` | `#A0A07C` | **szybka karuzela + tęcza po znakach** |
| `neon_deszcz` | `#A0A080` | **znaki spadają jak krople + cyjanowe smugi** |
| `konfetti` | `#A0A084` | **losowe skoki jak konfetti + losowe jasne kolory** |
| `fala_fioletowa` | `#A0A088` | **fioletowa fala + mieniący się purpur** |
| `fala_zlota` | `#A0A08C` | **złota fala + iskry** |
| `magnes` | `#A0A090` | **przyciąganie w lewo i szarpnięcie + elektryczny błękit** |
| `sznurek` | `#A0A094` | **znaki wiszą na sznurku + turkus** |
| `fala_zielona` | `#A0A098` | **zielona fala neonowa** |
| `fala_rozowa` | `#A0A09C` | **różowa fala neonowa** |
| `prad` | `#A0A0A0` | **porażenie prądem: trzęsienie + białe rozbłyski** |
| `luna` | `#A0A0A4` | **wolny dryf + srebrno-niebieskie światło księżyca** |
| `bateria` | `#A0A0A8` | **zielony puls ładującej baterii + docisk** |
| `wyskok` | `#A0A0AC` | **wielki powolny skok + pomarańczowy zachód** |
| `tarcza` | `#A0A0B0` | **fala na boki + cyjanowy blask** |
| `gwiazdki` | `#A0A0B4` | **małe kółka + migocące gwiazdki** |
| `neon_laser` | `#A0A0B8` | **fala + czerwony laser skanujący pionowo** |
| `wstecz` | `#A0A0BC` | **tekst sunie w lewo (marquee) + taśma odcieni** |
| `morska` | `#A0A0C0` | **duża wolna morska fala + głęboki błękit** |
| `karmazyn` | `#A0A0C4` | **karmazynowa fala + ciemnoczerwona poświata** |
| `wizja` | `#A0A0C8` | **szybki flicker + scanlines, białoniebieski** |

## Szybki start
```
# 1. Wgraj Animacje2.0.zip do .minecraft/resourcepacks i włącz go
# 2. W konsoli/chat (jako admin) wklej rozkaz z konwertera:
python3 konwerter.py "Witaj <animacja:blysk>SWIECIE</animacja>!"
# -> /tellraw @a [{text: "Witaj "}, {text: "SWIECIE", color: "#A0A000"}, {text: "!"}]
```

### Formaty rozkazów
- **SNBT (domyślnie, Minecraft 1.21.5+):** `{text: "Test", color: "#A0A000"}`
- **Stary JSON (Minecraft ≤ 1.21.4):** `python3 konwerter.py --json "..."` → `{"text": "Test", "color": "#A0A000"}`

Jeśli serwer wyrzuca "Unknown or incomplete command" — użyj odpowiedniego formatu dla wersji serwera.

## Pliki efektów (każdy efekt = osobny plik)
```
assets/minecraft/shaders/include/
├── tfx_common.vsh        # silnik: stan efektu + detekcja koloru
├── tfx_common.fsh        # silnik: wspólne funkcje + importy efektów
├── tfx_blysk.vsh  +  tfx_blysk.fsh     # efekt: blysk
├── tfx_neonfala.vsh +  tfx_neonfala.fsh
├── ... (50 efektów: fragmentowe = .vsh + .fsh, kinetyczne = .vsh)
```
Kolor spustowy + logika VSH leży w `tfx_<nazwa>.vsh`, wygląd pikselowy w `tfx_<nazwa>.fsh`
(tylko efekty fragmentowe mają plik .fsh).

## Wersje Minecraft
**Architektura „baza = najnowsze API”:**
| Wersje | Format packa | Co się ładuje |
|---|---|---|
| **1.21.6 – 1.21.11** | **56 – 87** | **BAZA** (GLSL 330, `rendertype_text.*`, UBO `Globals`, `apply_fog`) |
| **26.2 i nowsze** | **88 – 100** | **overlay `v262/`** (GLSL 330, scalone shadery `core/text.*` z define'ami `IS_GUI`/`IS_SEE_THROUGH`/`IS_GRAYSCALE`) |
| 1.20.2 – 1.21.5 | 16 – 55 | overlay `old/` (GLSL 150, stary API mgle) |

Wszystkie warianty są zgodne z **prawdziwym vanilla** (1.21.11, 26.2 i 1.21.5 — pliki
`fog.glsl`, `dynamictransforms.glsl`, `projection.glsl`, `globals.glsl`, `text.vsh/fsh` pobrane z
oficjalnych assetów i zweryfikowane kompilatorem GLSL: 34/34 kompilacji, w tym 5 kombinacji
define'ow 26.2: świat, GUI, see-through, grayscale ×2).

## Struktura
```
Animacje2.0/
├── pack.mcmeta           # pack_format 63 + overlays: old/ dla formatów 16–55
├── konwerter.py          # generator rozkazów /tellraw
├── README.md             # ten plik
├── KOMENDY.md            # gotowe rozkazy dla wszystkich 86 tagów
├── assets/minecraft/shaders/...   # BAZA = 1.21.6 – 1.21.11 (4 pary vsh/fsh 330 + 126 include'ów)
├── old/assets/minecraft/shaders/...  # overlay ≤1.21.5 (4 pary vsh/fsh 150)
└── v262/assets/minecraft/shaders/core/  # overlay 26.2+ (scalone text.vsh/fsh z silnikiem)
```

## Archiwum
Stara wersja z 140 animacjami: `Animacje1.0/` + `Animacje1.0.zip` (zachowana do celów archiwalnych).
