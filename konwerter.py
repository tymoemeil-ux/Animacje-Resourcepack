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
    "bialy": "#FFFFFF",
    "blysk": "#A0A000",
    "brazowy": "#8B4513",
    "bumper": "#FF30A0",
    "cyjan": "#00FFFF",
    "czerwony": "#FF0000",
    "fioletowy": "#CC00FF",
    "flicker": "#F0F0F0",
    "galaktyka": "#A0A028",
    "glitch_hard": "#FF3050",
    "grzmot": "#A0A014",
    "heartbeat": "#FF3030",
    "karuzela": "#FF9030",
    "kaskada": "#A0A00C",
    "krew": "#A0A02C",
    "laser2": "#A0A010",
    "neon": "#A0A01C",
    "neon_puls": "#A0A020",
    "neonfala": "#A0A004",
    "niebieski": "#0000FF",
    "obrys": "#A0A018",
    "piorun": "#A0A030",
    "pomaranczowy": "#FF9900",
    "pulse": "#FFFF30",
    "rainbow": "#FF40FF",
    "rozowy": "#FF66CC",
    "shake": "#FFA030",
    "szary": "#999999",
    "tecafala": "#A0A008",
    "tornado": "#90FF30",
    "tsunami": "#4080FF",
    "wave": "#40E0FF",
    "wave_big": "#20B0FF",
    "zielony": "#00FF00",
    "zloty_blask": "#A0A024",
    "zolty": "#FFFF00"
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
        print("25 animowanych:")
        for t, i, h, typ in [
            ("blysk",1,"A0A000","fragment"),("neonfala",2,"A0A004","fragment"),("tecafala",3,"A0A008","fragment"),
            ("kaskada",4,"A0A00C","fragment"),("laser2",5,"A0A010","fragment"),("grzmot",6,"A0A014","fragment"),
            ("obrys",7,"A0A018","fragment"),("neon",8,"A0A01C","fragment"),("neon_puls",9,"A0A020","fragment"),
            ("zloty_blask",10,"A0A024","fragment"),("galaktyka",11,"A0A028","fragment"),("krew",12,"A0A02C","fragment"),
            ("piorun",13,"A0A030","fragment"),("wave",14,"40E0FF","kinetyczny"),("wave_big",15,"20B0FF","kinetyczny"),
            ("rainbow",16,"FF40FF","kinetyczny"),("glitch_hard",17,"FF3050","kinetyczny"),("tsunami",18,"4080FF","kinetyczny"),
            ("karuzela",19,"FF9030","kinetyczny"),("tornado",20,"90FF30","kinetyczny"),("bumper",21,"FF30A0","kinetyczny"),
            ("pulse",22,"FFFF30","kinetyczny"),("heartbeat",23,"FF3030","kinetyczny"),("flicker",24,"F0F0F0","kinetyczny"),
            ("shake",25,"FFA030","kinetyczny")]:
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
