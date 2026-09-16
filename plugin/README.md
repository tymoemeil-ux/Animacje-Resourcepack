# AnimacjeHub — plugin do packa Animacje 2.0

Podłącza pack **Animacje 2.0 (280 FX + 11 kolorów)** do serwera: ogłoszenia,
animowany nick, animowane nazwy itemów, trolle, kolor pisania per ranga
(LuckPerms / LucjPermissions / vanilla) — wszystko z ładnego GUI.

## Instalacja

1. `Animacje2.0.zip` → `.minecraft/resourcepacks` (i na serwer) — **pack musi być
   aktywny U KAŻDEGO gracza**, bo to jego szadery rysują animacje.
2. `AnimacjeHub.jar` → `plugins/`
3. Restart serwera.
4. W grze: `/anim` (aliasy: `/animacje`, `/ah`).

Wymaga: Paper 1.21.x. Wersja klasy: Java 17 (działa na JVM 17–21+).

## Co potrafi

| Funkcja | Gdzie |
|---|---|
| **Ogłoszenia** — broadcast co N sekund, rotacja tekstów, dowolny FX, dźwięk | GUI → Ogłoszenia (admin) |
| **Animowany nick** — twój nick w czacie rysowany z FX (animacja żywa, bo to shader) | GUI → Nick / `/anim nick <tx>` |
| **Itemki** — nazwanie itemu w ręce z FX (nazwa też się animuje), nazwa + losowy FX, usuń nazwę | GUI → Itemki / `/anim item <tx>` |
| **Trolle** — czat, losowa fraza, gracz przed tobą (5 bloków), troll serwera (admin), cooldown | GUI → Trolle / `/anim troll <tx>` |
| **Rangi** — kolor pisania per ranga; hex z configu → najbliższy FX z packa (lub czysty kolor) | GUI → Rangi (podgląd), działa w czacie automatycznie |
| **Wybór FX** — 280 efektów z packa, strony, podgląd hexa, losowy FX | GUI → WYBIERZ FX |
| **Opcje** — dźwięki per gracz, reload konfiga (admin) | GUI → Opcje |

## Komendy i uprawnienia

```
/anim              — menu GUI          (animacjehub.use, default: true)
/anim nick <tx>    — ustaw animowany nick   (animacjehub.nick)
/anim nick off     — usuń nick
/anim item <tx>    — nazwij item w ręce     (animacjehub.item)
/anim troll [tx]   — troll czatu            (animacjehub.troll)
/anim fx <nazwa>   — ustaw FX wszędzie
/anim list         — przykłady FX z packa
/anim reload       — reload configu         (animacjehub.admin, default: op)
```

Podpowiedzi tabu: `/anim fx <TAB>` = lista wszystkich 280 nazw.

## Rangi i kolory (config.yml)

```yaml
rangi:
  zrodlo: auto          # auto | luckperms | lucj | vanilla
  animowane: true       # true: hex rangy -> najblizszy ANIMOWANY FX
  kolejnosc: [admin, moderator, vip, user]
  kolory-klucze: [admin, moderator, vip, user]
  kolory:
    admin: "#FF5555"    # to hex, jaki chcesz; plugin sam dobierze FX
```

- **auto**: próbuje LuckPerms (`net.luckperms.api.LuckPerms`), potem LucjPermissions
  (kilka znanych pakietów), potem vanilla (uprawnienia z `vanilla: {}`).
- Ranga = grupa (node `group.<nazwa>`); kolejność z `kolejnosc` decyduje,
  która wygrywa, gdy gracz ma kilka grup.
- `animowane: false` → kolor rangi = czysty kolor (bez FX) przy dokładnym
  trafieniu w 11 kolorów packa, inaczej brak koloru.

## Ogłoszenia

- config: `ogloszenia.wlacz/odstep_s/dzwiek/fx/teksty`
- GUI → Ogłoszenia: start/stop, zmień tekst (chat), odstęp ±10s, wybór FX.
- Przy >1 tekście — rotacja po kolei.

## Jak działa "animacja"

Plugin tylko wstawia w tekst **kolor spustowy** (kod `§xRRGGBB` z
`narzedzia/kolory.json`). To shader z packa Animacje 2.0 wykrywa ten kolor
na literze i animuje ją (ruch + kolor). Dlatego:

- pack musi być włączony u widza (serwer + klient),
- tekst animuje się "na żywo" — nawet w GUI, tooltipach, tabliczkach,
- nazwa itemu i nick w czacie to zwykły tekst → działają tak samo.

## Budowanie od źródeł

`build.sh` (JDK 17+): `javac --release 17` ze stubami API (folder `stubs/` —
tylko do kompilacji, NIE ląduje w jarze) → `AnimacjeHub.jar`.
Katalog FX wbudowany w jar: `fx_katalog.json` (280 FX + 11 kolorów,
generowany z `narzedzia/konwerter.py`).
