// ============================================================
// Animacje 2.0 — silnik efektow (VSH) — nowy kod od zera
// Stan efektu: kazdy efekt (osobny plik) ustawia zmienne tfx*g
// ============================================================
float tfxIDg = 0.0;
vec4  tfxBaseg = vec4(1.0);
vec2  tfxOffg = vec2(0.0);
float tfxAlphag = 1.0;
vec3  tfxTintg = vec3(-1.0);

float tfxHash(vec2 p) {
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
}

vec3 tfxHsv(float h, float s, float v) {
    vec3 k = abs(fract(vec3(h) + vec3(0.0, 2.0 / 3.0, 1.0 / 3.0)) * 6.0 - 3.0);
    return v * mix(vec3(1.0), clamp(k - 1.0, 0.0, 1.0), s);
}

void tfxDetect(ivec3 c, float g) {
    tfxIDg = 0.0;
    tfxBaseg = vec4(1.0);
    tfxOffg = vec2(0.0);
    tfxAlphag = 1.0;
    tfxTintg = vec3(-1.0);

    #moj_import <tfx_blysk.vsh>
    #moj_import <tfx_neonfala.vsh>
    #moj_import <tfx_tecafala.vsh>
    #moj_import <tfx_kaskada.vsh>
    #moj_import <tfx_laser2.vsh>
    #moj_import <tfx_grzmot.vsh>
    #moj_import <tfx_obrys.vsh>
    #moj_import <tfx_neon.vsh>
    #moj_import <tfx_neon_puls.vsh>
    #moj_import <tfx_zloty_blask.vsh>
    #moj_import <tfx_galaktyka.vsh>
    #moj_import <tfx_krew.vsh>
    #moj_import <tfx_piorun.vsh>
    #moj_import <tfx_wave.vsh>
    #moj_import <tfx_wave_big.vsh>
    #moj_import <tfx_rainbow.vsh>
    #moj_import <tfx_glitch_hard.vsh>
    #moj_import <tfx_tsunami.vsh>
    #moj_import <tfx_karuzela.vsh>
    #moj_import <tfx_tornado.vsh>
    #moj_import <tfx_bumper.vsh>
    #moj_import <tfx_pulse.vsh>
    #moj_import <tfx_heartbeat.vsh>
    #moj_import <tfx_flicker.vsh>
    #moj_import <tfx_shake.vsh>
    #moj_import <tfx_plazma.vsh>
    #moj_import <tfx_ogien.vsh>
    #moj_import <tfx_lod.vsh>
    #moj_import <tfx_diament.vsh>
    #moj_import <tfx_aurora.vsh>
    #moj_import <tfx_ocean.vsh>
    #moj_import <tfx_neon_grad.vsh>
    #moj_import <tfx_chroma.vsh>
    #moj_import <tfx_morse.vsh>
    #moj_import <tfx_radar.vsh>
    #moj_import <tfx_glow.vsh>
    #moj_import <tfx_holo.vsh>
    #moj_import <tfx_static_tv.vsh>
    #moj_import <tfx_ripple.vsh>
    #moj_import <tfx_orbita.vsh>
    #moj_import <tfx_skok.vsh>
    #moj_import <tfx_sway.vsh>
    #moj_import <tfx_hopwave.vsh>
    #moj_import <tfx_wobble.vsh>
    #moj_import <tfx_spin.vsh>
    #moj_import <tfx_tremor.vsh>
    #moj_import <tfx_floaty.vsh>
    #moj_import <tfx_zigzag.vsh>
    #moj_import <tfx_spryna.vsh>
    #moj_import <tfx_szarp.vsh>
    #moj_import <tfx_tancuj.vsh>
    #moj_import <tfx_lawina.vsh>
    #moj_import <tfx_dym.vsh>
    #moj_import <tfx_neon_oddech.vsh>
    #moj_import <tfx_winda.vsh>
    #moj_import <tfx_karuzela_neon.vsh>
    #moj_import <tfx_neon_deszcz.vsh>
    #moj_import <tfx_konfetti.vsh>
    #moj_import <tfx_fala_fioletowa.vsh>
    #moj_import <tfx_fala_zlota.vsh>
    #moj_import <tfx_magnes.vsh>
    #moj_import <tfx_sznurek.vsh>
    #moj_import <tfx_fala_zielona.vsh>
    #moj_import <tfx_fala_rozowa.vsh>
    #moj_import <tfx_prad.vsh>
    #moj_import <tfx_luna.vsh>
    #moj_import <tfx_bateria.vsh>
    #moj_import <tfx_wyskok.vsh>
    #moj_import <tfx_tarcza.vsh>
    #moj_import <tfx_gwiazdki.vsh>
    #moj_import <tfx_neon_laser.vsh>
    #moj_import <tfx_wstecz.vsh>
    #moj_import <tfx_morska.vsh>
    #moj_import <tfx_karmazyn.vsh>
    #moj_import <tfx_wizja.vsh>
}
