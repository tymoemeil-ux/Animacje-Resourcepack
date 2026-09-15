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
