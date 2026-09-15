# KOMENDY — Animacje 2.0

Gotowe rozkazy dla wszystkich 166 tagów (155 animacji, każda = kolor + ruch, + 11 kolorów). Format **SNBT** (Minecraft 1.21.5+).
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
## Nowe: ruch (20) + kolor (20) + polaczenia (40)
```
# helikopter
/tellraw @a [{text: "helikopter!", color: "#A0A0CC"}]
# spirala
/tellraw @a [{text: "spirala!", color: "#A0A0D0"}]
# wibrowanie
/tellraw @a [{text: "wibrowanie!", color: "#A0A0D4"}]
# falstart
/tellraw @a [{text: "falstart!", color: "#A0A0D8"}]
# wachlarz
/tellraw @a [{text: "wachlarz!", color: "#A0A0DC"}]
# deszcz_ziemi
/tellraw @a [{text: "deszcz_ziemi!", color: "#A0A0E0"}]
# wznoszenie
/tellraw @a [{text: "wznoszenie!", color: "#A0A0E4"}]
# losowe_skoki
/tellraw @a [{text: "losowe_skoki!", color: "#A0A0E8"}]
# fala_wodna
/tellraw @a [{text: "fala_wodna!", color: "#A0A0EC"}]
# zygzak_v2
/tellraw @a [{text: "zygzak_v2!", color: "#A0A0F0"}]
# metronom
/tellraw @a [{text: "metronom!", color: "#A0A0F4"}]
# drgania_muzyczne
/tellraw @a [{text: "drgania_muzyczne!", color: "#A0A0F8"}]
# puls_zer
/tellraw @a [{text: "puls_zer!", color: "#A0A0FC"}]
# wielkie_kolo
/tellraw @a [{text: "wielkie_kolo!", color: "#80C000"}]
# falowanie_gora
/tellraw @a [{text: "falowanie_gora!", color: "#80C004"}]
# szarpacze_fale
/tellraw @a [{text: "szarpacze_fale!", color: "#80C008"}]
# unoszenie_fale
/tellraw @a [{text: "unoszenie_fale!", color: "#80C00C"}]
# trzesienie_pionowe
/tellraw @a [{text: "trzesienie_pionowe!", color: "#80C010"}]
# fala_od_srodka
/tellraw @a [{text: "fala_od_srodka!", color: "#80C014"}]
# bungee
/tellraw @a [{text: "bungee!", color: "#80C018"}]
# neon_fiolet
/tellraw @a [{text: "neon_fiolet!", color: "#80C01C"}]
# neon_cyjan
/tellraw @a [{text: "neon_cyjan!", color: "#80C020"}]
# zloto
/tellraw @a [{text: "zloto!", color: "#80C024"}]
# platyna
/tellraw @a [{text: "platyna!", color: "#80C028"}]
# miedz
/tellraw @a [{text: "miedz!", color: "#80C02C"}]
# lawenda
/tellraw @a [{text: "lawenda!", color: "#80C030"}]
# szmaragd
/tellraw @a [{text: "szmaragd!", color: "#80C034"}]
# rubin
/tellraw @a [{text: "rubin!", color: "#80C038"}]
# szafir
/tellraw @a [{text: "szafir!", color: "#80C03C"}]
# topaz
/tellraw @a [{text: "topaz!", color: "#80C040"}]
# perla
/tellraw @a [{text: "perla!", color: "#80C044"}]
# neony_tokio
/tellraw @a [{text: "neony_tokio!", color: "#80C048"}]
# retro
/tellraw @a [{text: "retro!", color: "#80C04C"}]
# pixel_8bit
/tellraw @a [{text: "pixel_8bit!", color: "#80C050"}]
# tlen
/tellraw @a [{text: "tlen!", color: "#80C054"}]
# neon_amber
/tellraw @a [{text: "neon_amber!", color: "#80C058"}]
# galaktyczny
/tellraw @a [{text: "galaktyczny!", color: "#80C05C"}]
# tusza_neon
/tellraw @a [{text: "tusza_neon!", color: "#80C060"}]
# olo
/tellraw @a [{text: "olo!", color: "#80C064"}]
# rose_gold
/tellraw @a [{text: "rose_gold!", color: "#80C068"}]
# helikopter_zloto
/tellraw @a [{text: "helikopter zloto!", color: "#80C06C"}]
# spirala_platyna
/tellraw @a [{text: "spirala platyna!", color: "#80C070"}]
# wibrowanie_miedz
/tellraw @a [{text: "wibrowanie miedz!", color: "#80C074"}]
# falstart_lawenda
/tellraw @a [{text: "falstart lawenda!", color: "#80C078"}]
# wachlarz_szmaragd
/tellraw @a [{text: "wachlarz szmaragd!", color: "#80C07C"}]
# deszcz_ziemi_rubin
/tellraw @a [{text: "deszcz_ziemi rubin!", color: "#80C080"}]
# wznoszenie_szafir
/tellraw @a [{text: "wznoszenie szafir!", color: "#80C084"}]
# losowe_skoki_topaz
/tellraw @a [{text: "losowe_skoki topaz!", color: "#80C088"}]
# fala_wodna_perla
/tellraw @a [{text: "fala_wodna perla!", color: "#80C08C"}]
# zygzak_v2_neony_tokio
/tellraw @a [{text: "zygzak_v2 neony_tokio!", color: "#80C090"}]
# metronom_retro
/tellraw @a [{text: "metronom retro!", color: "#80C094"}]
# drgania_muzyczne_pixel_8bit
/tellraw @a [{text: "drgania_muzyczne pixel_8bit!", color: "#80C098"}]
# puls_zer_tlen
/tellraw @a [{text: "puls_zer tlen!", color: "#80C09C"}]
# wielkie_kolo_neon_amber
/tellraw @a [{text: "wielkie_kolo neon_amber!", color: "#80C0A0"}]
# falowanie_gora_galaktyczny
/tellraw @a [{text: "falowanie_gora galaktyczny!", color: "#80C0A4"}]
# szarpacze_fale_tusza_neon
/tellraw @a [{text: "szarpacze_fale tusza_neon!", color: "#80C0A8"}]
# unoszenie_fale_olo
/tellraw @a [{text: "unoszenie_fale olo!", color: "#80C0AC"}]
# trzesienie_pionowe_rose_gold
/tellraw @a [{text: "trzesienie_pionowe rose_gold!", color: "#80C0B0"}]
# fala_od_srodka_neon_fiolet
/tellraw @a [{text: "fala_od_srodka neon_fiolet!", color: "#80C0B4"}]
# bungee_neon_cyjan
/tellraw @a [{text: "bungee neon_cyjan!", color: "#80C0B8"}]
# helikopter_szmaragd
/tellraw @a [{text: "helikopter szmaragd!", color: "#80C0BC"}]
# spirala_rubin
/tellraw @a [{text: "spirala rubin!", color: "#80C0C0"}]
# wibrowanie_szafir
/tellraw @a [{text: "wibrowanie szafir!", color: "#80C0C4"}]
# falstart_topaz
/tellraw @a [{text: "falstart topaz!", color: "#80C0C8"}]
# wachlarz_perla
/tellraw @a [{text: "wachlarz perla!", color: "#80C0CC"}]
# deszcz_ziemi_neony_tokio
/tellraw @a [{text: "deszcz_ziemi neony_tokio!", color: "#80C0D0"}]
# wznoszenie_retro
/tellraw @a [{text: "wznoszenie retro!", color: "#80C0D4"}]
# losowe_skoki_pixel_8bit
/tellraw @a [{text: "losowe_skoki pixel_8bit!", color: "#80C0D8"}]
# fala_wodna_tlen
/tellraw @a [{text: "fala_wodna tlen!", color: "#80C0DC"}]
# zygzak_v2_neon_amber
/tellraw @a [{text: "zygzak_v2 neon_amber!", color: "#80C0E0"}]
# metronom_galaktyczny
/tellraw @a [{text: "metronom galaktyczny!", color: "#80C0E4"}]
# drgania_muzyczne_tusza_neon
/tellraw @a [{text: "drgania_muzyczne tusza_neon!", color: "#80C0E8"}]
# puls_zer_olo
/tellraw @a [{text: "puls_zer olo!", color: "#80C0EC"}]
# wielkie_kolo_rose_gold
/tellraw @a [{text: "wielkie_kolo rose_gold!", color: "#80C0F0"}]
# falowanie_gora_neon_fiolet
/tellraw @a [{text: "falowanie_gora neon_fiolet!", color: "#80C0F4"}]
# szarpacze_fale_neon_cyjan
/tellraw @a [{text: "szarpacze_fale neon_cyjan!", color: "#80C0F8"}]
# unoszenie_fale_zloto
/tellraw @a [{text: "unoszenie_fale zloto!", color: "#80C0FC"}]
# trzesienie_pionowe_platyna
/tellraw @a [{text: "trzesienie_pionowe platyna!", color: "#80D000"}]
# fala_od_srodka_miedz
/tellraw @a [{text: "fala_od_srodka miedz!", color: "#80D004"}]
# bungee_lawenda
/tellraw @a [{text: "bungee lawenda!", color: "#80D008"}]
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

## NOWE 50 EFEKTÓW (156–205)
### Ruchy (156–170)
# kotwica
/tellraw @a [{text: "kotwica", color: "#60B000"}]
# piorko
/tellraw @a [{text: "piorko", color: "#60B004"}]
# strzala
/tellraw @a [{text: "strzala", color: "#60B008"}]
# most
/tellraw @a [{text: "most", color: "#60B00C"}]
# zegar
/tellraw @a [{text: "zegar", color: "#60B010"}]
# skakosz
/tellraw @a [{text: "skakosz", color: "#60B014"}]
# fala_kot
/tellraw @a [{text: "fala_kot", color: "#60B018"}]
# przepylacz
/tellraw @a [{text: "przepylacz", color: "#60B01C"}]
# wielblik
/tellraw @a [{text: "wielblik", color: "#60B020"}]
# deszczyk
/tellraw @a [{text: "deszczyk", color: "#60B024"}]
# ptaszek
/tellraw @a [{text: "ptaszek", color: "#60B028"}]
# rakieta
/tellraw @a [{text: "rakieta", color: "#60B02C"}]
# wahadlo
/tellraw @a [{text: "wahadlo", color: "#60B030"}]
# plyn
/tellraw @a [{text: "plyn", color: "#60B034"}]
# bumerang
/tellraw @a [{text: "bumerang", color: "#60B038"}]

### Kolory (171–185)
# srebro
/tellraw @a [{text: "srebro", color: "#60C000"}]
# krystal
/tellraw @a [{text: "krystal", color: "#60C004"}]
# polarna
/tellraw @a [{text: "polarna", color: "#60C008"}]
# magma
/tellraw @a [{text: "magma", color: "#60C00C"}]
# mroz
/tellraw @a [{text: "mroz", color: "#60C010"}]
# pryzmat
/tellraw @a [{text: "pryzmat", color: "#60C014"}]
# szampan
/tellraw @a [{text: "szampan", color: "#60C018"}]
# grafit
/tellraw @a [{text: "grafit", color: "#60C01C"}]
# mosiadz
/tellraw @a [{text: "mosiadz", color: "#60C020"}]
# karmel
/tellraw @a [{text: "karmel", color: "#60C024"}]
# wisnia
/tellraw @a [{text: "wisnia", color: "#60C028"}]
# trawa
/tellraw @a [{text: "trawa", color: "#60C02C"}]
# niebo
/tellraw @a [{text: "niebo", color: "#60C030"}]
# wschod
/tellraw @a [{text: "wschod", color: "#60C034"}]
# zachod
/tellraw @a [{text: "zachod", color: "#60C038"}]

### Połączenia (186–205)
# kotwica_srebro
/tellraw @a [{text: "kotwica_srebro", color: "#60D000"}]
# piorko_krystal
/tellraw @a [{text: "piorko_krystal", color: "#60D004"}]
# strzala_polarna
/tellraw @a [{text: "strzala_polarna", color: "#60D008"}]
# most_magma
/tellraw @a [{text: "most_magma", color: "#60D00C"}]
# zegar_mroz
/tellraw @a [{text: "zegar_mroz", color: "#60D010"}]
# skakosz_pryzmat
/tellraw @a [{text: "skakosz_pryzmat", color: "#60D014"}]
# fala_kot_szampan
/tellraw @a [{text: "fala_kot_szampan", color: "#60D018"}]
# przepylacz_grafit
/tellraw @a [{text: "przepylacz_grafit", color: "#60D01C"}]
# wielblik_mosiadz
/tellraw @a [{text: "wielblik_mosiadz", color: "#60D020"}]
# deszczyk_karmel
/tellraw @a [{text: "deszczyk_karmel", color: "#60D024"}]
# ptaszek_wisnia
/tellraw @a [{text: "ptaszek_wisnia", color: "#60D028"}]
# rakieta_trawa
/tellraw @a [{text: "rakieta_trawa", color: "#60D02C"}]
# wahadlo_niebo
/tellraw @a [{text: "wahadlo_niebo", color: "#60D030"}]
# plyn_wschod
/tellraw @a [{text: "plyn_wschod", color: "#60D034"}]
# bumerang_zachod
/tellraw @a [{text: "bumerang_zachod", color: "#60D038"}]
# kotwica_magma
/tellraw @a [{text: "kotwica_magma", color: "#60D03C"}]
# most_krystal
/tellraw @a [{text: "most_krystal", color: "#60D040"}]
# piorko_polarna
/tellraw @a [{text: "piorko_polarna", color: "#60D044"}]
# skakosz_szampan
/tellraw @a [{text: "skakosz_szampan", color: "#60D048"}]
# wielblik_pryzmat
/tellraw @a [{text: "wielblik_pryzmat", color: "#60D04C"}]

## KONFIG (kolory.json + konfig.json + generuj.py)
```
# zmiana hexa (np. rainbow na #B1E75C):
# edytujesz kolory.json -> "rainbow": "#B1E75C"
python3 generuj.py            # aplikuje hexy + konfig do shaderow/README/KOMENDY

# opcje globalne w konfig.json:
# "predkosc": 1.5       -> 1,5x szybciej
# "amplituda": 1.5      -> wieksze ruchy
# "intensywnosc": 1.3   -> jasniejsze kolory
# "wylaczone": ["rainbow"]  -> efekt zostaje zwyklym kolorem
```
## Jak generować własne
```
python3 konwerter.py "Twój tekst <animacja:blysk>TUTAJ</animacja> dalej"
python3 konwerter.py --json "..."   # stary format (Minecraft <= 1.21.4)
python3 konwerter.py --lista        # pełna lista tagów + kolory
```
