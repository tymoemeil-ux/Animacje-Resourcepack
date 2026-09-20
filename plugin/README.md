# AnimacjeHub v2 — plugin dla Animacje 3.0

Plugin został napisany od nowa pod `Animacje3.0.zip`. Nie ma już rotowania FX co kilka
sekund ani hardcoded katalogu z 2.0: shader sam animuje tekst na kliencie, a plugin tylko
wstawia właściwy kolor spustowy.

## Instalacja

1. Włącz `Animacje3.0.zip` u graczy albo ustaw `resourcepack.url` i `resourcepack.sha1`.
2. Skopiuj `AnimacjeHub.jar` do `plugins/`.
3. Uruchom Paper 1.21.x i użyj `/anim help`.
4. Jeśli włączasz pack z serwera, URL musi być publicznym HTTPS bez przekierowania.

Plugin wymaga Java 17+. LuckPerms jest opcjonalny — bez niego działają permissiony
`animacje.ranga.<grupa>`.

## Najważniejsze komendy

```text
/anim                         menu GUI
/anim nick                    status nicku, FX i rangi
/anim nick on|off             włącz/wyłącz animowany nick
/anim nick set <fx> <tekst>   ustaw własny nick i efekt
/anim nick fx <fx>             zmień tylko efekt nicku
/anim title <fx> <tekst>       animowany title dla siebie
/anim title <gracz> <fx> ...   title dla gracza (permission op)
/anim title all <fx> ...       title dla wszystkich (permission op)
/anim item <fx> <nazwa>        animowana nazwa itemu w głównej ręce
/anim item clear               usuń nazwę itemu
/anim troll <gracz> [typ]      kosmetyczny troll: title/actionbar/chat/sound
/anim fx <nazwa>               podgląd efektu
/anim lista                    pełna lista 50 efektów
/anim rank                     wykryta ranga + FX prefixu
/anim glos <tekst>             ogłoszenie do serwera (permission op)
/anim reload                   przeładuj config i katalog (permission op)
```

W title znak `|` rozdziela tytuł i podtytuł, np.:

```text
/anim title rainbow Witaj | Miłej gry!
```

## Animowany nick i ranga

W czacie plugin używa poprawnego `setFormat`, więc nick nie dubluje się i wiadomość nie
jest doklejana do starego formatu. Prefix rangi i nick mogą mieć niezależne FX.

- LuckPerms: używana jest primary group gracza.
- Bez LuckPerms: kolejność z `rangi.kolejnosc` i permissiony `animacje.ranga.<grupa>`.
- Ustawienia nicku są trwale zapisane w `plugins/AnimacjeHub/profiles.db`.
- Własny tekst jest ograniczony długością i zapisywany atomowo.

## Trolle

Trolle są celowo bezpieczne: nie zadają obrażeń, nie teleportują, nie wyrzucają i nie
zmieniają świata. Pokazują tylko animowany title/actionbar/czat albo odtwarzają dźwięk.
Trollowanie innych wymaga `animacje.troll.others`, ma cooldown i można je ograniczyć w
`config.yml`.

## Budowanie

```bash
cd plugin
./build.sh
```

Katalog `fx_katalog.json` jest generowany wspólnie z packiem przez:

```bash
python3 narzedzia/generuj_v3.py
```

Po buildzie jar zawiera tylko klasy pluginu oraz `plugin.yml`, `config.yml` i 50-elementowy
katalog FX. Stubów kompilacyjnych nie ma w jarze.
