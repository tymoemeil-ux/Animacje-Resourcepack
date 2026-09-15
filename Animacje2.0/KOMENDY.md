# KOMENDY — Animacje 2.0

Gotowe rozkazy dla wszystkich 86 tagów (75 animacji, każda = kolor + ruch, + 11 kolorów). Format **SNBT** (Minecraft 1.21.5+).
Dla starszych serwerów (≤1.21.4) przepisz `{text: "..."}` na `{"text": "..."}` (cudzysłowy przy kluczach).

## Fragmentowe (26)
```
/tellraw @a [{text: "WITAJ ", color: "#A0A000"}, {text: "BLYSK", color: "#A0A000"}]
```
Pełna lista (pojedynczy rozkaz na każdy efekt):
```
# blysk
/tellraw @a [{text: "Blysk!", color: "#A0A000"}]
# neonfala
/tellraw @a [{text: "Neonfala!", color: "#A0A004"}]
# teczafala
/tellraw @a [{text: "Teczafala!", color: "#A0A008"}]
# kaskada
/tellraw @a [{text: "Kaskada!", color: "#A0A00C"}]
# laser2
/tellraw @a [{text: "Laser2!", color: "#A0A010"}]
# grzmot
/tellraw @a [{text: "Grzmot!", color: "#A0A014"}]
# obrys
/tellraw @a [{text: "Obrys!", color: "#A0A018"}]
# neon
/tellraw @a [{text: "Neon!", color: "#A0A01C"}]
# neon_puls
/tellraw @a [{text: "Neon Puls!", color: "#A0A020"}]
# zloty_blask
/tellraw @a [{text: "Zloty Blask!", color: "#A0A024"}]
# galaktyka
/tellraw @a [{text: "Galaktyka!", color: "#A0A028"}]
# krew
/tellraw @a [{text: "Krew!", color: "#A0A02C"}]
# piorun
/tellraw @a [{text: "Piorun!", color: "#A0A030"}]
```

## Kinetyczne (24)
```
# wave
/tellraw @a [{text: "Wave!", color: "#40E0FF"}]
# wave_big
/tellraw @a [{text: "Wave Big!", color: "#20B0FF"}]
# rainbow
/tellraw @a [{text: "Rainbow!", color: "#FF40FF"}]
# glitch_hard
/tellraw @a [{text: "Glitch!", color: "#FF3050"}]
# tsunami
/tellraw @a [{text: "Tsunami!", color: "#4080FF"}]
# karuzela
/tellraw @a [{text: "Karuzela!", color: "#FF9030"}]
# tornado
/tellraw @a [{text: "Tornado!", color: "#90FF30"}]
# bumper
/tellraw @a [{text: "Bumper!", color: "#FF30A0"}]
# pulse
/tellraw @a [{text: "Pulse!", color: "#FFFF30"}]
# heartbeat
/tellraw @a [{text: "Heartbeat!", color: "#FF3030"}]
# flicker
/tellraw @a [{text: "Flicker!", color: "#F0F0F0"}]
# shake
/tellraw @a [{text: "Shake!", color: "#FFA030"}]
```

## Czyste kolory (11)
```
/tellraw @a [{text: "Czerwony tekst", color: "#FF0000"}]
/tellraw @a [{text: "Zielony tekst", color: "#00FF00"}]
/tellraw @a [{text: "Niebieski tekst", color: "#0000FF"}]
/tellraw @a [{text: "Zolty tekst", color: "#FFFF00"}]
/tellraw @a [{text: "Pomaranczowy tekst", color: "#FF9900"}]
/tellraw @a [{text: "Fioletowy tekst", color: "#CC00FF"}]
/tellraw @a [{text: "Rozowy tekst", color: "#FF66CC"}]
/tellraw @a [{text: "Cyjan tekst", color: "#00FFFF"}]
/tellraw @a [{text: "Bialy tekst", color: "#FFFFFF"}]
/tellraw @a [{text: "Szary tekst", color: "#999999"}]
/tellraw @a [{text: "Brązowy tekst", color: "#8B4513"}]
```


## Hybrydowe (25) — kolor + ruch
```
# tancuj
/tellraw @a [{text: "Tancuj!", color: "#A0A068"}]
# lawina
/tellraw @a [{text: "Lawina!", color: "#A0A06C"}]
# dym
/tellraw @a [{text: "Dym!", color: "#A0A070"}]
# neon_oddech
/tellraw @a [{text: "Neon Oddech!", color: "#A0A074"}]
# winda
/tellraw @a [{text: "Winda!", color: "#A0A078"}]
# karuzela_neon
/tellraw @a [{text: "Karuzela Neon!", color: "#A0A07C"}]
# neon_deszcz
/tellraw @a [{text: "Neon Deszcz!", color: "#A0A080"}]
# konfetti
/tellraw @a [{text: "Konfetti!", color: "#A0A084"}]
# fala_fioletowa
/tellraw @a [{text: "Fala Fioletowa!", color: "#A0A088"}]
# fala_zlota
/tellraw @a [{text: "Fala Zlota!", color: "#A0A08C"}]
# magnes
/tellraw @a [{text: "Magnes!", color: "#A0A090"}]
# sznurek
/tellraw @a [{text: "Sznurek!", color: "#A0A094"}]
# fala_zielona
/tellraw @a [{text: "Fala Zielona!", color: "#A0A098"}]
# fala_rozowa
/tellraw @a [{text: "Fala Rozowa!", color: "#A0A09C"}]
# prad
/tellraw @a [{text: "Prad!", color: "#A0A0A0"}]
# luna
/tellraw @a [{text: "Luna!", color: "#A0A0A4"}]
# bateria
/tellraw @a [{text: "Bateria!", color: "#A0A0A8"}]
# wyskok
/tellraw @a [{text: "Wyskok!", color: "#A0A0AC"}]
# tarcza
/tellraw @a [{text: "Tarcza!", color: "#A0A0B0"}]
# gwiazdki
/tellraw @a [{text: "Gwiazdki!", color: "#A0A0B4"}]
# neon_laser
/tellraw @a [{text: "Neon Laser!", color: "#A0A0B8"}]
# wstecz
/tellraw @a [{text: "Wstecz!", color: "#A0A0BC"}]
# morska
/tellraw @a [{text: "Morska!", color: "#A0A0C0"}]
# karmazyn
/tellraw @a [{text: "Karmazyn!", color: "#A0A0C4"}]
# wizja
/tellraw @a [{text: "Wizja!", color: "#A0A0C8"}]
```
## Gotowe frazy (mieszane)
```
# Ogloszenie z blyskiem
/tellraw @a [{text: ">> ", color: "#A0A000"}, {text: "SERWER WYLACZANY ZAIWKA", color: "#A0A000"}, {text: " <<", color: "#A0A000"}]

# Fala powitania
/tellraw @a [{text: "Witaj na serwerze, ", color: "#40E0FF"}, {text: "Gracz", color: "#40E0FF"}]

# Alerty
/tellraw @a [{text: "UWAGA: HACKI", color: "#FF3050"}]
/tellraw @a [{text: "BUMP! ", color: "#FF30A0"}, {text: "Nowy przedmiot w skrzynce!", color: "#FF30A0"}]

# Serce (animacja) + kolor (statycznie)
/tellraw @a [{text: "BUMP-BUMP ", color: "#FF3030"}, {text: "serduszko", color: "#FF66CC"}]
```

## Jak generować własne
```
python3 konwerter.py "Twój tekst <animacja:blysk>TUTAJ</animacja> dalej"
python3 konwerter.py --json "..."   # stary format (Minecraft <= 1.21.4)
python3 konwerter.py --lista        # pełna lista tagów + kolory
```
