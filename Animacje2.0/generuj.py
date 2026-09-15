#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Animacje 2.0 — GENERATOR (edytuj JSON-y, uruchom skrypt, gotowe):

  kolory.json  — plik z HEXAMI:  "nazwa_efektu": "#RRGGBB"
                 np.  "rainbow": "#B1E75C"   (zamiast #FF40FF)
  konfig.json  — opcje globalne:
                 "predkosc"      (1.0 = norma; 2.0 = 2x szybciej)
                 "amplituda"     (1.0 = norma; 1.5 = wieksze ruchy)
                 "intensywnosc"  (1.0 = norma; 1.3 = jasniejsze kolory)
                 "wylaczone"     (lista nazw; efekt zostaje zwyklym kolorem)

Uzytek:
    python3 generuj.py

Zmiany hexow w konwerterze dzialaja BEZ generuj.py (czyta kolory.json na zywo).
generuj.py aplikuje je do shaderow (w grze) oraz do README.md i KOMENDY.md.
"""
import io, json, os, re, sys

ROOT = os.path.dirname(os.path.abspath(__file__))
INCL = os.path.join(ROOT, "assets", "minecraft", "shaders", "include")
CORES = (os.path.join(ROOT, "assets", "minecraft", "shaders", "core"),
         os.path.join(ROOT, "old", "assets", "minecraft", "shaders", "core"),
         os.path.join(ROOT, "v262", "assets", "minecraft", "shaders", "core"))

def load_json(name, default):
    p = os.path.join(ROOT, name)
    if os.path.isfile(p):
        try:
            return json.load(io.open(p, encoding="utf-8"))
        except Exception as e:
            sys.exit("Bledny %s: %s" % (name, e))
    return default

def hex_to_ivec(h):
    h = h.lstrip("#")
    return int(h[0:2], 16), int(h[2:4], 16), int(h[4:6], 16)

# ---------- owijanie/odwijanie (tokeny TFX_* nie wystepuja w kodzie zrodlowym) ----------
UNWRAP_GT1 = re.compile(r"\(GameTime \* TFX_SPD\) \* +")
UNWRAP_GT2 = re.compile(r"\(GameTime \* TFX_SPD\)")
UNWRAP_AMP = re.compile(r"^(\s*)tfxOffg\.([xy]) (\+=|-=) \((.*)\) \* TFX_AMP;$", re.M)

def unwrap(s):
    s = UNWRAP_GT1.sub("GameTime * ", s)
    s = UNWRAP_GT2.sub("GameTime", s)
    s = UNWRAP_AMP.sub(r"\1tfxOffg.\2 \3 \4;", s)
    return s

def wrap_speed(s):
    def repl(m):
        return "(GameTime * TFX_SPD) * " if m.group(1) else "(GameTime * TFX_SPD)"
    s = re.sub(r"GameTime(\s*\*)?", repl, s)
    return s

def wrap_amp(s):
    s = re.sub(r"^(\s*)tfxOffg\.([xy]) (\+=|-=) (.+);",
               lambda m: "%stfxOffg.%s %s (%s) * TFX_AMP;" % (m.group(1), m.group(2), m.group(3), m.group(4)),
               s, flags=re.M)
    return s

def main():
    kolory = load_json("kolory.json", {})
    konfig = load_json("konfig.json", {})
    spd = float(konfig.get("predkosc", 1.0))
    amp = float(konfig.get("amplituda", 1.0))
    inten = float(konfig.get("intensywnosc", 1.0))
    wylaczone = set(konfig.get("wylaczone", []))

    # ---------- 1) efekty: hex + wylaczenie + konfig ----------
    zmienione = 0
    for fn in sorted(os.listdir(INCL)):
        if not (fn.startswith("tfx_") and fn.endswith(".vsh") and fn != "tfx_common.vsh"):
            continue
        tag = fn[4:-4]
        p = os.path.join(INCL, fn)
        s = io.open(p, encoding="utf-8").read()
        o = s
        if tag in kolory:
            r, g, b = hex_to_ivec(kolory[tag])
            s = re.sub(r"\bivec3\(\d+, \d+, \d+\)", "ivec3(%d, %d, %d)" % (r, g, b), s, count=1)
        if tag in wylaczone and "if (false && c ==" not in s:
            s = s.replace("if (c ==", "if (false && c ==")
        elif tag not in wylaczone and "if (false && c ==" in s:
            s = s.replace("if (false && c ==", "if (c ==")
        s = unwrap(s)
        s = re.sub(r"GameTime \* +", "GameTime * ", s)
        if spd != 1.0:
            s = wrap_speed(s)
        if amp != 1.0:
            s = wrap_amp(s)
        if s != o:
            io.open(p, "w", encoding="utf-8").write(s)
            zmienione += 1

    # fsh: predkosc (kolory tez maja animacje)
    for fn in sorted(os.listdir(INCL)):
        if not (fn.startswith("tfx_") and fn.endswith(".fsh") and fn != "tfx_common.fsh"):
            continue
        tag = fn[4:-4]
        if tag in wylaczone:
            continue
        p = os.path.join(INCL, fn)
        s = io.open(p, encoding="utf-8").read()
        o = s
        s = unwrap(s)
        s = re.sub(r"GameTime \* +", "GameTime * ", s)
        if spd != 1.0:
            s = wrap_speed(s)
        if s != o:
            io.open(p, "w", encoding="utf-8").write(s)
            zmienione += 1

    # ---------- 2) define w common ----------
    p = os.path.join(INCL, "tfx_common.vsh")
    s = io.open(p, encoding="utf-8").read()
    s = re.sub(r"#define TFX_SPD [0-9.]+\n#define TFX_AMP [0-9.]+\n\n?", "", s)
    anchor = "void tfxDetect(ivec3 c, float g) {"
    assert anchor in s
    s = s.replace(anchor, "#define TFX_SPD %s\n#define TFX_AMP %s\n\n%s" % (spd, amp, anchor))
    io.open(p, "w", encoding="utf-8").write(s)

    p = os.path.join(INCL, "tfx_common.fsh")
    s = io.open(p, encoding="utf-8").read()
    s = re.sub(r"#define TFX_SPD [0-9.]+\n#define TFX_INT [0-9.]+\n\n?", "", s)
    anchor = "    #moj_import <tfx_blysk.fsh>"
    assert anchor in s
    s = s.replace(anchor, "#define TFX_SPD %s\n#define TFX_INT %s\n\n%s" % (spd, inten, anchor))
    io.open(p, "w", encoding="utf-8").write(s)

    # ---------- 3) dispatch FSH: intensywnosc ----------
    for core in CORES:
        for fn in sorted(os.listdir(core)):
            if not fn.endswith(".fsh"):
                continue
            p = os.path.join(core, fn)
            s = io.open(p, encoding="utf-8").read()
            o = s
            s = s.replace(" color.rgb *= TFX_INT;", "")
            if inten != 1.0:
                s = re.sub(r"(color = tfxRender\w+\(uv, texColor, tfxColor\);)",
                           r"\1 color.rgb *= TFX_INT;", s)
            if s != o:
                io.open(p, "w", encoding="utf-8").write(s)

    # ---------- 4) README.md ----------
    p = os.path.join(ROOT, "README.md")
    s = io.open(p, encoding="utf-8").read()
    o = s
    for tag, hexk in kolory.items():
        pat = re.compile(r"(\| `%s` \| )`#[0-9A-Fa-f]{6}`" % re.escape(tag))
        s = pat.sub(lambda m: m.group(1) + "`%s`" % hexk, s)
    if s != o:
        io.open(p, "w", encoding="utf-8").write(s)

    # ---------- 5) KOMENDY.md ----------
    p = os.path.join(ROOT, "KOMENDY.md")
    s = io.open(p, encoding="utf-8").read()
    o = s
    lines = s.splitlines(keepends=True)
    for i, ln in enumerate(lines):
        m = re.match(r"^# (\w+)\s*$", ln)
        if m and i + 1 < len(lines) and "/tellraw" in lines[i + 1]:
            tag = m.group(1)
            if tag in kolory:
                lines[i + 1] = re.sub(r"#[0-9A-Fa-f]{6}", kolory[tag], lines[i + 1], count=1)
    s = "".join(lines)
    if s != o:
        io.open(p, "w", encoding="utf-8").write(s)

    print("generuj.py: gotowe.")
    print("  predkosc=%s  amplituda=%s  intensywnosc=%s" % (spd, amp, inten))
    if wylaczone:
        print("  wylaczone:", ", ".join(sorted(wylaczone)))
    print("  zmienione pliki: %d" % zmienione)
    print("  podpowiedz: konwerter.py czuje kolory.json bez generuj.py")

if __name__ == "__main__":
    main()
