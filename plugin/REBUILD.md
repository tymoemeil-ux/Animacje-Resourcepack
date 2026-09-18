# AnimacjeHub 3 — przebudowa od zera

Plugin jest zaprojektowany jako osobne moduły: `Animacje` (lifecycle), `Katalog` (jedno źródło FX), `Nick`, `Rangi`, `Hub`, `Ogloszenia`, `Trolle` i `Polecenia`. Żaden moduł nie wykonuje komend tekstowych jako mechanizmu działania; używa API Paper i waliduje dane wejściowe.

## Funkcje

- `/anim nick [on|off]` — trwały animowany nick;
- `/anim title <fx> <tekst>` — animowany tytuł;
- `/anim item <fx> [nazwa...]` — animowana nazwa trzymanego przedmiotu, także z własnym tekstem;
- `/anim fx <nazwa>` — podgląd efektu;
- `/anim troll [gracz]` — bezpieczne akcje z cooldownem;
- `/anim glos <tekst>` — ogłoszenie dla administracji;
- GUI i LuckPerms.

Resourcepack zawiera dokładnie 50 animowanych FX oraz kolory bazowe. Logo packa przedstawia TYMEK24 z mieczem przed fioletowym portalem.

## Budowanie

Wymagane: JDK 17+ i Paper API 1.21.x. `bash build.sh` tworzy `AnimacjeHub.jar`.
