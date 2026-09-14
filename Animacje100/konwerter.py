import json
import re
import sys


EFFECTS = {
    "animacja:wave": "#F8F800",
    "animacja:wave_big": "#F8F804",
    "animacja:wave_slow": "#F8F808",
    "animacja:wave_fast": "#F8F80C",
    "animacja:wave_soft": "#F8F810",
    "animacja:shake": "#F8F814",
    "animacja:shake_fast": "#F8F818",
    "animacja:shake_mega": "#F8F81C",
    "animacja:tremor": "#F8F820",
    "animacja:rainbow": "#F8F824",
    "animacja:rainbow_fast": "#F8F828",
    "animacja:bouncy": "#F8F82C",
    "animacja:bouncy_high": "#F8F830",
    "animacja:blinking": "#F8F834",
    "animacja:blink_slow": "#F8F838",
    "animacja:pulse": "#F8F83C",
    "animacja:pulse_big": "#F8F840",
    "animacja:heartbeat": "#F8F844",
    "animacja:spin": "#F8F848",
    "animacja:spin_slow": "#F8F84C",
    "animacja:flip": "#F8F850",
    "animacja:flip_fast": "#F8F854",
    "animacja:fade": "#F8F858",
    "animacja:breathe": "#F8F85C",
    "animacja:flicker": "#F8F860",
    "animacja:jump": "#F8F864",
    "animacja:glitch": "#F8F868",
    "animacja:glitch_soft": "#F8F86C",
    "animacja:big": "#F8F870",
    "animacja:huge": "#F8F874",
    "animacja:small": "#F8F878",
    "animacja:up": "#F8F87C",
    "animacja:down": "#F8F880",
    "animacja:float": "#F8F884",
    "animacja:sway": "#F8F888",
    "animacja:zigzag": "#F8F88C",
    "animacja:wobble": "#F8F890",
    "animacja:fall": "#F8F894",
    "animacja:rise": "#F8F898",
    "animacja:orbit": "#F8F89C",
    "animacja:drift": "#F8F8A0",
    "animacja:type": "#F8F8A4",
    "animacja:erase": "#F8F8A8",
    "animacja:gradient_gd": "#F8F8AC",
    "animacja:gradient_rb": "#F8F8B0",
    "animacja:gradient_anim": "#F8F8B4",
    "animacja:lava": "#F8F8B8",
    "animacja:aurora": "#F8F8BC",
    "animacja:fire": "#F8F8C0",
    "animacja:ice": "#F8F8C4",
    "animacja:gold": "#F8F8C8",
    "animacja:split": "#F8F8CC",
    "animacja:outline": "#F8F8D0",
    "animacja:hatch": "#F8F8D4",
    "animacja:neon": "#F8F8D8",
    "animacja:neon_pink": "#F8F8DC",
    "animacja:chroma": "#F8F8E0",
    "animacja:extrude": "#F8F8E4",
    "animacja:extrude_deep": "#F8F8E8",
    "animacja:noise": "#F8F8EC",
    "animacja:liquid": "#F8F8F0",
    "animacja:water": "#F8F8F4",
    "animacja:water_tall": "#F8F8F8",
    "animacja:wave_rainbow": "#F0F000",
    "animacja:wave_neon": "#F0F004",
    "animacja:wave_aurora": "#F0F008",
    "animacja:wave_fire": "#F0F00C",
    "animacja:wave_ice": "#F0F010",
    "animacja:wave_gold": "#F0F014",
    "animacja:shake_rainbow": "#F0F018",
    "animacja:shake_neon": "#F0F01C",
    "animacja:shake_glitch": "#F0F020",
    "animacja:bouncy_rainbow": "#F0F024",
    "animacja:bouncy_neon": "#F0F028",
    "animacja:bouncy_fire": "#F0F02C",
    "animacja:pulse_rainbow": "#F0F030",
    "animacja:pulse_gold": "#F0F034",
    "animacja:heartbeat_neon": "#F0F038",
    "animacja:spin_rainbow": "#F0F03C",
    "animacja:spin_neon": "#F0F040",
    "animacja:flip_aurora": "#F0F044",
    "animacja:fade_rainbow": "#F0F048",
    "animacja:float_rainbow": "#F0F04C",
    "animacja:float_neon": "#F0F050",
    "animacja:sway_ice": "#F0F054",
    "animacja:zigzag_bouncy": "#F0F058",
    "animacja:wobble_rainbow": "#F0F05C",
    "animacja:orbit_rainbow": "#F0F060",
    "animacja:drift_ice": "#F0F064",
    "animacja:type_neon": "#F0F068",
    "animacja:erase_glitch": "#F0F06C",
    "animacja:glitch_chroma": "#F0F070",
    "animacja:lava_shake": "#F0F074",
    "animacja:lava_extrude": "#F0F078",
    "animacja:water_wave": "#F0F07C",
    "animacja:liquid_neon": "#F0F080",
    "animacja:noise_glitch": "#F0F084",
    "animacja:split_shake": "#F0F088",
    "animacja:outline_bouncy": "#F0F08C",
    "animacja:mega": "#F0F090",
    "animacja:blask": "#E8E800",
    "animacja:blask_wave": "#E8E804",
    "animacja:blask_shake": "#E8E808",
    "animacja:iskry": "#E8E80C",
    "animacja:iskry_float": "#E8E810",
    "animacja:iskry_bouncy": "#E8E814",
    "animacja:plomien": "#E8E818",
    "animacja:plomien_wave": "#E8E81C",
    "animacja:plomien_shake": "#E8E820",
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
    "animacja:laser_wavy": "#E0E044",
    "animacja:laser_shake": "#E0E048",
    "animacja:holo_float": "#E0E04C",
    "animacja:holo_shake": "#E0E050",
    "animacja:glitch_killer": "#E0E054",
    "animacja:matrix_shake": "#E0E058",
    "animacja:caustics_float": "#E0E05C",
    "animacja:warp_breathe": "#E0E060",
    "animacja:krysztal_pulse": "#E0E064",
    "animacja:portal_spin": "#E0E068",
    "animacja:xray_flicker": "#E0E06C",
    "animacja:thermo_wavy": "#E0E070",
    "animacja:tornado_rainbow": "#E0E074",
    "animacja:tornado_blask": "#E0E078",
    "animacja:wahadlo_gold": "#E0E07C",
    "animacja:przegon_neon": "#E0E080",
    "animacja:bumper_bouncy": "#E0E084",
    "animacja:harmonijka_glitch": "#E0E088",
    "animacja:mega_2": "#E0E08C",
    "animacja:mega_cyber": "#E0E090",
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
