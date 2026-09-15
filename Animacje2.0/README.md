# Animacje 2.0

Resourcepack z **25 animacjami tekstu** dla Minecraft Java Edition - tylko mocne, wszystkie wyraźnie animowane nawet na małym tekście czatu.

To wersja 2.0 (od nowa, z 25 wyselekcjonowanych efektów). Stara wersja z 140 animacjami jest archiwum: `Animacje1.0`.

Napisz tekst w kolorze z tabeli, a client z włączonym packiem wyświetli go z animacją. Na serwerze i bez packa - zwykły tekst (animacja działa tylko po stronie klienta).

> Nie jest kompatybilny z innymi packami nadpisującymi shader `rendertype_text` (w tym z Animacje 1.0 - używaj jednej wersji).

## Instalacja

1. Wrzuć `Animacje2.0.zip` (lub folder `Animacje2.0`) do `.minecraft/resourcepacks`
2. Włącz pack w `Pakiety zasobów`
3. Używaj kolorów z tabeli w `/tellraw`, `/title` itp.

## 25 animacji

Wszystkie 25 jest mocno animowanych - bez subtelnych. Kolor = tag.

| # | Tag | Kolor | Efekt |
|---|-----|-------|-------|
| 1 | `animacja:blysk` | `#A0A000` | Błysk - podwójny rozbłysk przez tekst |
| 2 | `animacja:neonfala` | `#A0A004` | Neonowa fala pełnych kolorów |
| 3 | `animacja:tecafala` | `#A0A008` | Tęczowa fala płynąca przez tekst |
| 4 | `animacja:kaskada` | `#A0A00C` | Gruba kaskada światła spływająca w dół |
| 5 | `animacja:laser2` | `#A0A010` | Podwójne laserowe skanowanie |
| 6 | `animacja:grzmot` | `#A0A014` | Gwałtowne rozbłyski grzmotu |
| 7 | `animacja:obrys` | `#A0A018` | Świecący niebieski obrys liter |
| 8 | `animacja:neon` | `#A0A01C` | Klasyczny niebieski neon |
| 9 | `animacja:neon_puls` | `#A0A020` | Pulsująca neonowa poświata |
| 10 | `animacja:zloty_blask` | `#A0A024` | Podwójna złota fala |
| 11 | `animacja:galaktyka` | `#A0A028` | Fioletowa mgławica + gwiazdy |
| 12 | `animacja:krew` | `#A0A02C` | Spływające czerwone krople |
| 13 | `animacja:piorun` | `#A0A030` | Białe rozbłyski piorunów |
| 14 | `animacja:wave` | `#A0A034` | Fala podnosząca litery |
| 15 | `animacja:wave_big` | `#A0A038` | Wysoka, szybka fala |
| 16 | `animacja:rainbow` | `#A0A03C` | Tęczowy przebieg kolorów |
| 17 | `animacja:glitch_hard` | `#A0A040` | Mocny glicz / przesunięcia |
| 18 | `animacja:tsunami` | `#A0A044` | Potężna fala tsunami |
| 19 | `animacja:karuzela` | `#A0A048` | Litery krążą jak karuzela |
| 20 | `animacja:tornado` | `#A0A04C` | Wirujący tornado |
| 21 | `animacja:bumper` | `#A0A050` | Bumperowe odbicia liter |
| 22 | `animacja:pulse` | `#A0A054` | Pulsowanie rozmiaru |
| 23 | `animacja:heartbeat` | `#A0A058` | Uderzenia serca |
| 24 | `animacja:flicker` | `#A0A05C` | Szybkie migotanie |
| 25 | `animacja:shake` | `#A0A060` | Losowe trzęsienie |

## Wszystkie 25 rozkazów /tellraw

```
/tellraw @a {"text":"Test","color":"#A0A000"}
/tellraw @a {"text":"Test","color":"#A0A004"}
/tellraw @a {"text":"Test","color":"#A0A008"}
/tellraw @a {"text":"Test","color":"#A0A00C"}
/tellraw @a {"text":"Test","color":"#A0A010"}
/tellraw @a {"text":"Test","color":"#A0A014"}
/tellraw @a {"text":"Test","color":"#A0A018"}
/tellraw @a {"text":"Test","color":"#A0A01C"}
/tellraw @a {"text":"Test","color":"#A0A020"}
/tellraw @a {"text":"Test","color":"#A0A024"}
/tellraw @a {"text":"Test","color":"#A0A028"}
/tellraw @a {"text":"Test","color":"#A0A02C"}
/tellraw @a {"text":"Test","color":"#A0A030"}
/tellraw @a {"text":"Test","color":"#A0A034"}
/tellraw @a {"text":"Test","color":"#A0A038"}
/tellraw @a {"text":"Test","color":"#A0A03C"}
/tellraw @a {"text":"Test","color":"#A0A040"}
/tellraw @a {"text":"Test","color":"#A0A044"}
/tellraw @a {"text":"Test","color":"#A0A048"}
/tellraw @a {"text":"Test","color":"#A0A04C"}
/tellraw @a {"text":"Test","color":"#A0A050"}
/tellraw @a {"text":"Test","color":"#A0A054"}
/tellraw @a {"text":"Test","color":"#A0A058"}
/tellraw @a {"text":"Test","color":"#A0A05C"}
/tellraw @a {"text":"Test","color":"#A0A060"}
```

## Konwerter

```
python3 konwerter.py "<animacja:blysk>Błysk</animacja>"

/tellraw @a {"text": "Błysk", "color": "#A0A000"}
```

## Łączenie efektów

Jedna komenda, dwa kolory = dwa efekty:

```
/tellraw @a {"text":"BŁYSK","color":"#A0A000","extra":[{"text":" + RAINBOW","color":"#A0A03C"}]}
```

Szczegóły gotowych komend: `KOMENDY.md`.

## Wersje

Pack format 7-100 (Minecraft 1.17 i nowsze, w tym 1.21.11 i 26.x). Overlady dla 1.21.2, 1.21.6, 26.1 i 26.2.

## Licencja

MIT. Pack oparty na TheSalt's Text Effects (MIT, TheSalt). Szczegóły w `LICENSE`.
