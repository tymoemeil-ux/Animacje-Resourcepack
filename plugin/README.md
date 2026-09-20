# AnimacjeHub v2.2 — plugin dla Animacje 3.1

Plugin działa z `Animacje3.0.zip` w rozszerzonej wersji zawierającej **85 efektów**:
50 bazowych, 25 nowych premium oraz 10 efektów hakerskich. Animacja jest liczona po stronie
klienta w shaderze tekstu, per klatka renderowania, z targetem 60 FPS — serwer nie wysyła
klatek i nie obciąża ticków.

## Instalacja

1. Włącz `Animacje3.0.zip` u graczy albo ustaw `resourcepack.url` i `resourcepack.sha1`.
2. Skopiuj tylko jeden `AnimacjeHub.jar` do `plugins/`.
3. Uruchom Paper 1.21.x i użyj `/anim help`.
4. Jeśli pack jest wysyłany z serwera, URL musi być publicznym HTTPS bez przekierowania.

Plugin wymaga Java 17+. LuckPerms jest opcjonalny — bez niego działają permissiony
`animacje.ranga.<grupa>`.

## Komendy

```text
/anim                              menu GUI
/anim nick                         status nicku, koloru, FX i rangi
/anim nick on|off                  włącz/wyłącz animowany nick
/anim nick set <fx> <tekst>        ustaw nick bez customowego koloru
/anim nick fx <fx>                 zmień tylko efekt nicku
/anim nick color <kolor>           ustaw kolor nicku: &c, &g, #RGB, #RRGGBB
/anim nick custom <kolor> <fx> <tekst>
                                   ustaw customowy nick na stałe
/anim title <fx> <tekst>           animowany title dla siebie
/anim title <gracz> <fx> ...       title dla gracza
/anim title all <fx> ...           title dla wszystkich
/anim custom <kolor> <fx> <tekst>  customowy title dla siebie
/anim custom nick <kolor> <fx> <tekst>
                                   customowy nick
/anim custom item <kolor> <fx> <nazwa>
                                   customowa nazwa itemu w ręce
/anim item <fx> <nazwa>            animowana nazwa itemu w głównej ręce
/anim item clear                   usuń nazwę itemu
/anim troll <gracz> [typ]           kosmetyczny troll: title/actionbar/chat/sound/bossbar
/anim preview [kolor] <fx> <tekst>  szybki title bez zapisywania profilu
/anim actionbar [kolor] <fx> <tekst> animowany pasek akcji
/anim chat [kolor] <fx> <tekst>     animowana wiadomość do serwera
/anim pack                          ponownie wyślij resourcepack
/anim profile                       pokaż zapisany profil nicku i rangi
/anim settings                      pokaż ustawienia runtime
/anim reset                         wyzeruj zapisany profil
/anim random                        wylosuj FX animowanego nicku
/anim fx <nazwa>                    podgląd efektu
/anim lista                         lista dostępnych efektów
/anim rank                          wykryta ranga i FX prefixu
/anim glos <tekst>                  ogłoszenie do serwera
/anim reload                        przeładuj config i katalog
```

Kolory custom są normalizowane do `#RRGGBB`. Obsługiwane są aliasy `&0–&f`, dodatkowy `&g`,
nazwy (`red`, `cyan`, `lime`) oraz `#RGB`, `#RGBA` i `#RRGGBB`. Shader koduje kolor w
zarezerwowanym triggerze, dlatego dowolny kolor może działać z dowolnym z 85 FX.

## Permissiony

| Permission | Domyślnie | Przeznaczenie |
|---|---:|---|
| `animacje.use` | true | GUI i podgląd |
| `animacje.fx` | true | katalog efektów |
| `animacje.custom` | true | customowe kolory |
| `animacje.preview` | true | szybki podgląd title |
| `animacje.actionbar` | true | animowane actionbary |
| `animacje.chat` | true | animowany chat |
| `animacje.pack` | true | ręczne wysłanie resourcepacka |
| `animacje.profile` | true | profil i reset ustawień |
| `animacje.settings` | op | podgląd ustawień runtime |
| `animacje.nick` | true | własny animowany nick |
| `animacje.nick.custom` | true | zapis customowego koloru nicku |
| `animacje.title` | true | title dla siebie |
| `animacje.title.others` | op | title dla innych |
| `animacje.title.broadcast` | op | title dla wszystkich |
| `animacje.item` | true | animowane nazwy itemów |
| `animacje.item.custom` | true | customowe nazwy itemów |
| `animacje.troll` | true | troll na siebie |
| `animacje.troll.others` | op | trollowanie innych |
| `animacje.troll.bossbar` | op | tymczasowy bossbar trolla |
| `animacje.hacker` | op | 10 efektów hakerskich |
| `animacje.announce` | op | ogłoszenia |
| `animacje.admin` | op | reload |

## Nick i ranga

Prefix rangi i nick mają niezależne efekty. Plugin usuwa dodatkowe kody kolorów z wnętrza
animowanego prefixu, więc domyślny szary/brązowy fragment nie zostaje po starej kolorystyce.
Zwykły tekst po nicku ma domyślnie czysty biały kolor (`chat.kolor_bazowy: "&f"`).

Ustawienia nicku są trwale zapisane w `plugins/AnimacjeHub/profiles.db`. Stary format
profili jest kompatybilny — customowy kolor zostanie pusty i można go ustawić ponownie.

## Trolle

Trolle są wyłącznie kosmetyczne: title, actionbar, chat, sound albo tymczasowy bossbar.
Nie zadają obrażeń, nie teleportują, nie wyrzucają i nie zmieniają świata. Mają cooldown,
a losowy tryb oraz osobne permissiony.

## Budowanie

```bash
cd plugin
./build.sh
```

Katalog `fx_katalog.json`, pack, ZIP i konwerter są generowane wspólnie:

```bash
python3 narzedzia/generuj_v3.py
```

Po buildzie JAR zawiera wyłącznie klasy pluginu oraz zasoby `plugin.yml`, `config.yml` i
85-elementowy katalog FX. Stubów kompilacyjnych nie ma w JAR-ze.
