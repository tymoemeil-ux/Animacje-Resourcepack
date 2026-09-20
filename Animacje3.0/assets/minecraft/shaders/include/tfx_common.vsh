// Animacje 3.1 — dispatcher 85 efektów, płynny target 60 FPS.
float tfxIDg = 0.0;
vec4 tfxBaseg = vec4(1.0);
vec2 tfxOffg = vec2(0.0);
float tfxAlphag = 1.0;
vec3 tfxTintg = vec3(-1.0);
float tfxCustomg = 0.0;

float tfxHash(vec2 p) {
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
}

vec3 tfxHsv(float h, float s, float v) {
    vec3 k = abs(fract(vec3(h) + vec3(0.0, 2.0 / 3.0, 1.0 / 3.0)) * 6.0 - 3.0);
    return v * mix(vec3(1.0), clamp(k - 1.0, 0.0, 1.0), s);
}

#define TFX_SPD 1.0
#define TFX_AMP 1.0

void tfxDetect(ivec3 c, float g) {
    tfxIDg = 0.0;
    tfxBaseg = vec4(1.0);
    tfxOffg = vec2(0.0);
    tfxAlphag = 1.0;
    tfxTintg = vec3(-1.0);
    tfxCustomg = 0.0;

    #moj_import <tfx_blysk.vsh>
    #moj_import <tfx_neonfala.vsh>
    #moj_import <tfx_tecafala.vsh>
    #moj_import <tfx_kaskada.vsh>
    #moj_import <tfx_laser2.vsh>
    #moj_import <tfx_grzmot.vsh>
    #moj_import <tfx_neon.vsh>
    #moj_import <tfx_neon_puls.vsh>
    #moj_import <tfx_zloty_blask.vsh>
    #moj_import <tfx_galaktyka.vsh>
    #moj_import <tfx_piorun.vsh>
    #moj_import <tfx_plazma.vsh>
    #moj_import <tfx_ogien.vsh>
    #moj_import <tfx_lod.vsh>
    #moj_import <tfx_diament.vsh>
    #moj_import <tfx_aurora.vsh>
    #moj_import <tfx_ocean.vsh>
    #moj_import <tfx_neon_grad.vsh>
    #moj_import <tfx_chroma.vsh>
    #moj_import <tfx_wave.vsh>
    #moj_import <tfx_rainbow.vsh>
    #moj_import <tfx_glitch_hard.vsh>
    #moj_import <tfx_tsunami.vsh>
    #moj_import <tfx_karuzela.vsh>
    #moj_import <tfx_tornado.vsh>
    #moj_import <tfx_pulse.vsh>
    #moj_import <tfx_heartbeat.vsh>
    #moj_import <tfx_ripple.vsh>
    #moj_import <tfx_orbita.vsh>
    #moj_import <tfx_skok.vsh>
    #moj_import <tfx_spin.vsh>
    #moj_import <tfx_floaty.vsh>
    #moj_import <tfx_zigzag.vsh>
    #moj_import <tfx_tancuj.vsh>
    #moj_import <tfx_lawina.vsh>
    #moj_import <tfx_dym.vsh>
    #moj_import <tfx_neon_deszcz.vsh>
    #moj_import <tfx_konfetti.vsh>
    #moj_import <tfx_fala_wodna.vsh>
    #moj_import <tfx_spirala.vsh>
    #moj_import <tfx_metronom.vsh>
    #moj_import <tfx_matrix.vsh>
    #moj_import <tfx_gwiazdy_zloto.vsh>
    #moj_import <tfx_pulsar_neonowy.vsh>
    #moj_import <tfx_wir_galaktyka.vsh>
    #moj_import <tfx_kap_wodny.vsh>
    #moj_import <tfx_kometa.vsh>
    #moj_import <tfx_iskry.vsh>
    #moj_import <tfx_pryzmat.vsh>
    #moj_import <tfx_szklo.vsh>
    #moj_import <tfx_spectrum.vsh>
    #moj_import <tfx_aurora_flow.vsh>
    #moj_import <tfx_sunset.vsh>
    #moj_import <tfx_firefly.vsh>
    #moj_import <tfx_electric.vsh>
    #moj_import <tfx_glow.vsh>
    #moj_import <tfx_ice_crystal.vsh>
    #moj_import <tfx_lava.vsh>
    #moj_import <tfx_moonlight.vsh>
    #moj_import <tfx_starlight.vsh>
    #moj_import <tfx_gold_rush.vsh>
    #moj_import <tfx_pixel.vsh>
    #moj_import <tfx_scanline.vsh>
    #moj_import <tfx_wave2.vsh>
    #moj_import <tfx_ripple2.vsh>
    #moj_import <tfx_bounce.vsh>
    #moj_import <tfx_swing.vsh>
    #moj_import <tfx_jelly.vsh>
    #moj_import <tfx_orbit2.vsh>
    #moj_import <tfx_comet2.vsh>
    #moj_import <tfx_sparkle.vsh>
    #moj_import <tfx_prism2.vsh>
    #moj_import <tfx_breath.vsh>
    #moj_import <tfx_gradient.vsh>
    #moj_import <tfx_mirror.vsh>
    #moj_import <tfx_hack_matrix.vsh>
    #moj_import <tfx_hack_terminal.vsh>
    #moj_import <tfx_hack_cyber.vsh>
    #moj_import <tfx_hack_redteam.vsh>
    #moj_import <tfx_hack_zeroday.vsh>
    #moj_import <tfx_hack_root.vsh>
    #moj_import <tfx_hack_binary.vsh>
    #moj_import <tfx_hack_glitch.vsh>
    #moj_import <tfx_hack_virus.vsh>
    #moj_import <tfx_hack_overclock.vsh>
    int tfxCustomR = c.r;
    int tfxCustomG = c.g;
    int tfxCustomB = c.b;
    int customId = ((tfxCustomG & 7) << 4) | (tfxCustomB & 7);
    if ((tfxCustomR & 15) == 10 && (tfxCustomG & 8) != 0 && (tfxCustomB & 8) != 0 && customId > 0 && customId <= 85) {
        tfxIDg = float(customId);
        tfxBaseg = vec4(vec3(float(tfxCustomR >> 4), float(tfxCustomG >> 4), float(tfxCustomB >> 4)) / 15.0, 1.0);
        tfxTintg = tfxBaseg.rgb;
        tfxCustomg = 1.0;
    }
}
