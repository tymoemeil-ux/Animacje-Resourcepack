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
import json, os, re, sys

TAGS = {
    "aurora": "#A0A044",
    "bateria": "#A0A0A8",
    "bialy": "#FFFFFF",
    "blysk": "#A0A000",
    "brazowy": "#8B4513",
    "bumper": "#FF30A0",
    "chroma": "#A0A050",
    "cyjan": "#00FFFF",
    "czerwony": "#FF0000",
    "diament": "#A0A040",
    "dym": "#A0A070",
    "fala_fioletowa": "#A0A088",
    "fala_rozowa": "#A0A09C",
    "fala_zielona": "#A0A098",
    "fala_zlota": "#A0A08C",
    "fioletowy": "#CC00FF",
    "flicker": "#F0F0F0",
    "floaty": "#60A0FF",
    "galaktyka": "#A0A028",
    "glitch_hard": "#FF3050",
    "glow": "#A0A05C",
    "grzmot": "#A0A014",
    "gwiazdki": "#A0A0B4",
    "heartbeat": "#FF3030",
    "holo": "#A0A060",
    "hopwave": "#00FF90",
    "karmazyn": "#A0A0C4",
    "karuzela": "#FF9030",
    "karuzela_neon": "#A0A07C",
    "kaskada": "#A0A00C",
    "konfetti": "#A0A084",
    "krew": "#A0A02C",
    "laser2": "#A0A010",
    "lawina": "#A0A06C",
    "lod": "#A0A03C",
    "luna": "#A0A0A4",
    "magnes": "#A0A090",
    "morse": "#A0A054",
    "morska": "#A0A0C0",
    "neon": "#A0A01C",
    "neon_deszcz": "#A0A080",
    "neon_grad": "#A0A04C",
    "neon_laser": "#A0A0B8",
    "neon_oddech": "#A0A074",
    "neon_puls": "#A0A020",
    "neonfala": "#A0A004",
    "niebieski": "#0000FF",
    "obrys": "#A0A018",
    "ocean": "#A0A048",
    "ogien": "#A0A038",
    "orbita": "#C040FF",
    "piorun": "#A0A030",
    "plazma": "#A0A034",
    "pomaranczowy": "#FF9900",
    "prad": "#A0A0A0",
    "pulse": "#FFFF30",
    "radar": "#A0A058",
    "rainbow": "#FF40FF",
    "ripple": "#00E0C0",
    "rozowy": "#FF66CC",
    "shake": "#FFA030",
    "skok": "#FF7000",
    "spin": "#FF80C0",
    "spryna": "#FF5070",
    "static_tv": "#A0A064",
    "sway": "#80FF80",
    "szarp": "#00B0B0",
    "szary": "#999999",
    "sznurek": "#A0A094",
    "tancuj": "#A0A068",
    "tarcza": "#A0A0B0",
    "tecafala": "#A0A008",
    "tornado": "#90FF30",
    "tremor": "#A04000",
    "tsunami": "#4080FF",
    "wave": "#40E0FF",
    "wave_big": "#20B0FF",
    "winda": "#A0A078",
    "wizja": "#A0A0C8",
    "wobble": "#E0C040",
    "wstecz": "#A0A0BC",
    "wyskok": "#A0A0AC",
    "zielony": "#00FF00",
    "zigzag": "#B0B000",
    "zloty_blask": "#A0A024",
    "zolty": "#FFFF00",
    'bungee': '#80C018',
    'bungee_lawenda': '#80D008',
    'bungee_neon_cyjan': '#80C0B8',
    'deszcz_ziemi': '#A0A0E0',
    'deszcz_ziemi_neony_tokio': '#80C0D0',
    'deszcz_ziemi_rubin': '#80C080',
    'drgania_muzyczne': '#A0A0F8',
    'drgania_muzyczne_pixel_8bit': '#80C098',
    'drgania_muzyczne_tusza_neon': '#80C0E8',
    'fala_od_srodka': '#80C014',
    'fala_od_srodka_miedz': '#80D004',
    'fala_od_srodka_neon_fiolet': '#80C0B4',
    'fala_wodna': '#A0A0EC',
    'fala_wodna_perla': '#80C08C',
    'fala_wodna_tlen': '#80C0DC',
    'falowanie_gora': '#80C004',
    'falowanie_gora_galaktyczny': '#80C0A4',
    'falowanie_gora_neon_fiolet': '#80C0F4',
    'falstart': '#A0A0D8',
    'falstart_lawenda': '#80C078',
    'falstart_topaz': '#80C0C8',
    'galaktyczny': '#80C05C',
    'helikopter': '#A0A0CC',
    'helikopter_szmaragd': '#80C0BC',
    'helikopter_zloto': '#80C06C',
    'lawenda': '#80C030',
    'losowe_skoki': '#A0A0E8',
    'losowe_skoki_pixel_8bit': '#80C0D8',
    'losowe_skoki_topaz': '#80C088',
    'metronom': '#A0A0F4',
    'metronom_galaktyczny': '#80C0E4',
    'metronom_retro': '#80C094',
    'miedz': '#80C02C',
    'neon_amber': '#80C058',
    'neon_cyjan': '#80C020',
    'neon_fiolet': '#80C01C',
    'neony_tokio': '#80C048',
    'olo': '#80C064',
    'perla': '#80C044',
    'pixel_8bit': '#80C050',
    'platyna': '#80C028',
    'puls_zer': '#A0A0FC',
    'puls_zer_olo': '#80C0EC',
    'puls_zer_tlen': '#80C09C',
    'retro': '#80C04C',
    'rose_gold': '#80C068',
    'rubin': '#80C038',
    'spirala': '#A0A0D0',
    'spirala_platyna': '#80C070',
    'spirala_rubin': '#80C0C0',
    'szafir': '#80C03C',
    'szarpacze_fale': '#80C008',
    'szarpacze_fale_neon_cyjan': '#80C0F8',
    'szarpacze_fale_tusza_neon': '#80C0A8',
    'szmaragd': '#80C034',
    'tlen': '#80C054',
    'topaz': '#80C040',
    'trzesienie_pionowe': '#80C010',
    'trzesienie_pionowe_platyna': '#80D000',
    'trzesienie_pionowe_rose_gold': '#80C0B0',
    'tusza_neon': '#80C060',
    'unoszenie_fale': '#80C00C',
    'unoszenie_fale_olo': '#80C0AC',
    'unoszenie_fale_zloto': '#80C0FC',
    'wachlarz': '#A0A0DC',
    'wachlarz_perla': '#80C0CC',
    'wachlarz_szmaragd': '#80C07C',
    'wibrowanie': '#A0A0D4',
    'wibrowanie_miedz': '#80C074',
    'wibrowanie_szafir': '#80C0C4',
    'wielkie_kolo': '#80C000',
    'wielkie_kolo_neon_amber': '#80C0A0',
    'wielkie_kolo_rose_gold': '#80C0F0',
    'wznoszenie': '#A0A0E4',
    'wznoszenie_retro': '#80C0D4',
    'wznoszenie_szafir': '#80C084',
    'zloto': '#80C024',
    'zygzak_v2': '#A0A0F0',
    'zygzak_v2_neon_amber': '#80C0E0',
    'zygzak_v2_neony_tokio': '#80C090',
    'kotwica': '#60B000',
    'piorko': '#60B004',
    'strzala': '#60B008',
    'most': '#60B00C',
    'zegar': '#60B010',
    'skakosz': '#60B014',
    'fala_kot': '#60B018',
    'przepylacz': '#60B01C',
    'wielblik': '#60B020',
    'deszczyk': '#60B024',
    'ptaszek': '#60B028',
    'rakieta': '#60B02C',
    'wahadlo': '#60B030',
    'plyn': '#60B034',
    'bumerang': '#60B038',
    'srebro': '#60C000',
    'krystal': '#60C004',
    'polarna': '#60C008',
    'magma': '#60C00C',
    'mroz': '#60C010',
    'pryzmat': '#60C014',
    'szampan': '#60C018',
    'grafit': '#60C01C',
    'mosiadz': '#60C020',
    'karmel': '#60C024',
    'wisnia': '#60C028',
    'trawa': '#60C02C',
    'niebo': '#60C030',
    'wschod': '#60C034',
    'zachod': '#60C038',
    'kotwica_srebro': '#60D000',
    'piorko_krystal': '#60D004',
    'strzala_polarna': '#60D008',
    'most_magma': '#60D00C',
    'zegar_mroz': '#60D010',
    'skakosz_pryzmat': '#60D014',
    'fala_kot_szampan': '#60D018',
    'przepylacz_grafit': '#60D01C',
    'wielblik_mosiadz': '#60D020',
    'deszczyk_karmel': '#60D024',
    'ptaszek_wisnia': '#60D028',
    'rakieta_trawa': '#60D02C',
    'wahadlo_niebo': '#60D030',
    'plyn_wschod': '#60D034',
    'bumerang_zachod': '#60D038',
    'kotwica_magma': '#60D03C',
    'most_krystal': '#60D040',
    'piorko_polarna': '#60D044',
    'skakosz_szampan': '#60D048',
    'wielblik_pryzmat': '#60D04C',
}

def _load_kolory():
    """kolory.json (w tym folderze) = PLIK Z HEXAMI do edycji.
    Zmiana hexa w kolory.json dziala od razu w konwerterze;
    do shaderow (w grze) zaaplikuje sie po: python3 generuj.py
    """
    p = os.path.join(os.path.dirname(os.path.abspath(__file__)), "kolory.json")
    if os.path.isfile(p):
        try:
            d = json.load(open(p, encoding="utf-8"))
            if isinstance(d, dict) and len(d) >= 200:
                return {k.lower(): v for k, v in d.items()}
        except Exception:
            pass
    return dict(TAGS)

TAGS = _load_kolory()

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
        print("205 animowanych (wszystkie = kolor + ruch):")
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
            ("wizja",75,"A0A0C8","hybryda"),
            ("helikopter",76,"A0A0CC","ruch"),
            ("spirala",77,"A0A0D0","ruch"),
            ("wibrowanie",78,"A0A0D4","ruch"),
            ("falstart",79,"A0A0D8","ruch"),
            ("wachlarz",80,"A0A0DC","ruch"),
            ("deszcz_ziemi",81,"A0A0E0","ruch"),
            ("wznoszenie",82,"A0A0E4","ruch"),
            ("losowe_skoki",83,"A0A0E8","ruch"),
            ("fala_wodna",84,"A0A0EC","ruch"),
            ("zygzak_v2",85,"A0A0F0","ruch"),
            ("metronom",86,"A0A0F4","ruch"),
            ("drgania_muzyczne",87,"A0A0F8","ruch"),
            ("puls_zer",88,"A0A0FC","ruch"),
            ("wielkie_kolo",89,"80C000","ruch"),
            ("falowanie_gora",90,"80C004","ruch"),
            ("szarpacze_fale",91,"80C008","ruch"),
            ("unoszenie_fale",92,"80C00C","ruch"),
            ("trzesienie_pionowe",93,"80C010","ruch"),
            ("fala_od_srodka",94,"80C014","ruch"),
            ("bungee",95,"80C018","ruch"),
            ("neon_fiolet",96,"80C01C","kolor"),
            ("neon_cyjan",97,"80C020","kolor"),
            ("zloto",98,"80C024","kolor"),
            ("platyna",99,"80C028","kolor"),
            ("miedz",100,"80C02C","kolor"),
            ("lawenda",101,"80C030","kolor"),
            ("szmaragd",102,"80C034","kolor"),
            ("rubin",103,"80C038","kolor"),
            ("szafir",104,"80C03C","kolor"),
            ("topaz",105,"80C040","kolor"),
            ("perla",106,"80C044","kolor"),
            ("neony_tokio",107,"80C048","kolor"),
            ("retro",108,"80C04C","kolor"),
            ("pixel_8bit",109,"80C050","kolor"),
            ("tlen",110,"80C054","kolor"),
            ("neon_amber",111,"80C058","kolor"),
            ("galaktyczny",112,"80C05C","kolor"),
            ("tusza_neon",113,"80C060","kolor"),
            ("olo",114,"80C064","kolor"),
            ("rose_gold",115,"80C068","kolor"),
            ("helikopter_zloto",116,"80C06C","polaczenie"),
            ("spirala_platyna",117,"80C070","polaczenie"),
            ("wibrowanie_miedz",118,"80C074","polaczenie"),
            ("falstart_lawenda",119,"80C078","polaczenie"),
            ("wachlarz_szmaragd",120,"80C07C","polaczenie"),
            ("deszcz_ziemi_rubin",121,"80C080","polaczenie"),
            ("wznoszenie_szafir",122,"80C084","polaczenie"),
            ("losowe_skoki_topaz",123,"80C088","polaczenie"),
            ("fala_wodna_perla",124,"80C08C","polaczenie"),
            ("zygzak_v2_neony_tokio",125,"80C090","polaczenie"),
            ("metronom_retro",126,"80C094","polaczenie"),
            ("drgania_muzyczne_pixel_8bit",127,"80C098","polaczenie"),
            ("puls_zer_tlen",128,"80C09C","polaczenie"),
            ("wielkie_kolo_neon_amber",129,"80C0A0","polaczenie"),
            ("falowanie_gora_galaktyczny",130,"80C0A4","polaczenie"),
            ("szarpacze_fale_tusza_neon",131,"80C0A8","polaczenie"),
            ("unoszenie_fale_olo",132,"80C0AC","polaczenie"),
            ("trzesienie_pionowe_rose_gold",133,"80C0B0","polaczenie"),
            ("fala_od_srodka_neon_fiolet",134,"80C0B4","polaczenie"),
            ("bungee_neon_cyjan",135,"80C0B8","polaczenie"),
            ("helikopter_szmaragd",136,"80C0BC","polaczenie"),
            ("spirala_rubin",137,"80C0C0","polaczenie"),
            ("wibrowanie_szafir",138,"80C0C4","polaczenie"),
            ("falstart_topaz",139,"80C0C8","polaczenie"),
            ("wachlarz_perla",140,"80C0CC","polaczenie"),
            ("deszcz_ziemi_neony_tokio",141,"80C0D0","polaczenie"),
            ("wznoszenie_retro",142,"80C0D4","polaczenie"),
            ("losowe_skoki_pixel_8bit",143,"80C0D8","polaczenie"),
            ("fala_wodna_tlen",144,"80C0DC","polaczenie"),
            ("zygzak_v2_neon_amber",145,"80C0E0","polaczenie"),
            ("metronom_galaktyczny",146,"80C0E4","polaczenie"),
            ("drgania_muzyczne_tusza_neon",147,"80C0E8","polaczenie"),
            ("puls_zer_olo",148,"80C0EC","polaczenie"),
            ("wielkie_kolo_rose_gold",149,"80C0F0","polaczenie"),
            ("falowanie_gora_neon_fiolet",150,"80C0F4","polaczenie"),
            ("szarpacze_fale_neon_cyjan",151,"80C0F8","polaczenie"),
            ("unoszenie_fale_zloto",152,"80C0FC","polaczenie"),
            ("trzesienie_pionowe_platyna",153,"80D000","polaczenie"),
            ("fala_od_srodka_miedz",154,"80D004","polaczenie"),
            ("bungee_lawenda",155,"80D008","polaczenie"),
            ("kotwica",156,"60B000","ruch"),("piorko",157,"60B004","ruch"),("strzala",158,"60B008","ruch"),
            ("most",159,"60B00C","ruch"),("zegar",160,"60B010","ruch"),("skakosz",161,"60B014","ruch"),
            ("fala_kot",162,"60B018","ruch"),("przepylacz",163,"60B01C","ruch"),("wielblik",164,"60B020","ruch"),
            ("deszczyk",165,"60B024","ruch"),("ptaszek",166,"60B028","ruch"),("rakieta",167,"60B02C","ruch"),
            ("wahadlo",168,"60B030","ruch"),("plyn",169,"60B034","ruch"),("bumerang",170,"60B038","ruch"),
            ("srebro",171,"60C000","kolor"),("krystal",172,"60C004","kolor"),("polarna",173,"60C008","kolor"),
            ("magma",174,"60C00C","kolor"),("mroz",175,"60C010","kolor"),("pryzmat",176,"60C014","kolor"),
            ("szampan",177,"60C018","kolor"),("grafit",178,"60C01C","kolor"),("mosiadz",179,"60C020","kolor"),
            ("karmel",180,"60C024","kolor"),("wisnia",181,"60C028","kolor"),("trawa",182,"60C02C","kolor"),
            ("niebo",183,"60C030","kolor"),("wschod",184,"60C034","kolor"),("zachod",185,"60C038","kolor"),
            ("kotwica_srebro",186,"60D000","polaczenie"),("piorko_krystal",187,"60D004","polaczenie"),
            ("strzala_polarna",188,"60D008","polaczenie"),("most_magma",189,"60D00C","polaczenie"),
            ("zegar_mroz",190,"60D010","polaczenie"),("skakosz_pryzmat",191,"60D014","polaczenie"),
            ("fala_kot_szampan",192,"60D018","polaczenie"),("przepylacz_grafit",193,"60D01C","polaczenie"),
            ("wielblik_mosiadz",194,"60D020","polaczenie"),("deszczyk_karmel",195,"60D024","polaczenie"),
            ("ptaszek_wisnia",196,"60D028","polaczenie"),("rakieta_trawa",197,"60D02C","polaczenie"),
            ("wahadlo_niebo",198,"60D030","polaczenie"),("plyn_wschod",199,"60D034","polaczenie"),
            ("bumerang_zachod",200,"60D038","polaczenie"),("kotwica_magma",201,"60D03C","polaczenie"),
            ("most_krystal",202,"60D040","polaczenie"),("piorko_polarna",203,"60D044","polaczenie"),
            ("skakosz_szampan",204,"60D048","polaczenie"),("wielblik_pryzmat",205,"60D04C","polaczenie"),
        ]:
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
