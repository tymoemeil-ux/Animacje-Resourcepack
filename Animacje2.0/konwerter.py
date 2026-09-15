#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Animacje 2.0 — konwerter: zamienia <animacja:NAZWA>tekst</animacja> na gotowy /tellraw.

Uzytek:
    python3 konwerter.py "Hej <animacja:blysk>SWIAT</animacja>!"
    python3 konwerter.py --json "..."     # stary format JSON (Minecraft <= 1.21.4)
    python3 konwerter.py --lista          # wyswietla wszystkie tagi

Domyślny format: SNBT (Minecraft 1.21.5+ inowsze).
"""
import re, sys

TAGS = {
    "'aurora'": "'#A0A044'",
    "'bialy'": "'#FFFFFF'",
    "'blysk'": "'#A0A000'",
    "'brazowy'": "'#8B4513'",
    "'bumper'": "'#FF30A0'",
    "'chroma'": "'#A0A050'",
    "'cyjan'": "'#00FFFF'",
    "'czerwony'": "'#FF0000'",
    "'diament'": "'#A0A040'",
    "'fioletowy'": "'#CC00FF'",
    "'flicker'": "'#F0F0F0'",
    "'floaty'": "'#60A0FF'",
    "'galaktyka'": "'#A0A028'",
    "'glitch_hard'": "'#FF3050'",
    "'glow'": "'#A0A05C'",
    "'grzmot'": "'#A0A014'",
    "'heartbeat'": "'#FF3030'",
    "'holo'": "'#A0A060'",
    "'hopwave'": "'#00FF90'",
    "'karuzela'": "'#FF9030'",
    "'kaskada'": "'#A0A00C'",
    "'krew'": "'#A0A02C'",
    "'laser2'": "'#A0A010'",
    "'lod'": "'#A0A03C'",
    "'morse'": "'#A0A054'",
    "'neon'": "'#A0A01C'",
    "'neon_grad'": "'#A0A04C'",
    "'neon_puls'": "'#A0A020'",
    "'neonfala'": "'#A0A004'",
    "'niebieski'": "'#0000FF'",
    "'obrys'": "'#A0A018'",
    "'ocean'": "'#A0A048'",
    "'ogien'": "'#A0A038'",
    "'orbita'": "'#C040FF'",
    "'piorun'": "'#A0A030'",
    "'plazma'": "'#A0A034'",
    "'pomaranczowy'": "'#FF9900'",
    "'pulse'": "'#FFFF30'",
    "'radar'": "'#A0A058'",
    "'rainbow'": "'#FF40FF'",
    "'ripple'": "'#00E0C0'",
    "'rozowy'": "'#FF66CC'",
    "'shake'": "'#FFA030'",
    "'skok'": "'#FF7000'",
    "'spin'": "'#FF80C0'",
    "'spryna'": "'#FF5070'",
    "'static_tv'": "'#A0A064'",
    "'sway'": "'#80FF80'",
    "'szarp'": "'#00B0B0'",
    "'szary'": "'#999999'",
    "'tecafala'": "'#A0A008'",
    "'tornado'": "'#90FF30'",
    "'tremor'": "'#A04000'",
    "'tsunami'": "'#4080FF'",
    "'wave'": "'#40E0FF'",
    "'wave_big'": "'#20B0FF'",
    "'wobble'": "'#E0C040'",
    "'zielony'": "'#00FF00'",
    "'zigzag'": "'#B0B000'",
    "'zloty_blask'": "'#A0A024'",
    "'zolty'": "'#FFFF00'",
    'bateria': '#A0A0A8',
    'dym': '#A0A070',
    'fala_fioletowa': '#A0A088',
    'fala_rozowa': '#A0A09C',
    'fala_zielona': '#A0A098',
    'fala_zlota': '#A0A08C',
    'gwiazdki': '#A0A0B4',
    'karmazyn': '#A0A0C4',
    'karuzela_neon': '#A0A07C',
    'konfetti': '#A0A084',
    'lawina': '#A0A06C',
    'luna': '#A0A0A4',
    'magnes': '#A0A090',
    'morska': '#A0A0C0',
    'neon_deszcz': '#A0A080',
    'neon_laser': '#A0A0B8',
    'neon_oddech': '#A0A074',
    'prad': '#A0A0A0',
    'sznurek': '#A0A094',
    'tancuj': '#A0A068',
    'tarcza': '#A0A0B0',
    'winda': '#A0A078',
    'wizja': '#A0A0C8',
    'wstecz': '#A0A0BC',
    'wyskok': '#A0A0AC',
}

TAG_RE = re.compile(r"<animacja:(\w+)>(.*?)</animacja>", re.S)

def build(text, snbt=True):
    parts = []
    pos = 0
    for m in TAG_RE.finditer(text):
        tag = m.group(1).lower()
        content = m.group(2)
        if m.start() > pos:
            parts.append((text[pos:m.start()], None))
        parts.append((content, TAGS.get(tag)))
        if TAGS.get(tag) is None:
            parts.append((tag, None))
        pos = m.end()
    if pos < len(text):
        parts.append((text[pos:], None))

    comps = []
    for chunk, color in parts:
        if not chunk:
            continue
        c = '{"text": "%s"' % chunk.replace("\\", "\\\\").replace('"', '\\"')
        if color:
            c += ', "color": "%s"' % color
        comps.append(c + "}")
    if not comps:
        comps = ['{"text": ""}']
    if not snbt:
        return "/tellraw @a [" + ", ".join(comps) + "]"
    # SNBT: klucze bez cudzyslow
    snbt_comps = [c.replace('{"text": ', "{text: ").replace('", "color": "', '", color: "')
                  for c in comps]
    return "/tellraw @a [" + ", ".join(snbt_comps) + "]"

def main():
    args = sys.argv[1:]
    snbt = True
    if args and args[0] == "--json":
        snbt = False
        args = args[1:]
    if args and args[0] == "--lista":
        print("75 animowanych (wszystkie = kolor + ruch):")
        for t, i, h, typ in [
            ("blysk",1,"A0A000","fragment"),("neonfala",2,"A0A004","fragment"),("tecafala",3,"A0A008","fragment"),
            ("kaskada",4,"A0A00C","fragment"),("laser2",5,"A0A010","fragment"),("grzmot",6,"A0A014","fragment"),
            ("obrys",7,"A0A018","fragment"),("neon",8,"A0A01C","fragment"),("neon_puls",9,"A0A020","fragment"),
            ("zloty_blask",10,"A0A024","fragment"),("galaktyka",11,"A0A028","fragment"),("krew",12,"A0A02C","fragment"),
            ("piorun",13,"A0A030","fragment"),
            ("plazma",26,"A0A034","fragment"),("ogien",27,"A0A038","fragment"),("lod",28,"A0A03C","fragment"),
            ("diament",29,"A0A040","fragment"),("aurora",30,"A0A044","fragment"),("ocean",31,"A0A048","fragment"),
            ("neon_grad",32,"A0A04C","fragment"),("chroma",33,"A0A050","fragment"),("morse",34,"A0A054","fragment"),
            ("radar",35,"A0A058","fragment"),("glow",36,"A0A05C","fragment"),("holo",37,"A0A060","fragment"),
            ("static_tv",38,"A0A064","fragment"),("wave",14,"40E0FF","kinetyczny"),("wave_big",15,"20B0FF","kinetyczny"),
            ("rainbow",16,"FF40FF","kinetyczny"),("glitch_hard",17,"FF3050","kinetyczny"),("tsunami",18,"4080FF","kinetyczny"),
            ("karuzela",19,"FF9030","kinetyczny"),("tornado",20,"90FF30","kinetyczny"),("bumper",21,"FF30A0","kinetyczny"),
            ("pulse",22,"FFFF30","kinetyczny"),("heartbeat",23,"FF3030","kinetyczny"),("flicker",24,"F0F0F0","kinetyczny"),
            ("shake",25,"FFA030","kinetyczny"),
            ("ripple",39,"00E0C0","kinetyczny"),("orbita",40,"C040FF","kinetyczny"),("skok",41,"FF7000","kinetyczny"),
            ("sway",42,"80FF80","kinetyczny"),("hopwave",43,"00FF90","kinetyczny"),("wobble",44,"E0C040","kinetyczny"),
            ("spin",45,"FF80C0","kinetyczny"),("tremor",46,"A04000","kinetyczny"),("floaty",47,"60A0FF","kinetyczny"),
            ("zigzag",48,"B0B000","kinetyczny"),("spryna",49,"FF5070","kinetyczny"),("szarp",50,"00B0B0","kinetyczny"),
            ("tancuj",51,"A0A068","hybryda"),("lawina",52,"A0A06C","hybryda"),("dym",53,"A0A070","hybryda"),
            ("neon_oddech",54,"A0A074","hybryda"),("winda",55,"A0A078","hybryda"),("karuzela_neon",56,"A0A07C","hybryda"),
            ("neon_deszcz",57,"A0A080","hybryda"),("konfetti",58,"A0A084","hybryda"),("fala_fioletowa",59,"A0A088","hybryda"),
            ("fala_zlota",60,"A0A08C","hybryda"),("magnes",61,"A0A090","hybryda"),("sznurek",62,"A0A094","hybryda"),
            ("fala_zielona",63,"A0A098","hybryda"),("fala_rozowa",64,"A0A09C","hybryda"),("prad",65,"A0A0A0","hybryda"),
            ("luna",66,"A0A0A4","hybryda"),("bateria",67,"A0A0A8","hybryda"),("wyskok",68,"A0A0AC","hybryda"),
            ("tarcza",69,"A0A0B0","hybryda"),("gwiazdki",70,"A0A0B4","hybryda"),("neon_laser",71,"A0A0B8","hybryda"),
            ("wstecz",72,"A0A0BC","hybryda"),("morska",73,"A0A0C0","hybryda"),("karmazyn",74,"A0A0C4","hybryda"),
            ("wizja",75,"A0A0C8","hybryda")]:
            print("  %-14s #%s  (%s)" % (t, h, typ))
        print("11 kolorow:")
        for t, i, h, typ in [
            ("czerwony",0,"FF0000","kolor"),("zielony",0,"00FF00","kolor"),("niebieski",0,"0000FF","kolor"),
            ("zolty",0,"FFFF00","kolor"),("pomaranczowy",0,"FF9900","kolor"),("fioletowy",0,"CC00FF","kolor"),
            ("rozowy",0,"FF66CC","kolor"),("cyjan",0,"00FFFF","kolor"),("bialy",0,"FFFFFF","kolor"),
            ("szary",0,"999999","kolor"),("brazowy",0,"8B4513","kolor")]:
            print("  %-14s #%s" % (t, h))
        return
    if not args:
        print(__doc__)
        return
    text = " ".join(args)
    print(build(text, snbt))

if __name__ == "__main__":
    main()
