# KOMENDY — Animacje 2.0

Gotowe rozkazy dla wszystkich 61 tagów (50 animacji + 11 kolorów). Format **SNBT** (Minecraft 1.21.5+).
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
