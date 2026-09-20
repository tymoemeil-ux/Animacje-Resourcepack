#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Buduje Animacje 3.1: kuratorowany pack z 85 efektami tekstowymi.

Efekty bazowe są wybrane z Animacje2.0, a 35 nowych efektów (25 premium i 10
hakerskich) jest generowanych specjalnie dla 3.1. Skrypt generuje wspólny
shader, dispatcher i katalog pluginu z jednej listy źródłowej.
"""
from __future__ import annotations

import json
import re
import shutil
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "Animacje2.0" / "assets" / "minecraft" / "shaders"
OUT = ROOT / "Animacje3.0"
ZIP = ROOT / "Animacje3.0.zip"
OLD_CATALOG = ROOT / "plugin" / "res" / "fx_katalog.json"

# 46 sprawdzonych efektów z 2.0 + 4 nowe efekty. Kolejność jest też kolejnością
# w katalogu GUI i w losowaniu nicków/trolli.
EFFECTS = [
    ("blysk", "fragment", "Szybkie świetlne rozbłyski"),
    ("neonfala", "neon", "Płynąca fala neonowa"),
    ("tecafala", "neon", "Tęczowa fala"),
    ("kaskada", "ruch", "Kaskada światła spływająca po literach"),
    ("laser2", "neon", "Przelatujący laser"),
    ("grzmot", "energia", "Elektryczne, krótkie uderzenia"),
    ("neon", "neon", "Czysty pulsujący neon"),
    ("neon_puls", "neon", "Neon z mocnym pulsem"),
    ("zloty_blask", "metal", "Złoty, przesuwający się blask"),
    ("galaktyka", "kosmos", "Głębia galaktycznych kolorów"),
    ("piorun", "energia", "Jasne wyładowania pioruna"),
    ("plazma", "energia", "Gorąca, wirująca plazma"),
    ("ogien", "zywioly", "Żywy ogień"),
    ("lod", "zywioly", "Chłodny lodowy połysk"),
    ("diament", "klejnot", "Iskrzący diament"),
    ("aurora", "kosmos", "Zorza polarna"),
    ("ocean", "zywioly", "Głębinowa fala oceanu"),
    ("neon_grad", "neon", "Gradient neonowych barw"),
    ("chroma", "neon", "Płynna zmiana chromy"),
    ("wave", "ruch", "Delikatne falowanie"),
    ("rainbow", "neon", "Pełna tęcza przesuwająca się po tekście"),
    ("glitch_hard", "cyber", "Mocny cyfrowy glitch"),
    ("tsunami", "ruch", "Duża morska fala"),
    ("karuzela", "ruch", "Kolorowa karuzela"),
    ("tornado", "ruch", "Wirujący tornado"),
    ("pulse", "energia", "Równy puls"),
    ("heartbeat", "energia", "Podwójne bicie serca"),
    ("ripple", "ruch", "Kręgi rozchodzące się po tekście"),
    ("orbita", "kosmos", "Orbitalny ruch światła"),
    ("skok", "ruch", "Sprężysty skok liter"),
    ("spin", "ruch", "Miękki obrót"),
    ("floaty", "ruch", "Lekkie unoszenie"),
    ("zigzag", "ruch", "Energetyczny zygzak"),
    ("tancuj", "ruch", "Taneczny rytm"),
    ("lawina", "ruch", "Spadająca lawina iskier"),
    ("dym", "zywioly", "Dryfujący dym"),
    ("neon_deszcz", "neon", "Deszcz neonowych smug"),
    ("konfetti", "ruch", "Konfetti i świętowanie"),
    ("fala_wodna", "zywioly", "Wodna fala od lewej do prawej"),
    ("spirala", "ruch", "Spiralny ruch w górę"),
    ("metronom", "ruch", "Rytmiczny metronom"),
    ("matrix", "cyber", "Zielony kod Matrixa"),
    ("gwiazdy_zloto", "kosmos", "Złote gwiazdy"),
    ("pulsar_neonowy", "kosmos", "Jasny neonowy pulsar"),
    ("wir_galaktyka", "kosmos", "Galaktyczny wir"),
    ("kap_wodny", "zywioly", "Krople wody"),
    ("kometa", "nowe", "Nowa: świetlna kometa z ogonem"),
    ("iskry", "nowe", "Nowa: losowo migoczące iskry"),
    ("pryzmat", "nowe", "Nowa: kryształowy pryzmat"),
    ("szklo", "nowe", "Nowa: szklany połysk"),
    # 25 nowych, płynnych efektów premium.
    ("spectrum", "premium", "Płynne spektrum kolorów"),
    ("aurora_flow", "premium", "Wolno płynąca zorza"),
    ("sunset", "premium", "Ciepły gradient zachodu słońca"),
    ("firefly", "premium", "Migoczące świetliki"),
    ("electric", "premium", "Szybkie elektryczne impulsy"),
    ("glow", "premium", "Miękka poświata oddechu"),
    ("ice_crystal", "premium", "Krystaliczny lodowy blask"),
    ("lava", "premium", "Płynna lawa i żar"),
    ("moonlight", "premium", "Chłodne światło księżyca"),
    ("starlight", "premium", "Gwiezdne migotanie"),
    ("gold_rush", "premium", "Złoty pęd światła"),
    ("pixel", "premium", "Pikselowy skok kolorów"),
    ("scanline", "premium", "Cybernetyczna linia skanu"),
    ("wave2", "premium", "Głęboka fala świetlna"),
    ("ripple2", "premium", "Koncentryczne pulsowanie"),
    ("bounce", "premium", "Sprężyste odbicie liter"),
    ("swing", "premium", "Rytmiczne wychylenie"),
    ("jelly", "premium", "Miękkie żelowe falowanie"),
    ("orbit2", "premium", "Kolorowa orbita"),
    ("comet2", "premium", "Szybka kometa neonowa"),
    ("sparkle", "premium", "Czyste iskierki"),
    ("prism2", "premium", "Pryzmatyczny połysk"),
    ("breath", "premium", "Spokojny oddech koloru"),
    ("gradient", "premium", "Elegancki gradient"),
    ("mirror", "premium", "Lustrzane przejście"),
    # 10 efektów hakerskich — osobna kategoria i permission.
    ("hack_matrix", "hakerskie", "Hakerski deszcz kodu Matrix"),
    ("hack_terminal", "hakerskie", "Zielony terminal CRT"),
    ("hack_cyber", "hakerskie", "Cyberpunkowy skan cyan/magenta"),
    ("hack_redteam", "hakerskie", "Czerwony tryb red team"),
    ("hack_zeroday", "hakerskie", "Agresywny zero-day glitch"),
    ("hack_root", "hakerskie", "Fioletowy dostęp root"),
    ("hack_binary", "hakerskie", "Binarny strumień danych"),
    ("hack_glitch", "hakerskie", "Kompresyjny glitch terminala"),
    ("hack_virus", "hakerskie", "Zielono-czerwony wirus"),
    ("hack_overclock", "hakerskie", "Przegrzany overclock"),
]

NEW_COLORS = {
    "kometa": "B0C001",
    "iskry": "B0C002",
    "pryzmat": "B0C003",
    "szklo": "B0C004",
    "spectrum": "F05A28",
    "aurora_flow": "00D4A8",
    "sunset": "FF8A3D",
    "firefly": "E8FF4F",
    "electric": "3D7CFF",
    "glow": "FFD166",
    "ice_crystal": "8BE9FD",
    "lava": "FF3D2E",
    "moonlight": "A8B8FF",
    "starlight": "FFF1A8",
    "gold_rush": "FFB000",
    "pixel": "B967FF",
    "scanline": "18E0FF",
    "wave2": "38BDF8",
    "ripple2": "00F5D4",
    "bounce": "FF5DA2",
    "swing": "C77DFF",
    "jelly": "7AF0D1",
    "orbit2": "5E60CE",
    "comet2": "FF6B35",
    "sparkle": "FFFFFF",
    "prism2": "D8B4FE",
    "breath": "94A3B8",
    "gradient": "F15BB5",
    "mirror": "72EFDD",
    "hack_matrix": "21DE4B",
    "hack_terminal": "7CFF6B",
    "hack_cyber": "00F0FF",
    "hack_redteam": "FF1744",
    "hack_zeroday": "FF00AA",
    "hack_root": "A855F7",
    "hack_binary": "00FF88",
    "hack_glitch": "B6FF00",
    "hack_virus": "C6FF00",
    "hack_overclock": "FF6D00",
}

NEW_VSH = {
    "kometa": """// Animacje 3.0 — nowy efekt: kometa\nif (c == ivec3(176, 192, 1)) {\n    tfxIDg = 47.0;\n    tfxBaseg = vec4(1.0);\n    tfxOffg.y += sin(GameTime * 2.0 + g * 0.22) * 0.006;\n}\n""",
    "iskry": """// Animacje 3.0 — nowy efekt: iskry\nif (c == ivec3(176, 192, 2)) {\n    tfxIDg = 48.0;\n    tfxBaseg = vec4(1.0);\n    tfxOffg.y += sin(GameTime * 3.0 + g * 0.7) * 0.004;\n}\n""",
    "pryzmat": """// Animacje 3.0 — nowy efekt: pryzmat\nif (c == ivec3(176, 192, 3)) {\n    tfxIDg = 49.0;\n    tfxBaseg = vec4(1.0);\n    tfxOffg.x += sin(GameTime * 1.8 + g * 0.16) * 0.005;\n}\n""",
    "szklo": """// Animacje 3.0 — nowy efekt: szkło\nif (c == ivec3(176, 192, 4)) {\n    tfxIDg = 50.0;\n    tfxBaseg = vec4(1.0);\n    tfxOffg.y += sin(GameTime * 1.5 + g * 0.3) * 0.003;\n}\n""",
}

NEW_FSH = {
    "kometa": """vec4 tfxRenderKometa(vec2 uv, vec4 tex, vec4 base) {\n    float a = tex.a;\n    float t = GameTime;\n    float x = gl_FragCoord.x * 0.005;\n    float head = 1.0 - smoothstep(0.0, 0.10, fract(x - t * 0.75));\n    float tail = 1.0 - smoothstep(0.0, 0.58, fract(x - t * 0.75 + 0.18));\n    vec3 cold = vec3(0.15, 0.72, 1.0);\n    vec3 hot = vec3(1.0, 0.92, 0.55);\n    vec3 col = mix(cold, hot, head) * (0.72 + 0.42 * tail) + vec3(0.25) * head;\n    return vec4(clamp(col, 0.0, 1.0), a);\n}\n""",
    "iskry": """vec4 tfxRenderIskry(vec2 uv, vec4 tex, vec4 base) {\n    float a = tex.a;\n    float t = GameTime;\n    float seed = tfxHashF(vec2(floor(tfxPos.x * 0.18), floor(tfxPos.y * 0.30)));\n    float twinkle = 0.45 + 0.55 * sin(t * (4.0 + seed * 5.0) + seed * 20.0);\n    float hue = fract(0.10 + seed * 0.12 + t * 0.06);\n    vec3 col = tfxHsv(hue, 0.62, 0.72 + 0.28 * max(twinkle, 0.0));\n    return vec4(col, a);\n}\n""",
    "pryzmat": """vec4 tfxRenderPryzmat(vec2 uv, vec4 tex, vec4 base) {\n    float a = tex.a;\n    float t = GameTime;\n    float sweep = sin(gl_FragCoord.x * 0.018 - t * 2.2);\n    float h = fract(0.56 + t * 0.12 + sweep * 0.16);\n    float shine = 0.78 + 0.22 * sin(gl_FragCoord.x * 0.05 - t * 5.0);\n    return vec4(tfxHsv(h, 0.82, shine), a);\n}\n""",
    "szklo": """vec4 tfxRenderSzklo(vec2 uv, vec4 tex, vec4 base) {\n    float a = tex.a;\n    float t = GameTime;\n    float scan = 0.5 + 0.5 * sin(gl_FragCoord.x * 0.030 - t * 3.0);\n    float glint = pow(max(scan, 0.0), 8.0);\n    vec3 col = vec3(0.34, 0.86, 1.0) * (0.68 + 0.20 * scan) + vec3(0.85, 0.98, 1.0) * glint;\n    return vec4(clamp(col, 0.0, 1.0), a);\n}\n""",
}

# Style shaderów generowanych dla 35 nowych efektów. Każdy efekt dostaje własny
# trigger, funkcję FSH i opcjonalny ruch VSH; dzięki temu pack nie udaje 35
# aliasów jednego filtra.
EXTRA_STYLES = {
    "spectrum": "spectrum",
    "aurora_flow": "aurora",
    "sunset": "sunset",
    "firefly": "firefly",
    "electric": "electric",
    "glow": "glow",
    "ice_crystal": "ice",
    "lava": "lava",
    "moonlight": "moonlight",
    "starlight": "starlight",
    "gold_rush": "gold",
    "pixel": "pixel",
    "scanline": "scanline",
    "wave2": "wave2",
    "ripple2": "ripple2",
    "bounce": "bounce",
    "swing": "swing",
    "jelly": "jelly",
    "orbit2": "orbit2",
    "comet2": "comet2",
    "sparkle": "sparkle",
    "prism2": "prism2",
    "breath": "breath",
    "gradient": "gradient",
    "mirror": "mirror",
    "hack_matrix": "hack_matrix",
    "hack_terminal": "hack_terminal",
    "hack_cyber": "hack_cyber",
    "hack_redteam": "hack_redteam",
    "hack_zeroday": "hack_zeroday",
    "hack_root": "hack_root",
    "hack_binary": "hack_binary",
    "hack_glitch": "hack_glitch",
    "hack_virus": "hack_virus",
    "hack_overclock": "hack_overclock",
}

EXTRA_OFFSETS = {
    "bounce": "tfxOffg.y += sin(GameTime * 6.0 + g * 0.55) * 0.010;",
    "swing": "tfxOffg.x += sin(GameTime * 4.0 + g * 0.40) * 0.008;",
    "jelly": "tfxOffg.y += sin(GameTime * 5.0 + g * 0.75) * 0.006;",
    "orbit2": "tfxOffg.y += sin(GameTime * 3.0 + g * 0.35) * 0.005;",
    "comet2": "tfxOffg.y += sin(GameTime * 7.0 + g * 0.20) * 0.004;",
    "hack_zeroday": "tfxOffg.x += (tfxHash(vec2(g, floor(GameTime * 18.0))) - 0.5) * 0.012;",
    "hack_glitch": "tfxOffg.x += (tfxHash(vec2(g, floor(GameTime * 24.0))) - 0.5) * 0.016;",
    "hack_overclock": "tfxOffg.y += sin(GameTime * 11.0 + g * 0.50) * 0.004;",
}


def shader_function_name(name: str) -> str:
    return "tfxRender" + "".join(part[:1].upper() + part[1:] for part in name.split("_"))


def generated_vsh(name: str, effect_id: int, color: str) -> str:
    offset = EXTRA_OFFSETS.get(name, "")
    extra = "\n    " + offset if offset else ""
    return (
        f"// Animacje 3.1 — nowy efekt: {name}\n"
        f"if (c == ivec3({hex_to_ivec(color)})) {{\n"
        f"    tfxIDg = {effect_id}.0;\n"
        f"    tfxBaseg = vec4(1.0);{extra}\n"
        "}\n"
    )


def generated_fsh(name: str) -> str:
    fn = shader_function_name(name)
    style = EXTRA_STYLES[name]
    bodies = {
        "spectrum": "float h = fract(t * 0.10 + tfxPos.x * 0.012);\n    return vec4(tfxHsv(h, 0.88, 0.98), a);",
        "aurora": "float h = fract(0.40 + sin(t * 0.7 + tfxPos.x * 0.018) * 0.16);\n    return vec4(tfxHsv(h, 0.72, 0.96), a);",
        "sunset": "float p = 0.5 + 0.5 * sin(t * 0.8 + gl_FragCoord.x * 0.018);\n    return vec4(mix(vec3(1.0, 0.25, 0.08), vec3(0.98, 0.82, 0.22), p), a);",
        "firefly": "float seed = tfxHashF(vec2(floor(tfxPos.x * 0.22), floor(tfxPos.y * 0.35)));\n    float p = max(0.0, sin(t * (3.0 + seed * 5.0) + seed * 24.0));\n    return vec4(vec3(0.72, 1.0, 0.22) * (0.42 + p * 0.72), a);",
        "electric": "float p = pow(max(0.0, sin(t * 14.0 + gl_FragCoord.x * 0.09)), 8.0);\n    return vec4(mix(vec3(0.08, 0.35, 1.0), vec3(0.82, 0.96, 1.0), p), a);",
        "glow": "float p = 0.5 + 0.5 * sin(t * 2.6);\n    return vec4(vec3(0.32, 0.78, 1.0) * (0.60 + 0.40 * p), a);",
        "ice": "float p = 0.5 + 0.5 * sin(gl_FragCoord.x * 0.045 - t * 4.0);\n    return vec4(vec3(0.45, 0.90, 1.0) * (0.72 + 0.28 * p), a);",
        "lava": "float p = 0.5 + 0.5 * sin(t * 3.0 + gl_FragCoord.x * 0.025);\n    return vec4(mix(vec3(0.55, 0.03, 0.01), vec3(1.0, 0.55, 0.03), p), a);",
        "moonlight": "float p = 0.5 + 0.5 * sin(t * 1.4);\n    return vec4(vec3(0.36, 0.50, 1.0) * (0.72 + 0.28 * p), a);",
        "starlight": "float seed = tfxHashF(vec2(floor(gl_FragCoord.x * 0.12), floor(gl_FragCoord.y * 0.12)));\n    float p = pow(max(0.0, sin(t * (2.0 + seed * 6.0) + seed * 30.0)), 5.0);\n    return vec4(vec3(0.62, 0.78, 1.0) + vec3(1.0) * p * 0.45, a);",
        "gold": "float p = 0.5 + 0.5 * sin(gl_FragCoord.x * 0.035 - t * 5.5);\n    return vec4(vec3(1.0, 0.54, 0.05) * (0.65 + 0.35 * p), a);",
        "pixel": "float p = floor((0.5 + 0.5 * sin(t * 4.0 + gl_FragCoord.x * 0.03)) * 5.0) / 5.0;\n    return vec4(tfxHsv(fract(0.58 + p * 0.22), 0.9, 0.72 + p * 0.28), a);",
        "scanline": "float p = 0.5 + 0.5 * sin(gl_FragCoord.x * 0.10 - t * 8.0);\n    return vec4(vec3(0.02, 0.78, 1.0) * (0.50 + 0.50 * p), a);",
        "wave2": "float p = 0.5 + 0.5 * sin(tfxPos.x * 0.075 - t * 5.5);\n    return vec4(tfxHsv(fract(0.50 + p * 0.10), 0.82, 0.78 + p * 0.22), a);",
        "ripple2": "float p = 0.5 + 0.5 * sin(length(vec2(gl_FragCoord.x, gl_FragCoord.y)) * 0.08 - t * 6.0);\n    return vec4(vec3(0.08, 0.85, 0.72) * (0.62 + 0.38 * p), a);",
        "bounce": "float p = 0.5 + 0.5 * sin(t * 6.0);\n    return vec4(vec3(1.0, 0.25, 0.62) * (0.62 + 0.38 * p), a);",
        "swing": "float p = 0.5 + 0.5 * sin(t * 4.0);\n    return vec4(tfxHsv(fract(0.82 + p * 0.10), 0.62, 0.78 + p * 0.22), a);",
        "jelly": "float p = 0.5 + 0.5 * sin(t * 5.0);\n    return vec4(vec3(0.30, 1.0, 0.78) * (0.62 + p * 0.38), a);",
        "orbit2": "float h = fract(0.60 + atan(tfxPos.y, tfxPos.x) / 6.28318 + t * 0.12);\n    return vec4(tfxHsv(h, 0.82, 0.94), a);",
        "comet2": "float p = 0.5 + 0.5 * sin(gl_FragCoord.x * 0.025 - t * 9.0);\n    return vec4(mix(vec3(0.12, 0.70, 1.0), vec3(1.0, 0.55, 0.18), p), a);",
        "sparkle": "float seed = tfxHashF(vec2(floor(gl_FragCoord.x * 0.18), floor(gl_FragCoord.y * 0.18)));\n    float p = pow(max(0.0, sin(t * (4.0 + seed * 4.0) + seed * 12.0)), 7.0);\n    return vec4(vec3(0.92, 0.96, 1.0) * (0.68 + p * 0.32), a);",
        "prism2": "float h = fract(0.78 + t * 0.16 + sin(gl_FragCoord.x * 0.04) * 0.18);\n    return vec4(tfxHsv(h, 0.78, 0.98), a);",
        "breath": "float p = 0.5 + 0.5 * sin(t * 1.8);\n    return vec4(vec3(0.46, 0.66, 0.88) * (0.56 + p * 0.44), a);",
        "gradient": "float h = fract(0.06 + gl_FragCoord.x * 0.0025 + t * 0.05);\n    return vec4(tfxHsv(h, 0.70, 0.96), a);",
        "mirror": "float p = 0.5 + 0.5 * sin(abs(gl_FragCoord.x - 320.0) * 0.045 - t * 5.0);\n    return vec4(vec3(0.24, 0.92, 0.86) * (0.62 + p * 0.38), a);",
        "hack_matrix": "float p = step(0.56, fract(gl_FragCoord.y * 0.09 + t * 1.9 + tfxHashF(vec2(floor(gl_FragCoord.x * 0.08), 0.0))));\n    return vec4(vec3(0.05, 0.95, 0.20) * (0.45 + p * 0.55), a);",
        "hack_terminal": "float p = 0.5 + 0.5 * sin(gl_FragCoord.x * 0.035 - t * 3.5);\n    return vec4(vec3(0.22, 1.0, 0.30) * (0.62 + p * 0.38), a);",
        "hack_cyber": "float p = 0.5 + 0.5 * sin(gl_FragCoord.x * 0.055 - t * 7.0);\n    return vec4(mix(vec3(0.0, 0.95, 1.0), vec3(1.0, 0.0, 0.72), p), a);",
        "hack_redteam": "float p = 0.5 + 0.5 * sin(t * 8.0);\n    return vec4(vec3(1.0, 0.03, 0.08) * (0.55 + p * 0.45), a);",
        "hack_zeroday": "float p = tfxHashF(vec2(floor(gl_FragCoord.x * 0.12), floor(t * 18.0)));\n    return vec4(mix(vec3(0.95, 0.0, 0.55), vec3(1.0, 0.92, 0.05), step(0.58, p)), a);",
        "hack_root": "float h = fract(0.76 + t * 0.08 + sin(gl_FragCoord.x * 0.025) * 0.10);\n    return vec4(tfxHsv(h, 0.86, 0.96), a);",
        "hack_binary": "float p = step(0.5, fract(gl_FragCoord.x * 0.12 + t * 4.0));\n    return vec4(vec3(0.0, 1.0, 0.52) * (0.46 + p * 0.54), a);",
        "hack_glitch": "float p = step(0.62, tfxHashF(vec2(floor(gl_FragCoord.x * 0.20), floor(t * 25.0))));\n    return vec4(mix(vec3(0.10, 0.9, 1.0), vec3(0.72, 1.0, 0.0), p), a);",
        "hack_virus": "float p = 0.5 + 0.5 * sin(t * 10.0 + gl_FragCoord.x * 0.035);\n    return vec4(mix(vec3(0.75, 1.0, 0.0), vec3(1.0, 0.03, 0.10), p), a);",
        "hack_overclock": "float p = 0.5 + 0.5 * sin(t * 14.0 + gl_FragCoord.x * 0.07);\n    return vec4(vec3(1.0, 0.28, 0.0) * (0.52 + p * 0.48), a);",
    }
    return f"vec4 {fn}(vec2 uv, vec4 tex, vec4 base) {{\n    float a = tex.a;\n    float t = GameTime;\n    {bodies[style]}\n}}\n"


def hex_to_ivec(hex_value: str) -> str:
    h = hex_value.replace("#", "")
    return ", ".join(str(int(h[i : i + 2], 16)) for i in (0, 2, 4))


def load_old_catalog() -> dict[str, dict[str, str]]:
    raw = json.loads(OLD_CATALOG.read_text(encoding="utf-8"))
    return {str(row["nazwa"]): row for row in raw if int(row.get("id", 0)) > 0}


def transform_vsh(source: str, effect_id: int, hex_value: str) -> str:
    text = source
    text = re.sub(
        r"if\s*\(c\s*==\s*ivec3\([^)]*\)\)",
        f"if (c == ivec3({hex_to_ivec(hex_value)}))",
        text,
        count=1,
    )
    text, count = re.subn(
        r"(tfxIDg\s*=\s*)[-+0-9.]+(\s*;)",
        rf"\g<1>{effect_id}.0\g<2>",
        text,
        count=1,
    )
    if count != 1:
        raise RuntimeError(f"Nie znaleziono tfxIDg w {source[:50]}")
    return text.rstrip() + "\n"


def function_name(fsh: str) -> str:
    match = re.search(r"\bvec4\s+(tfx[A-Za-z0-9_]+)\s*\(", fsh)
    if not match:
        raise RuntimeError("Nie znaleziono funkcji renderującej")
    return match.group(1)


def write(path: Path, content: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(content, encoding="utf-8")


def build() -> list[dict[str, object]]:
    if len(EFFECTS) != 85 or len({name for name, _, _ in EFFECTS}) != 85:
        raise RuntimeError("Lista Animacje 3.1 musi zawierać dokładnie 85 unikalnych efektów")
    if not all(name in NEW_COLORS for name, _, _ in EFFECTS[50:]):
        raise RuntimeError("Każdy z 35 nowych efektów musi mieć kolor triggera")

    old = load_old_catalog()
    include = OUT / "assets" / "minecraft" / "shaders" / "include"
    core = OUT / "assets" / "minecraft" / "shaders" / "core"
    if OUT.exists():
        shutil.rmtree(OUT)
    if ZIP.exists():
        ZIP.unlink()
    include.mkdir(parents=True)
    core.mkdir(parents=True)

    vsh_source = (SOURCE / "core" / "rendertype_text.vsh").read_text(encoding="utf-8")
    vsh_source = vsh_source.replace("out vec2 tfxPos;", "out vec2 tfxPos;\nout float tfxCustom;")
    vsh_source = vsh_source.replace("#define GameTime (GameTime * 1200.0)", "#define TFX_FPS 60.0\n#define GameTime (GameTime * 1200.0)")
    vsh_source = vsh_source.replace("tfxPos = vec2(Position.x, Position.y);", "tfxPos = vec2(Position.x, Position.y);\n    tfxCustom = tfxCustomg;")
    write(core / "rendertype_text.vsh", vsh_source)
    old_fsh = (SOURCE / "core" / "rendertype_text.fsh").read_text(encoding="utf-8")
    fsh_prefix = old_fsh.split("void main()", 1)[0].rstrip()
    fsh_prefix = fsh_prefix.replace("in vec2 tfxPos;", "in vec2 tfxPos;\nin float tfxCustom;")
    shutil.copy2(SOURCE / "core" / "rendertype_text.json", core / "rendertype_text.json")
    shutil.copy2(ROOT / "Animacje2.0" / "LICENSE", OUT / "LICENSE")
    shutil.copy2(ROOT / "Animacje2.0" / "pack.png", OUT / "pack.png")

    vsh_imports: list[str] = []
    fsh_imports: list[str] = []
    dispatch: list[str] = []
    catalog: list[dict[str, object]] = []

    for effect_id, (name, family, description) in enumerate(EFFECTS, 1):
        if name in NEW_COLORS:
            color = NEW_COLORS[name]
            if name in NEW_VSH:
                vsh = NEW_VSH[name].replace("tfxIDg = 47.0", f"tfxIDg = {effect_id}.0").replace("tfxIDg = 48.0", f"tfxIDg = {effect_id}.0").replace("tfxIDg = 49.0", f"tfxIDg = {effect_id}.0").replace("tfxIDg = 50.0", f"tfxIDg = {effect_id}.0")
            else:
                vsh = generated_vsh(name, effect_id, color)
            fsh = NEW_FSH[name] if name in NEW_FSH else generated_fsh(name)
        else:
            if name not in old:
                raise RuntimeError(f"Brak starego efektu: {name}")
            color = str(old[name]["hex"]).replace("#", "").upper()
            vsh = transform_vsh((SOURCE / "include" / f"tfx_{name}.vsh").read_text(encoding="utf-8"), effect_id, color)
            fsh = (SOURCE / "include" / f"tfx_{name}.fsh").read_text(encoding="utf-8")
        write(include / f"tfx_{name}.vsh", vsh)
        write(include / f"tfx_{name}.fsh", fsh)
        vsh_imports.append(f"    #moj_import <tfx_{name}.vsh>")
        fsh_imports.append(f"    #moj_import <tfx_{name}.fsh>")
        dispatch.append(f"    {'if' if effect_id == 1 else 'else if'} (tfx == {effect_id}) {{\n        color = {function_name(fsh)}(uv, texColor, tfxColor);\n    }}")
        catalog.append({
            "id": effect_id,
            "nazwa": name,
            "hex": "#" + color,
            "rodzina": family,
            "opis": description,
            "nowosc": name in NEW_COLORS,
        })

    custom_detector = (
        "    int tfxCustomR = c.r;\n"
        "    int tfxCustomG = c.g;\n"
        "    int tfxCustomB = c.b;\n"
        "    int customId = ((tfxCustomG & 7) << 4) | (tfxCustomB & 7);\n"
        "    if ((tfxCustomR & 15) == 10 && (tfxCustomG & 8) != 0 && (tfxCustomB & 8) != 0 && customId > 0 && customId <= 85) {\n"
        "        tfxIDg = float(customId);\n"
        "        tfxBaseg = vec4(vec3(float(tfxCustomR >> 4), float(tfxCustomG >> 4), float(tfxCustomB >> 4)) / 15.0, 1.0);\n"
        "        tfxTintg = tfxBaseg.rgb;\n"
        "        tfxCustomg = 1.0;\n"
        "    }\n"
    )
    common_vsh = """// Animacje 3.1 — dispatcher 85 efektów, płynny target 60 FPS.\nfloat tfxIDg = 0.0;\nvec4 tfxBaseg = vec4(1.0);\nvec2 tfxOffg = vec2(0.0);\nfloat tfxAlphag = 1.0;\nvec3 tfxTintg = vec3(-1.0);\nfloat tfxCustomg = 0.0;\n\nfloat tfxHash(vec2 p) {\n    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);\n}\n\nvec3 tfxHsv(float h, float s, float v) {\n    vec3 k = abs(fract(vec3(h) + vec3(0.0, 2.0 / 3.0, 1.0 / 3.0)) * 6.0 - 3.0);\n    return v * mix(vec3(1.0), clamp(k - 1.0, 0.0, 1.0), s);\n}\n\n#define TFX_SPD 1.0\n#define TFX_AMP 1.0\n\nvoid tfxDetect(ivec3 c, float g) {\n    tfxIDg = 0.0;\n    tfxBaseg = vec4(1.0);\n    tfxOffg = vec2(0.0);\n    tfxAlphag = 1.0;\n    tfxTintg = vec3(-1.0);\n    tfxCustomg = 0.0;\n\n""" + "\n".join(vsh_imports) + "\n" + custom_detector + "}\n"
    common_fsh = """// Animacje 3.0 — wspólny dispatcher FSH; nie importuje usuniętych efektów.\nfloat tfxHashF(vec2 p) {\n    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);\n}\n\nvec3 tfxHsv(float h, float s, float v) {\n    vec3 k = abs(fract(vec3(h) + vec3(0.0, 2.0 / 3.0, 1.0 / 3.0)) * 6.0 - 3.0);\n    return v * mix(vec3(1.0), clamp(k - 1.0, 0.0, 1.0), s);\n}\n\n#define TFX_FPS 60.0\n#define TFX_SPD 1.0\n#define TFX_INT 1.0\n\n""" + "\n".join(fsh_imports) + "\n"
    write(include / "tfx_common.vsh", common_vsh)
    write(include / "tfx_common.fsh", common_fsh)

    custom_tint = "\n    if (tfxCustom > 0.5) {\n        float brightness = max(dot(color.rgb, vec3(0.30, 0.59, 0.11)), 0.18);\n        color.rgb = clamp(tfxColor.rgb * (0.45 + brightness * 0.95), 0.0, 1.0);\n    }\n"
    core_fsh = fsh_prefix + "\n\nvoid main() {\n    vec2 uv = texCoord0;\n    vec4 texColor = texture(Sampler0, uv);\n    vec4 color = texColor * vertexColor * ColorModulator;\n\n    int tfx = int(tfxID + 0.5);\n" + "\n".join(dispatch) + custom_tint + "\n    if (color.a < 0.1) {\n        discard;\n    }\n\n    fragColor = apply_fog(color, sphericalVertexDistance, cylindricalVertexDistance, FogEnvironmentalStart, FogEnvironmentalEnd, FogRenderDistanceStart, FogRenderDistanceEnd, FogColor);\n}\n"
    write(core / "rendertype_text.fsh", core_fsh)

    pack_mcmeta = {
        "pack": {
            "name": "Animacje 3.1 — Top 85",
            "description": "§dAnimacje 3.1 §7— 85 animacji tekstu, w tym 25 premium i 10 hakerskich",
            "pack_format": 63,
            "supported_formats": {"min_inclusive": 42, "max_inclusive": 110},
            "min_format": 42,
            "max_format": 110,
        }
    }
    write(OUT / "pack.mcmeta", json.dumps(pack_mcmeta, ensure_ascii=False, indent=2) + "\n")
    write(OUT / "effects.json", json.dumps(catalog, ensure_ascii=False, indent=2) + "\n")
    write(OUT / "konwerter.py", converter_text())
    write(OUT / "README.md", readme_text(catalog))

    # Katalog pluginu jest generowany z tego samego źródła, więc pack i plugin
    # nie mogą się rozjechać po zmianie listy.
    OLD_CATALOG.parent.mkdir(parents=True, exist_ok=True)
    OLD_CATALOG.write_text(json.dumps(catalog, ensure_ascii=False, separators=(",", ":")) + "\n", encoding="utf-8")

    subprocess.run(["zip", "-qr", str(ZIP), ".", "-x", "*__pycache__*", "*.pyc"], cwd=OUT, check=True)
    return catalog


def converter_text() -> str:
    return r'''#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Animacje 3.0 — <animacja:nazwa>tekst</animacja> -> /tellraw."""
import argparse
import json
import re
from pathlib import Path

CATALOG = {row["nazwa"]: row for row in json.loads((Path(__file__).parent / "effects.json").read_text(encoding="utf-8"))}
TAG = re.compile(r"<animacja:([a-z0-9_]+)>(.*?)</animacja>", re.IGNORECASE | re.DOTALL)


def translate(text):
    return text.replace("\\", "\\\\").replace('"', '\\"').replace("\n", " ")


def components(text):
    out = []
    pos = 0
    for match in TAG.finditer(text):
        if match.start() > pos:
            out.append({"text": text[pos:match.start()]})
        name = match.group(1).lower()
        if name not in CATALOG:
            raise SystemExit(f"Nieznany efekt: {name}. Użyj --lista.")
        row = CATALOG[name]
        out.append({"text": match.group(2), "color": row["hex"]})
        pos = match.end()
    if pos < len(text):
        out.append({"text": text[pos:]})
    return out or [{"text": ""}]


def build(text):
    # JSON komponentów jest poprawny zarówno dla /tellraw w 1.21.4-,
    # jak i dla parsera SNBT w nowszych wersjach.
    return "/tellraw @a " + json.dumps(components(text), ensure_ascii=False, separators=(",", ":"))


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("text", nargs="?", help="tekst z tagami animacja")
    parser.add_argument("--lista", action="store_true", help="lista 85 efektów")
    args = parser.parse_args()
    if args.lista:
        for row in CATALOG.values():
            print(f"{row['nazwa']:<18} {row['hex']}  — {row['opis']}")
        return
    if args.text is None:
        parser.error("podaj tekst albo użyj --lista")
    print(build(args.text))

if __name__ == "__main__":
    main()
'''


def readme_text(catalog: list[dict[str, object]]) -> str:
    lines = [
        "# Animacje Resourcepack 3.1 — Top 85",
        "",
        "Lekki resourcepack do animowania tekstu w Minecraft Java Edition. Wersja 3.1 zawiera",
        "**dokładnie 85** efektów: bazowe animacje, 25 nowych efektów premium i 10 efektów",
        "hakerskich. Shader działa płynnie per klatka renderowania; przy 60 FPS animacje są",
        "renderowane bez klatkowania. Efekty hakerskie wymagają permissionu pluginu.",
        "",
        "## Instalacja",
        "",
        "1. Włącz `Animacje3.0.zip` jako jedyny pack tekstowych shaderów.",
        "2. Pack musi być aktywny u osoby, która ma widzieć animację (serwer może go wysłać graczom).",
        "3. Nie włączaj równocześnie Animacje1.0/2.0 — wszystkie nadpisują renderer tekstu.",
        "4. Plugin `AnimacjeHub` v2 korzysta z tego samego katalogu 85 efektów.",
        "",
        "## Szybki przykład",
        "",
        "```text",
        "python3 konwerter.py '<animacja:rainbow>Witaj!</animacja>'",
        "python3 konwerter.py --lista",
        "```",
        "",
        "Kolor spustowy jest niewidoczny po uruchomieniu shaderów: shader rozpoznaje go",
        "i zamienia w żywą animację. Tekst pozostaje zwykłym komponentem Minecrafta, więc",
        "działa w czacie, tytułach, nazwach itemów, hologramach i GUI.",
        "",
        "## Lista efektów",
        "",
        "| # | Efekt | Rodzina | Opis |",
        "|---:|---|---|---|",
    ]
    for row in catalog:
        marker = " **NOWE**" if row.get("nowosc") else ""
        lines.append(f"| {row['id']} | `{row['nazwa']}`{marker} | {row['rodzina']} | {row['opis']} |")
    lines += [
        "",
        "## Technicznie",
        "",
        "- Wspólny shader importuje wyłącznie 85 par `tfx_<nazwa>.vsh`/`.fsh`.",
        "- Każdy efekt ma własny kolor spustowy i dispatcher ID 1–85.",
        "- Tryb custom koduje kolor #RGB/#RRGGBB w zarezerwowanym triggerze, więc działa z każdym FX.",
        "- Pack bazuje na shader API Minecrafta 1.21.6+ i deklaruje obsługę formatów 42–110.",
        "- `effects.json` jest źródłem prawdy dla konwertera i katalogu pluginu.",
        "",
        "W razie problemów sprawdź log klienta po włączeniu packa. Na serwerze włącz tylko jedną",
        "wersję packa, ponieważ shadery tekstu nie mogą być aktywne z dwóch packów naraz.",
        "",
    ]
    return "\n".join(lines)


if __name__ == "__main__":
    result = build()
    print(f"Animacje3.0: {len(result)} efektów; zapisano {ZIP.name}")
