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

    #moj_import <minecraft:tfx_blysk.vsh>
    #moj_import <minecraft:tfx_neonfala.vsh>
    #moj_import <minecraft:tfx_tecafala.vsh>
    #moj_import <minecraft:tfx_kaskada.vsh>
    #moj_import <minecraft:tfx_laser2.vsh>
    #moj_import <minecraft:tfx_grzmot.vsh>
    #moj_import <minecraft:tfx_obrys.vsh>
    #moj_import <minecraft:tfx_neon.vsh>
    #moj_import <minecraft:tfx_neon_puls.vsh>
    #moj_import <minecraft:tfx_zloty_blask.vsh>
    #moj_import <minecraft:tfx_galaktyka.vsh>
    #moj_import <minecraft:tfx_krew.vsh>
    #moj_import <minecraft:tfx_piorun.vsh>
    #moj_import <minecraft:tfx_wave.vsh>
    #moj_import <minecraft:tfx_wave_big.vsh>
    #moj_import <minecraft:tfx_rainbow.vsh>
    #moj_import <minecraft:tfx_glitch_hard.vsh>
    #moj_import <minecraft:tfx_tsunami.vsh>
    #moj_import <minecraft:tfx_karuzela.vsh>
    #moj_import <minecraft:tfx_tornado.vsh>
    #moj_import <minecraft:tfx_bumper.vsh>
    #moj_import <minecraft:tfx_pulse.vsh>
    #moj_import <minecraft:tfx_heartbeat.vsh>
    #moj_import <minecraft:tfx_flicker.vsh>
    #moj_import <minecraft:tfx_shake.vsh>
}
