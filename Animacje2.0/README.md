# Animacje 2.0 — nowy silnik efektów tekstu

Resourcepack, który animuje tekst w czacie Minecraft. **25 efektów animowanych + 11 czystych kolorów.**
Zbudowany od zera: każdy efekt ma **osobny plik**, wspólny silnik jest mały i czytelny.

> Instaluj TYLKO JEDEN pack animacji naraz (1.0 i 2.0 konfliktują — oba nadpisują render tekstu).

## Jak to działa
1. `konwerter.py` zamienia `<animacja:NAZWA>tekst</animacja>` na gotowy rozkaz `/tellraw` z kolorem spustowym.
2. Shader (VSH) rozpoznaje dokładny kolor znaku i:
   - **efekt kinetyczny** (14–25) — przesuwa/odwraca całe znaki w przestrzeni ekranu,
   - **efekt fragmentowy** (1–13) — koloruje piksele znaku w czasie (FSH).
3. Kolor bez efektu = zwykły tekst (dlatego "czyste kolory" niczego nie uruchamiają).

## 25 efektów animowanych

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
├── ... (25 par plików po jednym na efekt)
```
Kolor spustowy + logika VSH leży w `tfx_<nazwa>.vsh`, wygląd pikselowy w `tfx_<nazwa>.fsh`
(tylko efekty fragmentowe mają plik .fsh).

## Wersje Minecraft
**Architektura „baza = najnowsze API”:**
| Wersje | Format packa | Co się ładuje |
|---|---|---|
| **1.21.6 → 1.21.11+ (Twój)** | **63 – 100** | **BAZA** (GLSL 330, nowy API mgle: `apply_fog`, UBO `Fog`, `GameTime` z UBO `Globals`) — ładowana ZAWSZE, niezależnie od mechanizmu wariantów |
| 1.20.2 – 1.21.5 | 16 – 55 | overlay `old/` (GLSL 150, stary API mgle) przez `overlays` w pack.mcmeta |

Baza jest zgodna z **prawdziwym vanilla 1.21.11** (`fog.glsl`, `dynamictransforms.glsl`,
`projection.glsl`, `globals.glsl` pobrane z oficjalnych assetów i zweryfikowane kompilatorem GLSL —
ten sam schemat, co w działającym packu TheSalt's Text Effects).

## Struktura
```
Animacje2.0/
├── pack.mcmeta           # pack_format 63 + overlays: old/ dla formatów 16–55
├── konwerter.py          # generator rozkazów /tellraw
├── README.md             # ten plik
├── KOMENDY.md            # gotowe rozkazy dla wszystkich 36 tagów
├── assets/minecraft/shaders/...   # BAZA = 1.21.6+ (4 pary vsh/fsh 330 + 40 include'ów)
└── old/assets/minecraft/shaders/...  # overlay ≤1.21.5 (4 pary vsh/fsh 150)
```

## Archiwum
Stara wersja z 140 animacjami: `Animacje1.0/` + `Animacje1.0.zip` (zachowana do celów archiwalnych).
