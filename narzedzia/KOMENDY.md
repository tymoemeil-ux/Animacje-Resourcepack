# Komendy — Animacje 3.1

Pack zawiera 85 efektów. Listę można wyświetlić tak:

```bash
python3 ../Animacje3.0/konwerter.py --lista
```

Przykłady konwertera:

```text
python3 ../Animacje3.0/konwerter.py '<animacja:blysk>BŁYSK</animacja>'
python3 ../Animacje3.0/konwerter.py '<animacja:kometa>NOWY EFEKT</animacja>'
python3 ../Animacje3.0/konwerter.py '<animacja:hack_matrix>ACCESS GRANTED</animacja>'
```

Plugin v2.1 udostępnia te same nazwy przez `/anim lista`, `/anim fx <nazwa>` i GUI.
Efekty z rodziną `hakerskie` wymagają `animacje.hacker`.

## Customowe połączenia koloru i efektu

```text
/anim custom &c wave Czerwony tekst
/anim custom &g rainbow Zielony tęczowy tekst
/anim custom #55FFAA hack_cyber CYBER TEXT
/anim custom #FFFF glow Biały glow
/anim custom nick #FF55AA wave MojNick
/anim custom item #55FFFF spectrum Miecz
```

Obsługiwane są `&0–&f`, dodatkowy alias `&g`, nazwy kolorów, `#RGB`, `#RGBA` i
`#RRGGBB`. `#RGBA` ignoruje kanał alfa, ponieważ tekst Minecrafta nie przenosi alfa
w legacy color.
