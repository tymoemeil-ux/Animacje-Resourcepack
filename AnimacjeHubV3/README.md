# AnimacjeHub V3

Pełny plugin Paper 1.21.x zbudowany jako niezależny projekt. V3 ma własny pakiet klas oraz własny lifecycle, katalog efektów, GUI i obsługę danych. Nie jest atrapą: komendy korzystają z Bukkit/Paper API.

## Funkcje
- `/anim` — GUI katalogu;
- `/anim nick [on|off]` — trwały animowany nick;
- `/anim item <fx> [nazwa]` — animowana nazwa przedmiotu;
- `/anim title <fx> <tekst>` — animowany tytuł;
- `/anim troll [gracz]` — akcje trollujące z uprawnieniami;
- rangi LuckPerms, ogłoszenia, tab-complete i konfiguracja.

Build wymaga JDK 17+ oraz Maven:
`mvn package`
