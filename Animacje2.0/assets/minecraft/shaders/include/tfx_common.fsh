// ============================================================
// Animacje 2.0 — funkcje efektow fragmentowych (FSH)
// kazdy efekt = osobny plik tfx_<nazwa>.fsh
// ============================================================
float tfxHashF(vec2 p) {
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
}

vec3 tfxHsv(float h, float s, float v) {
    vec3 k = abs(fract(vec3(h) + vec3(0.0, 2.0 / 3.0, 1.0 / 3.0)) * 6.0 - 3.0);
    return v * mix(vec3(1.0), clamp(k - 1.0, 0.0, 1.0), s);
}

    #moj_import <tfx_blysk.fsh>
    #moj_import <tfx_neonfala.fsh>
    #moj_import <tfx_tecafala.fsh>
    #moj_import <tfx_kaskada.fsh>
    #moj_import <tfx_laser2.fsh>
    #moj_import <tfx_grzmot.fsh>
    #moj_import <tfx_obrys.fsh>
    #moj_import <tfx_neon.fsh>
    #moj_import <tfx_neon_puls.fsh>
    #moj_import <tfx_zloty_blask.fsh>
    #moj_import <tfx_galaktyka.fsh>
    #moj_import <tfx_krew.fsh>
    #moj_import <tfx_piorun.fsh>
    #moj_import <tfx_plazma.fsh>
    #moj_import <tfx_ogien.fsh>
    #moj_import <tfx_lod.fsh>
    #moj_import <tfx_diament.fsh>
    #moj_import <tfx_aurora.fsh>
    #moj_import <tfx_ocean.fsh>
    #moj_import <tfx_neon_grad.fsh>
    #moj_import <tfx_chroma.fsh>
    #moj_import <tfx_morse.fsh>
    #moj_import <tfx_radar.fsh>
    #moj_import <tfx_glow.fsh>
    #moj_import <tfx_holo.fsh>
    #moj_import <tfx_static_tv.fsh>
    #moj_import <tfx_wave.fsh>
    #moj_import <tfx_wave_big.fsh>
    #moj_import <tfx_rainbow.fsh>
    #moj_import <tfx_glitch_hard.fsh>
    #moj_import <tfx_tsunami.fsh>
    #moj_import <tfx_karuzela.fsh>
    #moj_import <tfx_tornado.fsh>
    #moj_import <tfx_bumper.fsh>
    #moj_import <tfx_pulse.fsh>
    #moj_import <tfx_heartbeat.fsh>
    #moj_import <tfx_flicker.fsh>
    #moj_import <tfx_shake.fsh>
    #moj_import <tfx_ripple.fsh>
    #moj_import <tfx_orbita.fsh>
    #moj_import <tfx_skok.fsh>
    #moj_import <tfx_sway.fsh>
    #moj_import <tfx_hopwave.fsh>
    #moj_import <tfx_wobble.fsh>
    #moj_import <tfx_spin.fsh>
    #moj_import <tfx_tremor.fsh>
    #moj_import <tfx_floaty.fsh>
    #moj_import <tfx_zigzag.fsh>
    #moj_import <tfx_spryna.fsh>
    #moj_import <tfx_szarp.fsh>
    #moj_import <tfx_tancuj.fsh>
    #moj_import <tfx_lawina.fsh>
    #moj_import <tfx_dym.fsh>
    #moj_import <tfx_neon_oddech.fsh>
    #moj_import <tfx_winda.fsh>
    #moj_import <tfx_karuzela_neon.fsh>
    #moj_import <tfx_neon_deszcz.fsh>
    #moj_import <tfx_konfetti.fsh>
    #moj_import <tfx_fala_fioletowa.fsh>
    #moj_import <tfx_fala_zlota.fsh>
    #moj_import <tfx_magnes.fsh>
    #moj_import <tfx_sznurek.fsh>
    #moj_import <tfx_fala_zielona.fsh>
    #moj_import <tfx_fala_rozowa.fsh>
    #moj_import <tfx_prad.fsh>
    #moj_import <tfx_luna.fsh>
    #moj_import <tfx_bateria.fsh>
    #moj_import <tfx_wyskok.fsh>
    #moj_import <tfx_tarcza.fsh>
    #moj_import <tfx_gwiazdki.fsh>
    #moj_import <tfx_neon_laser.fsh>
    #moj_import <tfx_wstecz.fsh>
    #moj_import <tfx_morska.fsh>
    #moj_import <tfx_karmazyn.fsh>
    #moj_import <tfx_wizja.fsh>
