#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Buduje Animacje 3.0: mały, kuratorowany pack z dokładnie 50 efektami.

Efekty bazowe są wybrane z Animacje2.0, a cztery nowe efekty są napisane
specjalnie dla 3.0. Skrypt nie kopiuje całego starego dispatchera: generuje
wspólny shader i importuje wyłącznie wybrane pary VSH/FSH.
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
]

NEW_COLORS = {
    "kometa": "B0C001",
    "iskry": "B0C002",
    "pryzmat": "B0C003",
    "szklo": "B0C004",
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
    if len(EFFECTS) != 50 or len({name for name, _, _ in EFFECTS}) != 50:
        raise RuntimeError("Lista Animacje 3.0 musi zawierać dokładnie 50 unikalnych efektów")

    old = load_old_catalog()
    include = OUT / "assets" / "minecraft" / "shaders" / "include"
    core = OUT / "assets" / "minecraft" / "shaders" / "core"
    if OUT.exists():
        shutil.rmtree(OUT)
    if ZIP.exists():
        ZIP.unlink()
    include.mkdir(parents=True)
    core.mkdir(parents=True)

    shutil.copy2(SOURCE / "core" / "rendertype_text.vsh", core / "rendertype_text.vsh")
    old_fsh = (SOURCE / "core" / "rendertype_text.fsh").read_text(encoding="utf-8")
    fsh_prefix = old_fsh.split("void main()", 1)[0].rstrip()
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
            vsh = NEW_VSH[name].replace("tfxIDg = 47.0", f"tfxIDg = {effect_id}.0").replace("tfxIDg = 48.0", f"tfxIDg = {effect_id}.0").replace("tfxIDg = 49.0", f"tfxIDg = {effect_id}.0").replace("tfxIDg = 50.0", f"tfxIDg = {effect_id}.0")
            fsh = NEW_FSH[name]
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

    common_vsh = """// Animacje 3.0 — wspólny dispatcher VSH; tylko 50 wybranych efektów.\nfloat tfxIDg = 0.0;\nvec4 tfxBaseg = vec4(1.0);\nvec2 tfxOffg = vec2(0.0);\nfloat tfxAlphag = 1.0;\nvec3 tfxTintg = vec3(-1.0);\n\nfloat tfxHash(vec2 p) {\n    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);\n}\n\nvec3 tfxHsv(float h, float s, float v) {\n    vec3 k = abs(fract(vec3(h) + vec3(0.0, 2.0 / 3.0, 1.0 / 3.0)) * 6.0 - 3.0);\n    return v * mix(vec3(1.0), clamp(k - 1.0, 0.0, 1.0), s);\n}\n\n#define TFX_SPD 1.0\n#define TFX_AMP 1.0\n\nvoid tfxDetect(ivec3 c, float g) {\n    tfxIDg = 0.0;\n    tfxBaseg = vec4(1.0);\n    tfxOffg = vec2(0.0);\n    tfxAlphag = 1.0;\n    tfxTintg = vec3(-1.0);\n\n""" + "\n".join(vsh_imports) + "\n}\n"
    common_fsh = """// Animacje 3.0 — wspólny dispatcher FSH; nie importuje usuniętych efektów.\nfloat tfxHashF(vec2 p) {\n    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);\n}\n\nvec3 tfxHsv(float h, float s, float v) {\n    vec3 k = abs(fract(vec3(h) + vec3(0.0, 2.0 / 3.0, 1.0 / 3.0)) * 6.0 - 3.0);\n    return v * mix(vec3(1.0), clamp(k - 1.0, 0.0, 1.0), s);\n}\n\n#define TFX_SPD 1.0\n#define TFX_INT 1.0\n\n""" + "\n".join(fsh_imports) + "\n"
    write(include / "tfx_common.vsh", common_vsh)
    write(include / "tfx_common.fsh", common_fsh)

    core_fsh = fsh_prefix + "\n\nvoid main() {\n    vec2 uv = texCoord0;\n    vec4 texColor = texture(Sampler0, uv);\n    vec4 color = texColor * vertexColor * ColorModulator;\n\n    int tfx = int(tfxID + 0.5);\n" + "\n".join(dispatch) + "\n\n    if (color.a < 0.1) {\n        discard;\n    }\n\n    fragColor = apply_fog(color, sphericalVertexDistance, cylindricalVertexDistance, FogEnvironmentalStart, FogEnvironmentalEnd, FogRenderDistanceStart, FogRenderDistanceEnd, FogColor);\n}\n"
    write(core / "rendertype_text.fsh", core_fsh)

    pack_mcmeta = {
        "pack": {
            "name": "Animacje 3.0 — Top 50",
            "description": "§dAnimacje 3.0 §7— 50 starannie wybranych animacji tekstu + 4 nowe efekty",
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
    parser.add_argument("--lista", action="store_true", help="lista 50 efektów")
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
        "# Animacje Resourcepack 3.0 — Top 50",
        "",
        "Lekki resourcepack do animowania tekstu w Minecraft Java Edition. Wersja 3.0 została",
        "odchudzona do **dokładnie 50** najbardziej efektownych animacji. Zostawiono różne style:",
        "neon, ogień i lód, kosmos, cyber, ruch oraz efekty imprezowe. Cztery efekty oznaczone",
        "`NOWE` powstały specjalnie w tej wersji.",
        "",
        "## Instalacja",
        "",
        "1. Włącz `Animacje3.0.zip` jako jedyny pack tekstowych shaderów.",
        "2. Pack musi być aktywny u osoby, która ma widzieć animację (serwer może go wysłać graczom).",
        "3. Nie włączaj równocześnie Animacje1.0/2.0 — wszystkie nadpisują renderer tekstu.",
        "4. Plugin `AnimacjeHub` v2 korzysta z tego samego katalogu 50 efektów.",
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
        "- Wspólny shader importuje wyłącznie 50 par `tfx_<nazwa>.vsh`/`.fsh`.",
        "- Każdy efekt ma własny kolor spustowy i dispatcher ID 1–50.",
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
