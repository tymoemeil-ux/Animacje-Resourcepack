import json
import re
import sys


EFFECTS = {
    "animacja:wave": "#F8F800",
    "animacja:wave_big": "#F8F804",
    "animacja:wave_fast": "#F8F80C",
    "animacja:shake": "#F8F814",
    "animacja:shake_fast": "#F8F818",
    "animacja:shake_mega": "#F8F81C",
    "animacja:rainbow": "#F8F824",
    "animacja:bouncy": "#F8F82C",
    "animacja:pulse": "#F8F83C",
    "animacja:heartbeat": "#F8F844",
    "animacja:spin": "#F8F848",
    "animacja:flip": "#F8F850",
    "animacja:fade": "#F8F858",
    "animacja:breathe": "#F8F85C",
    "animacja:flicker": "#F8F860",
    "animacja:jump": "#F8F864",
    "animacja:glitch": "#F8F868",
    "animacja:float": "#F8F884",
    "animacja:zigzag": "#F8F88C",
    "animacja:fall": "#F8F894",
    "animacja:rise": "#F8F898",
    "animacja:orbit": "#F8F89C",
    "animacja:type": "#F8F8A4",
    "animacja:erase": "#F8F8A8",
    "animacja:gradient_anim": "#F8F8B4",
    "animacja:lava": "#F8F8B8",
    "animacja:aurora": "#F8F8BC",
    "animacja:fire": "#F8F8C0",
    "animacja:ice": "#F8F8C4",
    "animacja:gold": "#F8F8C8",
    "animacja:split": "#F8F8CC",
    "animacja:hatch": "#F8F8D4",
    "animacja:neon": "#F8F8D8",
    "animacja:neon_pink": "#F8F8DC",
    "animacja:chroma": "#F8F8E0",
    "animacja:extrude": "#F8F8E4",
    "animacja:extrude_deep": "#F8F8E8",
    "animacja:noise": "#F8F8EC",
    "animacja:liquid": "#F8F8F0",
    "animacja:water": "#F8F8F4",
    "animacja:mega": "#F0F090",
    "animacja:blask": "#E8E800",
    "animacja:iskry": "#E8E80C",
    "animacja:plomien": "#E8E818",
    "animacja:popcorn": "#E8E824",
    "animacja:eksplozja": "#E8E828",
    "animacja:winda": "#E8E82C",
    "animacja:deszcz": "#E8E830",
    "animacja:mrugacz": "#E8E834",
    "animacja:skoczki": "#E8E838",
    "animacja:mega_blask": "#E8E83C",
    "animacja:laser": "#E0E004",
    "animacja:holo": "#E0E008",
    "animacja:glitch_hard": "#E0E00C",
    "animacja:matrix": "#E0E010",
    "animacja:caustics": "#E0E014",
    "animacja:warp": "#E0E018",
    "animacja:krysztal": "#E0E01C",
    "animacja:portal": "#E0E020",
    "animacja:xray": "#E0E024",
    "animacja:termowizja": "#E0E028",
    "animacja:tornado": "#E0E02C",
    "animacja:wahadlo": "#E0E030",
    "animacja:wibracja": "#E0E034",
    "animacja:przegon": "#E0E038",
    "animacja:bumper": "#E0E03C",
    "animacja:harmonijka": "#E0E040",
    "animacja:mega_2": "#E0E08C",
    "animacja:mega_cyber": "#E0E090",
    "animacja:neon_puls": "#D8D800",
    "animacja:szklo": "#D8D804",
    "animacja:zloty_blask": "#D8D808",
    "animacja:diamet": "#D8D80C",
    "animacja:krew": "#D8D810",
    "animacja:pianka": "#D8D814",
    "animacja:dym": "#D8D818",
    "animacja:piorun": "#D8D81C",
    "animacja:radioaktywny": "#D8D820",
    "animacja:pulsar": "#D8D824",
    "animacja:galaktyka": "#D8D828",
    "animacja:tron": "#D8D82C",
    "animacja:prizma": "#D8D830",
    "animacja:cukierek": "#D8D834",
    "animacja:ocean": "#D8D838",
    "animacja:czarna_dziura": "#D8D83C",
    "animacja:mrozy": "#D8D840",
    "animacja:magma": "#D8D844",
    "animacja:plasma": "#D8D848",
    "animacja:aureola": "#D8D84C",
    "animacja:karuzela": "#D8D850",
    "animacja:spirala": "#D8D854",
    "animacja:pociag": "#D8D858",
    "animacja:burza": "#D8D85C",
    "animacja:titan": "#D8D860",
    "animacja:metronom": "#D8D864",
    "animacja:fala_3d": "#D8D868",
    "animacja:piorka": "#D8D86C",
    "animacja:blysk": "#D0D000",
    "animacja:smuga": "#D0D004",
    "animacja:iskrenice": "#D0D008",
    "animacja:tecafala": "#D0D00C",
    "animacja:serce": "#D0D010",
    "animacja:kula": "#D0D014",
    "animacja:luk": "#D0D018",
    "animacja:mglawica": "#D0D01C",
    "animacja:snieg": "#D0D020",
    "animacja:refleks": "#D0D024",
    "animacja:kaskada": "#D0D028",
    "animacja:neonfala": "#D0D02C",
    "animacja:perla": "#D0D030",
    "animacja:zar": "#D0D034",
    "animacja:firerain": "#D0D038",
    "animacja:kolumna": "#D0D03C",
    "animacja:laser2": "#D0D040",
    "animacja:odlamki": "#D0D044",
    "animacja:grzmot": "#D0D048",
    "animacja:swiatlo": "#D0D04C",
    "animacja:obrys": "#D0D050",
    "animacja:gwiazdy": "#D0D054",
    "animacja:elastyk": "#D0D058",
    "animacja:zel": "#D0D05C",
    "animacja:skok": "#D0D060",
    "animacja:fala2": "#D0D064",
    "animacja:orbit2": "#D0D068",
    "animacja:grzmot_w": "#D0D06C",
    "animacja:tsunami": "#D0D070",
    "animacja:ekspres": "#D0D074",
    "animacja:tectno": "#D0D078",
    "animacja:blysk_wavy": "#D0D07C",
    "animacja:blysk_shake": "#D0D080",
    "animacja:smuga_wavy": "#D0D084",
    "animacja:serce_heartbeat": "#D0D088",
    "animacja:luk_shake": "#D0D08C",
    "animacja:snieg_float": "#D0D090",
    "animacja:mglawica_spin": "#D0D094",
    "animacja:kaskada_wavy": "#D0D098",
    "animacja:neonfala_bouncy": "#D0D09C",
    "animacja:zar_shake": "#D0D0A0",
    "animacja:kula_spin": "#D0D0A4",
    "animacja:mega_blysk": "#D0D0A8"
}


TAG_RE = re.compile(r"<animacja:(\w+)>(.*?)</animacja>")


def build_parts(text):
    parts = []
    last = 0
    for m in TAG_RE.finditer(text):
        if m.start() > last:
            parts.append({"text": text[last:m.start()]})
        key = "animacja:" + m.group(1)
        if key in EFFECTS and m.group(2):
            parts.append({"text": m.group(2), "color": EFFECTS[key]})
        else:
            parts.append({"text": m.group(0)})
        last = m.end()
    if last < len(text):
        parts.append({"text": text[last:]})
    return parts


def convert(text):
    parts = build_parts(text)
    if not parts:
        return "/tellraw @a " + json.dumps({"text": ""}, ensure_ascii=False)
    if len(parts) == 1:
        return "/tellraw @a " + json.dumps(parts[0], ensure_ascii=False)
    return "/tellraw @a " + json.dumps({"text": "", "extra": parts}, ensure_ascii=False)


def main():
    if len(sys.argv) > 1:
        text = " ".join(sys.argv[1:])
    else:
        text = sys.stdin.read()
    print(convert(text))


if __name__ == "__main__":
    main()
