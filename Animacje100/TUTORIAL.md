# Tutorial - Animacje 150

## 1. Co to jest

Animacje 150 to resourcepack animujący **cały pipeline tekstu** gry: czat, tytuły, actionbar, tabliczki, nazwy manekinów i GUI (1.21.4+). Animacja wyzwalana jest kolorem - każdy z 150 tagów ma unikalny kolor spustowy. Serwer widzi zwykły tekst z kolorem; animację renderuje tylko client z włączonym packiem. Wszystkie tagi są animowane.

## 2. Instalacja

1. Skopiuj `Animacje100.zip` do `.minecraft/resourcepacks`
2. Włącz `Animacje 150` w sekcji Pakiety zasobów
3. Żaden inny pack nie może nadpisywać `rendertype_text`

## 3. Pierwsza animacja

```
/tellraw @a {"text":"Test","color":"#F8F800"}
```

## 4. Format <animacja:...> i konwerter

```
python3 konwerter.py "<animacja:tron>Neo</animacja>"

/tellraw @a {"text": "Neo", "color": "#D8D82C"}
```

## 5. Wszystkie 150 przykładowych tekstów

```
/tellraw @a {"text":"Witaj w świecie","color":"#F8F800"}
/tellraw @a {"text":"Animacje działają","color":"#F8F804"}
/tellraw @a {"text":"To jest test tekstu","color":"#F8F808"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#F8F80C"}
/tellraw @a {"text":"Super serwer","color":"#F8F814"}
/tellraw @a {"text":"Gramy dalej","color":"#F8F818"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#F8F81C"}
/tellraw @a {"text":"Do zobaczenia","color":"#F8F820"}
/tellraw @a {"text":"Nowa przygoda","color":"#F8F824"}
/tellraw @a {"text":"Legendarny tekst","color":"#F8F82C"}
/tellraw @a {"text":"Witaj w świecie","color":"#F8F834"}
/tellraw @a {"text":"Animacje działają","color":"#F8F83C"}
/tellraw @a {"text":"To jest test tekstu","color":"#F8F844"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#F8F848"}
/tellraw @a {"text":"Super serwer","color":"#F8F850"}
/tellraw @a {"text":"Gramy dalej","color":"#F8F858"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#F8F85C"}
/tellraw @a {"text":"Do zobaczenia","color":"#F8F860"}
/tellraw @a {"text":"Nowa przygoda","color":"#F8F864"}
/tellraw @a {"text":"Legendarny tekst","color":"#F8F868"}
/tellraw @a {"text":"Witaj w świecie","color":"#F8F86C"}
/tellraw @a {"text":"Animacje działają","color":"#F8F884"}
/tellraw @a {"text":"To jest test tekstu","color":"#F8F888"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#F8F88C"}
/tellraw @a {"text":"Super serwer","color":"#F8F890"}
/tellraw @a {"text":"Gramy dalej","color":"#F8F894"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#F8F898"}
/tellraw @a {"text":"Do zobaczenia","color":"#F8F89C"}
/tellraw @a {"text":"Nowa przygoda","color":"#F8F8A0"}
/tellraw @a {"text":"Legendarny tekst","color":"#F8F8A4"}
/tellraw @a {"text":"Witaj w świecie","color":"#F8F8A8"}
/tellraw @a {"text":"Animacje działają","color":"#F8F8AC"}
/tellraw @a {"text":"To jest test tekstu","color":"#F8F8B0"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#F8F8B4"}
/tellraw @a {"text":"Super serwer","color":"#F8F8B8"}
/tellraw @a {"text":"Gramy dalej","color":"#F8F8BC"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#F8F8C0"}
/tellraw @a {"text":"Do zobaczenia","color":"#F8F8C4"}
/tellraw @a {"text":"Nowa przygoda","color":"#F8F8C8"}
/tellraw @a {"text":"Legendarny tekst","color":"#F8F8CC"}
/tellraw @a {"text":"Witaj w świecie","color":"#F8F8D0"}
/tellraw @a {"text":"Animacje działają","color":"#F8F8D4"}
/tellraw @a {"text":"To jest test tekstu","color":"#F8F8D8"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#F8F8DC"}
/tellraw @a {"text":"Super serwer","color":"#F8F8E0"}
/tellraw @a {"text":"Gramy dalej","color":"#F8F8E4"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#F8F8E8"}
/tellraw @a {"text":"Do zobaczenia","color":"#F8F8EC"}
/tellraw @a {"text":"Nowa przygoda","color":"#F8F8F0"}
/tellraw @a {"text":"Legendarny tekst","color":"#F8F8F4"}
/tellraw @a {"text":"Witaj w świecie","color":"#F8F8F8"}
/tellraw @a {"text":"Animacje działają","color":"#F0F090"}
/tellraw @a {"text":"To jest test tekstu","color":"#E8E800"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#E8E804"}
/tellraw @a {"text":"Super serwer","color":"#E8E808"}
/tellraw @a {"text":"Gramy dalej","color":"#E8E80C"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#E8E810"}
/tellraw @a {"text":"Do zobaczenia","color":"#E8E814"}
/tellraw @a {"text":"Nowa przygoda","color":"#E8E818"}
/tellraw @a {"text":"Legendarny tekst","color":"#E8E81C"}
/tellraw @a {"text":"Witaj w świecie","color":"#E8E820"}
/tellraw @a {"text":"Animacje działają","color":"#E8E824"}
/tellraw @a {"text":"To jest test tekstu","color":"#E8E828"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#E8E82C"}
/tellraw @a {"text":"Super serwer","color":"#E8E830"}
/tellraw @a {"text":"Gramy dalej","color":"#E8E834"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#E8E838"}
/tellraw @a {"text":"Do zobaczenia","color":"#E8E83C"}
/tellraw @a {"text":"Nowa przygoda","color":"#E0E004"}
/tellraw @a {"text":"Legendarny tekst","color":"#E0E008"}
/tellraw @a {"text":"Witaj w świecie","color":"#E0E00C"}
/tellraw @a {"text":"Animacje działają","color":"#E0E010"}
/tellraw @a {"text":"To jest test tekstu","color":"#E0E014"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#E0E018"}
/tellraw @a {"text":"Super serwer","color":"#E0E01C"}
/tellraw @a {"text":"Gramy dalej","color":"#E0E020"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#E0E024"}
/tellraw @a {"text":"Do zobaczenia","color":"#E0E028"}
/tellraw @a {"text":"Nowa przygoda","color":"#E0E02C"}
/tellraw @a {"text":"Legendarny tekst","color":"#E0E030"}
/tellraw @a {"text":"Witaj w świecie","color":"#E0E034"}
/tellraw @a {"text":"Animacje działają","color":"#E0E038"}
/tellraw @a {"text":"To jest test tekstu","color":"#E0E03C"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#E0E040"}
/tellraw @a {"text":"Super serwer","color":"#E0E044"}
/tellraw @a {"text":"Gramy dalej","color":"#E0E048"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#E0E04C"}
/tellraw @a {"text":"Do zobaczenia","color":"#E0E050"}
/tellraw @a {"text":"Nowa przygoda","color":"#E0E054"}
/tellraw @a {"text":"Legendarny tekst","color":"#E0E058"}
/tellraw @a {"text":"Witaj w świecie","color":"#E0E05C"}
/tellraw @a {"text":"Animacje działają","color":"#E0E060"}
/tellraw @a {"text":"To jest test tekstu","color":"#E0E064"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#E0E068"}
/tellraw @a {"text":"Super serwer","color":"#E0E06C"}
/tellraw @a {"text":"Gramy dalej","color":"#E0E070"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#E0E074"}
/tellraw @a {"text":"Do zobaczenia","color":"#E0E078"}
/tellraw @a {"text":"Nowa przygoda","color":"#E0E07C"}
/tellraw @a {"text":"Legendarny tekst","color":"#E0E080"}
/tellraw @a {"text":"Witaj w świecie","color":"#E0E084"}
/tellraw @a {"text":"Animacje działają","color":"#E0E088"}
/tellraw @a {"text":"To jest test tekstu","color":"#E0E08C"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#E0E090"}
/tellraw @a {"text":"Super serwer","color":"#D8D800"}
/tellraw @a {"text":"Gramy dalej","color":"#D8D804"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#D8D808"}
/tellraw @a {"text":"Do zobaczenia","color":"#D8D80C"}
/tellraw @a {"text":"Nowa przygoda","color":"#D8D810"}
/tellraw @a {"text":"Legendarny tekst","color":"#D8D814"}
/tellraw @a {"text":"Witaj w świecie","color":"#D8D818"}
/tellraw @a {"text":"Animacje działają","color":"#D8D81C"}
/tellraw @a {"text":"To jest test tekstu","color":"#D8D820"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#D8D824"}
/tellraw @a {"text":"Super serwer","color":"#D8D828"}
/tellraw @a {"text":"Gramy dalej","color":"#D8D82C"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#D8D830"}
/tellraw @a {"text":"Do zobaczenia","color":"#D8D834"}
/tellraw @a {"text":"Nowa przygoda","color":"#D8D838"}
/tellraw @a {"text":"Legendarny tekst","color":"#D8D83C"}
/tellraw @a {"text":"Witaj w świecie","color":"#D8D840"}
/tellraw @a {"text":"Animacje działają","color":"#D8D844"}
/tellraw @a {"text":"To jest test tekstu","color":"#D8D848"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#D8D84C"}
/tellraw @a {"text":"Super serwer","color":"#D8D850"}
/tellraw @a {"text":"Gramy dalej","color":"#D8D854"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#D8D858"}
/tellraw @a {"text":"Do zobaczenia","color":"#D8D85C"}
/tellraw @a {"text":"Nowa przygoda","color":"#D8D860"}
/tellraw @a {"text":"Legendarny tekst","color":"#D8D864"}
/tellraw @a {"text":"Witaj w świecie","color":"#D8D868"}
/tellraw @a {"text":"Animacje działają","color":"#D8D86C"}
/tellraw @a {"text":"To jest test tekstu","color":"#D8D870"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#D8D874"}
/tellraw @a {"text":"Super serwer","color":"#D8D878"}
/tellraw @a {"text":"Gramy dalej","color":"#D8D87C"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#D8D880"}
/tellraw @a {"text":"Do zobaczenia","color":"#D8D884"}
/tellraw @a {"text":"Nowa przygoda","color":"#D8D888"}
/tellraw @a {"text":"Legendarny tekst","color":"#D8D88C"}
/tellraw @a {"text":"Witaj w świecie","color":"#D8D890"}
/tellraw @a {"text":"Animacje działają","color":"#D8D894"}
/tellraw @a {"text":"To jest test tekstu","color":"#D8D898"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#D8D89C"}
/tellraw @a {"text":"Super serwer","color":"#D8D8A0"}
/tellraw @a {"text":"Gramy dalej","color":"#D8D8A4"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#D8D8A8"}
/tellraw @a {"text":"Do zobaczenia","color":"#D8D8AC"}
/tellraw @a {"text":"Nowa przygoda","color":"#D8D8B0"}
/tellraw @a {"text":"Legendarny tekst","color":"#D8D8B4"}
```

## 6. Łączenie efektów

- wierzchołkowy + wierzchołkowy: tak
- wierzchołkowy + fragmentowy: tak
- fragmentowy + kolor/faza: nie (fragmentowy ma pierwszeństwo)
- dwa fragmentowe: nie

Własne kombinacje: `assets/minecraft/shaders/include/_config.glsl`.

## 7. Tytuły i actionbar

```
/title @a title {"text":"Witaj","color":"#D8D800"}

/title @a actionbar {"text":"ekipa!","color":"#F8F824"}
```

## 8. Tabliczki, manekiny i rangi (LuckPerms)

Manekin z animowaną nazwą:

```
summon minecraft:armor_stand ~ ~ ~ {CustomName:{text:"Szef", color:"#D8D84C"}}
```

**Rangi na serwerze w LuckPerms** - prefix/suffix przyjmuje pełny JSON z kolorem hex:

```
/lp user <gracz> prefix set {"text":"[OP] ","color":"#D8D82C"}

/lp user <gracz> prefix set {"text":"[VIP] ","color":"#D8D808"}

/lp user <gracz> suffix set {"text":" | Ekipa","color":"#D8D800"}
```

Każda wiadomość w czacie od tego gracza będzie miała animowany prefix u klientów z packiem. Kolor = dowolny tag z tabeli w README. Można też w edytorze webowym LuckPerms (luckperms.net).

## 9. Nick i hologramy (Animacje-Datapack, 1.21.11)

1. Wrzuć `Animacje-Datapack.zip` do `.minecraft/datapacks`
2. `/function animacje:tag` - animowany tag przed nickiem
3. `/function animacje:nick` - napis `TwójNick` w kolorze animacji (edytuj `data/animacje/function/nick.mcfunction`)
4. `/function animacje:reset` - zwykły nick

Hologramy: `/function animacje:hologram`, `/function animacje:hologram_nazwa`, `/function animacje:hologram_usun`.

## 10. Zaawansowana konfiguracja

Parametry w `assets/minecraft/shaders/include/defaults.glsl` (makra) lub per tag w `_config.glsl`:

```
TEXT_EFFECT(rgb(216, 216, 0)) {
    apply_neon_puls(1.5, 1.2);
}
```

## 11. Usunięte efekty

Usunięto 48 słabych efektów: wave_soft, rainbow_fast, bouncy_high, blink_slow, pulse_big, spin_slow, flip_fast, big, huge, small, up, down oraz 36 kombinacji typu wave_rainbow, shake_neon, mega-lite itd. Jeśli potrzebujesz któregoś - łatwo odtworzyć wpis w `_config.glsl`.

## 12. Problemy

- Brak animacji: pack włączony? Żaden inny pack nie nadpisuje `rendertype_text`?
- Zmiany w `_config.glsl` / `defaults.glsl` wymagają restartu gry

## 13. Licencja

MIT. Pack oparty na TheSalt's Text Effects (MIT, TheSalt). Szczegóły w `LICENSE`.

