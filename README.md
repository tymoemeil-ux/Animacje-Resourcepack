# Animacje Resourcepack 3.1

Pack do płynnego animowania tekstu w Minecraft Java Edition oraz plugin Paper
`AnimacjeHub v2.1`. Aktualne wydanie ma **85 efektów**: 50 bazowych, 25 nowych premium i
10 efektów hakerskich.

## Aktualne pliki

| Plik | Przeznaczenie |
|---|---|
| `Animacje3.0/` + `Animacje3.0.zip` | aktualny pack tekstu: 85 efektów i dispatcher 1–85 |
| `plugin/AnimacjeHub.jar` | plugin v2.1: nick, rangi, title, itemy, GUI, custom kolory i trolle |
| `plugin/README.md` | instalacja, komendy i pełna tabela permissionów |
| `narzedzia/generuj_v3.py` | generator packa, ZIP-a i katalogu pluginu |
| `Animacje2.0/` + `Animacje2.0.zip` | archiwum — nie włączaj równocześnie |

## Pack 3.1

Shader importuje 85 osobnych par VSH/FSH i działa płynnie per klatka renderowania. Przy
60 FPS klient dostaje płynne animacje bez rotowania kolorów przez serwer. Dziesięć efektów
z rodziny `hakerskie` jest oznaczone w GUI i chronione permissionem pluginu.

Nowe efekty premium obejmują m.in. `spectrum`, `aurora_flow`, `electric`, `scanline`,
`wave2`, `bounce`, `prism2` i `gradient`. Efekty hakerskie to m.in. `hack_matrix`,
`hack_terminal`, `hack_cyber`, `hack_zeroday`, `hack_root` i `hack_overclock`.

### Instalacja

1. Włącz `Animacje3.0.zip` jako **jedyny** pack nadpisujący shader tekstu.
2. Pack musi być aktywny u widza animacji. Plugin może go wysłać przy wejściu przez
   `resourcepack.url` i poprawny SHA-1.
3. Nie włączaj jednocześnie Animacje1.0/2.0 — każdy nadpisuje `rendertype_text`.

## Plugin v2.1

```text
/anim custom &c wave Czerwony tekst
/anim custom &g rainbow Zielony tęczowy tekst
/anim custom #55FFAA hack_cyber CYBER TEXT
/anim custom nick #FF55AA wave MojNick
/anim custom item #55FFFF spectrum Miecz
/anim nick color #FFFFFF
/anim troll Gracz hack_matrix
```

Custom obsługuje `&0–&f`, dodatkowy alias `&g`, nazwy kolorów, `#RGB`, `#RGBA` i
`#RRGGBB`. Kolor jest kodowany w triggerze i może być łączony z dowolnym efektem.
Szary/brązowy kod z prefixu nie przebija już animacji — plugin usuwa wewnętrzne kody
kolorów i ustawia zwykły tekst po nicku na biały (`chat.kolor_bazowy: "&f"`).

Pełne komendy i permissiony są w `plugin/README.md`.

## Budowanie i walidacja

```bash
python3 narzedzia/generuj_v3.py
cd plugin
./build.sh
```

Generator sprawdza 85 unikalnych nazw i kolorów, synchronizuje `effects.json` z
`plugin/res/fx_katalog.json`, buduje ZIP i usuwa pliki cache z paczki.
