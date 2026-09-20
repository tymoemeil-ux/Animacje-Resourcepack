#!/usr/bin/env python3
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
