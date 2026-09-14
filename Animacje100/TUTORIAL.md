# Tutorial - Animacje 100+

## 1. Co to jest

Animacje 100+ to resourcepack, który animuje tekst w grze - w czacie, na tytułach, na tabliczkach, na nazwach manekinów i w GUI (1.21.4+). Animacja wyzwalana jest kolorem tekstu - każdy z 152 tagów ma swój unikalny kolor spustowy. Serwer zawsze widzi i zapisuje zwykły tekst z kolorem, animację renderuje tylko client z włączonym packiem. Wszystkie 152 tagi są animowane (ruch lub zmiana pikselowa) - nie ma efektów statycznych.

## 2. Instalacja

1. Skopiuj `Animacje100.zip` do `.minecraft/resourcepacks`
2. Opcje - Interfejs i grafik - Pakiety zasobów - włącz `Animacje 100+`
3. Upewnij się, że żaden inny pack nie nadpisuje shaderów tekstu

## 3. Pierwsza animacja

Tag `animacja:wave` ma kolor `#F8F800`. Rozkaz:

```
/tellraw @a {"text":"Test","color":"#F8F800"}
```

Client z packiem: słowo Test faluje. Serwer i klienci bez packa: zwykły żółtawy tekst.

## 4. Format <animacja:...>

Żeby nie pamiętać kolorów, użyj konwertera. Format:

```
<animacja:NAZWA>tekst</animacja>
```

Przykład:

```
python3 konwerter.py "<animacja:wave>Test</animacja>"

/tellraw @a {"text": "Test", "color": "#F8F800"}
```

Konwerter obsługuje kilka tagów i zwykły tekst naraz:

```
python3 konwerter.py "Zwykły tekst <animacja:rainbow>tęcza</animacja> i <animacja:laser>laser</animacja>"

/tellraw @a {"text": "", "extra": [{"text": "Zwykły tekst "}, {"text": "tęcza", "color": "#F8F824"}, {"text": " i "}, {"text": "laser", "color": "#E0E004"}]}
```

## 5. Wszystkie 152 przykładowe teksty

```
/tellraw @a {"text":"Witaj w świecie","color":"#F8F800"}
/tellraw @a {"text":"Animacje działają","color":"#F8F804"}
/tellraw @a {"text":"To jest test tekstu","color":"#F8F808"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#F8F80C"}
/tellraw @a {"text":"Super serwer","color":"#F8F810"}
/tellraw @a {"text":"Gramy dalej","color":"#F8F814"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#F8F818"}
/tellraw @a {"text":"Do zobaczenia","color":"#F8F81C"}
/tellraw @a {"text":"Nowa przygoda","color":"#F8F820"}
/tellraw @a {"text":"Legendarny tekst","color":"#F8F824"}
/tellraw @a {"text":"Witaj w świecie","color":"#F8F828"}
/tellraw @a {"text":"Animacje działają","color":"#F8F82C"}
/tellraw @a {"text":"To jest test tekstu","color":"#F8F830"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#F8F834"}
/tellraw @a {"text":"Super serwer","color":"#F8F838"}
/tellraw @a {"text":"Gramy dalej","color":"#F8F83C"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#F8F840"}
/tellraw @a {"text":"Do zobaczenia","color":"#F8F844"}
/tellraw @a {"text":"Nowa przygoda","color":"#F8F848"}
/tellraw @a {"text":"Legendarny tekst","color":"#F8F84C"}
/tellraw @a {"text":"Witaj w świecie","color":"#F8F850"}
/tellraw @a {"text":"Animacje działają","color":"#F8F854"}
/tellraw @a {"text":"To jest test tekstu","color":"#F8F858"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#F8F85C"}
/tellraw @a {"text":"Super serwer","color":"#F8F860"}
/tellraw @a {"text":"Gramy dalej","color":"#F8F864"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#F8F868"}
/tellraw @a {"text":"Do zobaczenia","color":"#F8F86C"}
/tellraw @a {"text":"Nowa przygoda","color":"#F8F870"}
/tellraw @a {"text":"Legendarny tekst","color":"#F8F874"}
/tellraw @a {"text":"Witaj w świecie","color":"#F8F878"}
/tellraw @a {"text":"Animacje działają","color":"#F8F87C"}
/tellraw @a {"text":"To jest test tekstu","color":"#F8F880"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#F8F884"}
/tellraw @a {"text":"Super serwer","color":"#F8F888"}
/tellraw @a {"text":"Gramy dalej","color":"#F8F88C"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#F8F890"}
/tellraw @a {"text":"Do zobaczenia","color":"#F8F894"}
/tellraw @a {"text":"Nowa przygoda","color":"#F8F898"}
/tellraw @a {"text":"Legendarny tekst","color":"#F8F89C"}
/tellraw @a {"text":"Witaj w świecie","color":"#F8F8A0"}
/tellraw @a {"text":"Animacje działają","color":"#F8F8A4"}
/tellraw @a {"text":"To jest test tekstu","color":"#F8F8A8"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#F8F8AC"}
/tellraw @a {"text":"Super serwer","color":"#F8F8B0"}
/tellraw @a {"text":"Gramy dalej","color":"#F8F8B4"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#F8F8B8"}
/tellraw @a {"text":"Do zobaczenia","color":"#F8F8BC"}
/tellraw @a {"text":"Nowa przygoda","color":"#F8F8C0"}
/tellraw @a {"text":"Legendarny tekst","color":"#F8F8C4"}
/tellraw @a {"text":"Witaj w świecie","color":"#F8F8C8"}
/tellraw @a {"text":"Animacje działają","color":"#F8F8CC"}
/tellraw @a {"text":"To jest test tekstu","color":"#F8F8D0"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#F8F8D4"}
/tellraw @a {"text":"Super serwer","color":"#F8F8D8"}
/tellraw @a {"text":"Gramy dalej","color":"#F8F8DC"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#F8F8E0"}
/tellraw @a {"text":"Do zobaczenia","color":"#F8F8E4"}
/tellraw @a {"text":"Nowa przygoda","color":"#F8F8E8"}
/tellraw @a {"text":"Legendarny tekst","color":"#F8F8EC"}
/tellraw @a {"text":"Witaj w świecie","color":"#F8F8F0"}
/tellraw @a {"text":"Animacje działają","color":"#F8F8F4"}
/tellraw @a {"text":"To jest test tekstu","color":"#F8F8F8"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#F0F000"}
/tellraw @a {"text":"Super serwer","color":"#F0F004"}
/tellraw @a {"text":"Gramy dalej","color":"#F0F008"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#F0F00C"}
/tellraw @a {"text":"Do zobaczenia","color":"#F0F010"}
/tellraw @a {"text":"Nowa przygoda","color":"#F0F014"}
/tellraw @a {"text":"Legendarny tekst","color":"#F0F018"}
/tellraw @a {"text":"Witaj w świecie","color":"#F0F01C"}
/tellraw @a {"text":"Animacje działają","color":"#F0F020"}
/tellraw @a {"text":"To jest test tekstu","color":"#F0F024"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#F0F028"}
/tellraw @a {"text":"Super serwer","color":"#F0F02C"}
/tellraw @a {"text":"Gramy dalej","color":"#F0F030"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#F0F034"}
/tellraw @a {"text":"Do zobaczenia","color":"#F0F038"}
/tellraw @a {"text":"Nowa przygoda","color":"#F0F03C"}
/tellraw @a {"text":"Legendarny tekst","color":"#F0F040"}
/tellraw @a {"text":"Witaj w świecie","color":"#F0F044"}
/tellraw @a {"text":"Animacje działają","color":"#F0F048"}
/tellraw @a {"text":"To jest test tekstu","color":"#F0F04C"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#F0F050"}
/tellraw @a {"text":"Super serwer","color":"#F0F054"}
/tellraw @a {"text":"Gramy dalej","color":"#F0F058"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#F0F05C"}
/tellraw @a {"text":"Do zobaczenia","color":"#F0F060"}
/tellraw @a {"text":"Nowa przygoda","color":"#F0F064"}
/tellraw @a {"text":"Legendarny tekst","color":"#F0F068"}
/tellraw @a {"text":"Witaj w świecie","color":"#F0F06C"}
/tellraw @a {"text":"Animacje działają","color":"#F0F070"}
/tellraw @a {"text":"To jest test tekstu","color":"#F0F074"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#F0F078"}
/tellraw @a {"text":"Super serwer","color":"#F0F07C"}
/tellraw @a {"text":"Gramy dalej","color":"#F0F080"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#F0F084"}
/tellraw @a {"text":"Do zobaczenia","color":"#F0F088"}
/tellraw @a {"text":"Nowa przygoda","color":"#F0F08C"}
/tellraw @a {"text":"Legendarny tekst","color":"#F0F090"}
/tellraw @a {"text":"Witaj w świecie","color":"#E8E800"}
/tellraw @a {"text":"Animacje działają","color":"#E8E804"}
/tellraw @a {"text":"To jest test tekstu","color":"#E8E808"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#E8E80C"}
/tellraw @a {"text":"Super serwer","color":"#E8E810"}
/tellraw @a {"text":"Gramy dalej","color":"#E8E814"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#E8E818"}
/tellraw @a {"text":"Do zobaczenia","color":"#E8E81C"}
/tellraw @a {"text":"Nowa przygoda","color":"#E8E820"}
/tellraw @a {"text":"Legendarny tekst","color":"#E8E824"}
/tellraw @a {"text":"Witaj w świecie","color":"#E8E828"}
/tellraw @a {"text":"Animacje działają","color":"#E8E82C"}
/tellraw @a {"text":"To jest test tekstu","color":"#E8E830"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#E8E834"}
/tellraw @a {"text":"Super serwer","color":"#E8E838"}
/tellraw @a {"text":"Gramy dalej","color":"#E8E83C"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#E0E004"}
/tellraw @a {"text":"Do zobaczenia","color":"#E0E008"}
/tellraw @a {"text":"Nowa przygoda","color":"#E0E00C"}
/tellraw @a {"text":"Legendarny tekst","color":"#E0E010"}
/tellraw @a {"text":"Witaj w świecie","color":"#E0E014"}
/tellraw @a {"text":"Animacje działają","color":"#E0E018"}
/tellraw @a {"text":"To jest test tekstu","color":"#E0E01C"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#E0E020"}
/tellraw @a {"text":"Super serwer","color":"#E0E024"}
/tellraw @a {"text":"Gramy dalej","color":"#E0E028"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#E0E02C"}
/tellraw @a {"text":"Do zobaczenia","color":"#E0E030"}
/tellraw @a {"text":"Nowa przygoda","color":"#E0E034"}
/tellraw @a {"text":"Legendarny tekst","color":"#E0E038"}
/tellraw @a {"text":"Witaj w świecie","color":"#E0E03C"}
/tellraw @a {"text":"Animacje działają","color":"#E0E040"}
/tellraw @a {"text":"To jest test tekstu","color":"#E0E044"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#E0E048"}
/tellraw @a {"text":"Super serwer","color":"#E0E04C"}
/tellraw @a {"text":"Gramy dalej","color":"#E0E050"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#E0E054"}
/tellraw @a {"text":"Do zobaczenia","color":"#E0E058"}
/tellraw @a {"text":"Nowa przygoda","color":"#E0E05C"}
/tellraw @a {"text":"Legendarny tekst","color":"#E0E060"}
/tellraw @a {"text":"Witaj w świecie","color":"#E0E064"}
/tellraw @a {"text":"Animacje działają","color":"#E0E068"}
/tellraw @a {"text":"To jest test tekstu","color":"#E0E06C"}
/tellraw @a {"text":"Minecraft jest świetny","color":"#E0E070"}
/tellraw @a {"text":"Super serwer","color":"#E0E074"}
/tellraw @a {"text":"Gramy dalej","color":"#E0E078"}
/tellraw @a {"text":"Kliknij i zagraj","color":"#E0E07C"}
/tellraw @a {"text":"Do zobaczenia","color":"#E0E080"}
/tellraw @a {"text":"Nowa przygoda","color":"#E0E084"}
/tellraw @a {"text":"Legendarny tekst","color":"#E0E088"}
/tellraw @a {"text":"Witaj w świecie","color":"#E0E08C"}
/tellraw @a {"text":"Animacje działają","color":"#E0E090"}
```

## 6. Łączenie efektów

Tagi 64-152 to gotowe kombinacje. Zasady:

- efekt wierzchołkowy + efekt wierzchołkowy: tak
- efekt wierzchołkowy + efekt fragmentowy (blask, laser, holo, ...): tak
- efekt fragmentowy + kolor/faza (tęcza, neon): nie - fragmentowy ma pierwszeństwo
- dwa fragmentowe: nie (jeden na kolor)

Własne kombinacje: `assets/minecraft/shaders/include/_config.glsl` (patrz README).

## 7. Tytuły i actionbar

Te same kolory spustowe działają w `/title` i `/title ... actionbar`:

```
/title @a title {"text":"Witaj","color":"#E8E800"}

/title @a actionbar {"text":"ekipa!","color":"#F8F824"}
```

## 8. Tabliczki i manekiny

Animowany kolor spustowy możesz dać też tabliczce (poprzez nazwy z komponentami, np. przez datapack) oraz manekinowi:

```
summon minecraft:armor_stand ~ ~ ~ {CustomName:{text:"Szef", color:"#E0E044"}}
```

Nazwa manekina będzie animowana jak każdy inny tekst.

## 9. Nick i hologramy (Animacje-Datapack, 1.21.11)

Vanilla nie pozwala bezpośrednio animować domyślnego nameplate'a gracza - obchodzimy to przez `CustomName` (datapack robi to za Ciebie):

1. Wrzuć `Animacje-Datapack.zip` do `.minecraft/datapacks`
2. `/function animacje:tag` - animowany tag przed nickiem
3. `/function animacje:nick` - napis `TwójNick` w kolorze animacji (edytuj tekst w `data/animacje/function/nick.mcfunction`)
4. `/function animacje:reset` - zwykły nick

Hologramy:

- `/function animacje:hologram` - hologram z animowanym tekstem (3 linie, 3 kolory spustowe)
- `/function animacje:hologram_nazwa` - hologram z nazwą
- `/function animacje:hologram_usun` - usuwa hologramy

## 10. Zaawansowana konfiguracja

Parametry efektów zmienisz w `assets/minecraft/shaders/include/defaults.glsl` (makra `#define`), np.:

```
#define BLASK_SPEED 1.5
#define LASER_SPEED 0.8
#define MATRIX_SPEED 1.2
#define TORNADO_SIZE 3.0
```

Lub per tag w `_config.glsl` (funkcje z argumentami):

```
TEXT_EFFECT(rgb(224, 224, 4)) {
    apply_laser(0.8, 0.12);
}
```

## 11. Problemy

- Brak animacji: pack włączony? Żaden inny pack nie nadpisuje `rendertype_text`?
- Zmiany w `_config.glsl` / `defaults.glsl` wymagają restartu gry

## 12. Licencja

MIT. Pack oparty na TheSalt's Text Effects (MIT, TheSalt). Szczegóły w `LICENSE`.

