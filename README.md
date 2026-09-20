# Animacje Resourcepack

Packi do żywego animowania tekstu w Minecraft Java Edition. Aktualne wydanie to
**Animacje 3.0 — Top 50** oraz przebudowany od zera **AnimacjeHub v2**.

## Aktualne pliki

| Plik | Przeznaczenie |
|---|---|
| `Animacje3.0/` + `Animacje3.0.zip` | aktualny pack: dokładnie **50** kuratorowanych efektów, w tym 4 nowe |
| `plugin/AnimacjeHub.jar` | plugin v2: animowany nick, prefix rangi, title, itemy, GUI i bezpieczne trolle |
| `plugin/README.md` | instalacja, komendy i uprawnienia pluginu |
| `narzedzia/generuj_v3.py` | powtarzalny generator packa i katalogu pluginu |
| `Animacje2.0/` + `Animacje2.0.zip` | archiwum poprzedniego packa (nie włączaj równocześnie z 3.0) |
| `Animacje1.0/` + `Animacje1.0.zip` | stare archiwum |
| `Animacje-Datapack/` | starszy datapack, niezależny od pluginu v2 |

## Animacje 3.0

Wersja 3.0 nie ładuje już setek podobnych shaderów. Zostało 50 najbardziej użytecznych
i czytelnych efektów z różnych grup: neon, ogień/lód/ocean, kosmos, cyber, ruch,
energia i efekty imprezowe. Dodałem cztery nowe efekty napisane specjalnie dla tej wersji:

- `kometa` — świetlna kometa z ogonem,
- `iskry` — migoczące iskry,
- `pryzmat` — kryształowy gradient,
- `szklo` — szklany połysk.

Każdy efekt jest osobną parą `tfx_<nazwa>.vsh` + `tfx_<nazwa>.fsh`, a wspólny dispatcher
importuje wyłącznie te 50 par. `effects.json` i katalog pluginu są generowane z tej samej
listy, dlatego plugin nie pokazuje nieistniejących efektów.

### Instalacja packa

1. Włącz `Animacje3.0.zip` jako **jedyny** pack nadpisujący shader tekstu.
2. Pack musi być aktywny u widza animacji. Plugin może go wysłać przy wejściu, jeśli w
   `plugin/res/config.yml` ustawisz publiczny `resourcepack.url` i poprawny SHA-1.
3. W grze używaj nazw z `python3 Animacje3.0/konwerter.py --lista`.

Przykład:

```bash
python3 Animacje3.0/konwerter.py '<animacja:rainbow>Witaj!</animacja>'
```

Nie włączaj jednocześnie `Animacje1.0.zip`, `Animacje2.0.zip` i `Animacje3.0.zip` —
każdy z nich podmienia ten sam renderer tekstu.

## AnimacjeHub v2

Plugin został napisany ponownie. Shader animuje tekst na kliencie, a plugin odpowiada za
uprawnienia, wybór FX i poprawne formatowanie. Najważniejsze możliwości:

- **animowany nick** — własny tekst i FX zapisane trwale per UUID,
- **ranga + animowany prefix** — LuckPerms primary group albo fallback permissionów,
- **animowane title/subtitle** dla siebie, gracza lub całego serwera,
- **animowana nazwa itemu** w głównej ręce,
- **kosmetyczne trolle**: title, actionbar, wiadomość albo dźwięk; bez obrażeń, teleportów
i zmian świata,
- GUI, tab-complete, cooldowny, walidacja i opcjonalne wysyłanie resourcepacka.

Skrócona lista:

```text
/anim nick set <fx> <tekst>
/anim nick fx <fx>
/anim title rainbow Witaj | Podtytuł
/anim item kometa Miecz Komety
/anim troll Gracz title
/anim fx pryzmat
/anim lista
```

Pełne permissiony i instrukcja są w `plugin/README.md`.

## Walidacja i budowanie

Regeneracja packa + katalogu pluginu:

```bash
python3 narzedzia/generuj_v3.py
```

Budowa jar (JDK 17+):

```bash
cd plugin
./build.sh
```

Generator sprawdza, że lista ma dokładnie 50 unikalnych nazw i triggerów. Plugin przy
starcie również odrzuca katalog z inną liczbą efektów lub zduplikowanym kolorem.
