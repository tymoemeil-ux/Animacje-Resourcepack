import json
import re
import sys


EFFECTS = {
    "animacja:blysk": "#A0A000",
    "animacja:neonfala": "#A0A004",
    "animacja:tecafala": "#A0A008",
    "animacja:kaskada": "#A0A00C",
    "animacja:laser2": "#A0A010",
    "animacja:grzmot": "#A0A014",
    "animacja:obrys": "#A0A018",
    "animacja:neon": "#A0A01C",
    "animacja:neon_puls": "#A0A020",
    "animacja:zloty_blask": "#A0A024",
    "animacja:galaktyka": "#A0A028",
    "animacja:krew": "#A0A02C",
    "animacja:piorun": "#A0A030",
    "animacja:wave": "#A0A034",
    "animacja:wave_big": "#A0A038",
    "animacja:rainbow": "#A0A03C",
    "animacja:glitch_hard": "#A0A040",
    "animacja:tsunami": "#A0A044",
    "animacja:karuzela": "#A0A048",
    "animacja:tornado": "#A0A04C",
    "animacja:bumper": "#A0A050",
    "animacja:pulse": "#A0A054",
    "animacja:heartbeat": "#A0A058",
    "animacja:flicker": "#A0A05C",
    "animacja:shake": "#A0A060"
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
