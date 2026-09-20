// Animacje 3.0 — wspólny dispatcher FSH; nie importuje usuniętych efektów.
float tfxHashF(vec2 p) {
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
}

vec3 tfxHsv(float h, float s, float v) {
    vec3 k = abs(fract(vec3(h) + vec3(0.0, 2.0 / 3.0, 1.0 / 3.0)) * 6.0 - 3.0);
    return v * mix(vec3(1.0), clamp(k - 1.0, 0.0, 1.0), s);
}

#define TFX_FPS 60.0
#define TFX_SPD 1.0
#define TFX_INT 1.0

    #moj_import <tfx_blysk.fsh>
    #moj_import <tfx_neonfala.fsh>
    #moj_import <tfx_tecafala.fsh>
    #moj_import <tfx_kaskada.fsh>
    #moj_import <tfx_laser2.fsh>
    #moj_import <tfx_grzmot.fsh>
    #moj_import <tfx_neon.fsh>
    #moj_import <tfx_neon_puls.fsh>
    #moj_import <tfx_zloty_blask.fsh>
    #moj_import <tfx_galaktyka.fsh>
    #moj_import <tfx_piorun.fsh>
    #moj_import <tfx_plazma.fsh>
    #moj_import <tfx_ogien.fsh>
    #moj_import <tfx_lod.fsh>
    #moj_import <tfx_diament.fsh>
    #moj_import <tfx_aurora.fsh>
    #moj_import <tfx_ocean.fsh>
    #moj_import <tfx_neon_grad.fsh>
    #moj_import <tfx_chroma.fsh>
    #moj_import <tfx_wave.fsh>
    #moj_import <tfx_rainbow.fsh>
    #moj_import <tfx_glitch_hard.fsh>
    #moj_import <tfx_tsunami.fsh>
    #moj_import <tfx_karuzela.fsh>
    #moj_import <tfx_tornado.fsh>
    #moj_import <tfx_pulse.fsh>
    #moj_import <tfx_heartbeat.fsh>
    #moj_import <tfx_ripple.fsh>
    #moj_import <tfx_orbita.fsh>
    #moj_import <tfx_skok.fsh>
    #moj_import <tfx_spin.fsh>
    #moj_import <tfx_floaty.fsh>
    #moj_import <tfx_zigzag.fsh>
    #moj_import <tfx_tancuj.fsh>
    #moj_import <tfx_lawina.fsh>
    #moj_import <tfx_dym.fsh>
    #moj_import <tfx_neon_deszcz.fsh>
    #moj_import <tfx_konfetti.fsh>
    #moj_import <tfx_fala_wodna.fsh>
    #moj_import <tfx_spirala.fsh>
    #moj_import <tfx_metronom.fsh>
    #moj_import <tfx_matrix.fsh>
    #moj_import <tfx_gwiazdy_zloto.fsh>
    #moj_import <tfx_pulsar_neonowy.fsh>
    #moj_import <tfx_wir_galaktyka.fsh>
    #moj_import <tfx_kap_wodny.fsh>
    #moj_import <tfx_kometa.fsh>
    #moj_import <tfx_iskry.fsh>
    #moj_import <tfx_pryzmat.fsh>
    #moj_import <tfx_szklo.fsh>
    #moj_import <tfx_spectrum.fsh>
    #moj_import <tfx_aurora_flow.fsh>
    #moj_import <tfx_sunset.fsh>
    #moj_import <tfx_firefly.fsh>
    #moj_import <tfx_electric.fsh>
    #moj_import <tfx_glow.fsh>
    #moj_import <tfx_ice_crystal.fsh>
    #moj_import <tfx_lava.fsh>
    #moj_import <tfx_moonlight.fsh>
    #moj_import <tfx_starlight.fsh>
    #moj_import <tfx_gold_rush.fsh>
    #moj_import <tfx_pixel.fsh>
    #moj_import <tfx_scanline.fsh>
    #moj_import <tfx_wave2.fsh>
    #moj_import <tfx_ripple2.fsh>
    #moj_import <tfx_bounce.fsh>
    #moj_import <tfx_swing.fsh>
    #moj_import <tfx_jelly.fsh>
    #moj_import <tfx_orbit2.fsh>
    #moj_import <tfx_comet2.fsh>
    #moj_import <tfx_sparkle.fsh>
    #moj_import <tfx_prism2.fsh>
    #moj_import <tfx_breath.fsh>
    #moj_import <tfx_gradient.fsh>
    #moj_import <tfx_mirror.fsh>
    #moj_import <tfx_hack_matrix.fsh>
    #moj_import <tfx_hack_terminal.fsh>
    #moj_import <tfx_hack_cyber.fsh>
    #moj_import <tfx_hack_redteam.fsh>
    #moj_import <tfx_hack_zeroday.fsh>
    #moj_import <tfx_hack_root.fsh>
    #moj_import <tfx_hack_binary.fsh>
    #moj_import <tfx_hack_glitch.fsh>
    #moj_import <tfx_hack_virus.fsh>
    #moj_import <tfx_hack_overclock.fsh>
