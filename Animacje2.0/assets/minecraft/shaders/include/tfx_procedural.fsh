// ============================================================
// SILNIK PROCEDURALNY (FSH) — kolor z kodu (G = wzor, B = predkosc/intensywnosc)
// ============================================================
vec4 tfxRenderProcedural(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    int G = int(base.r * 255.0 + 0.5);
    float Bn = base.g;
    float spd = 0.5 + Bn * 1.5;
    float t = GameTime * spd;
    int pat = G % 16;
    float va = fract(float(G / 16) * 0.61803) * 6.28318;
    float inten = 0.6 + Bn * 0.4;
    vec3 col = vec3(1.0);
    if (pat == 0) {
        col = tfxHsv(fract(float(G) * 0.0039 + va * 0.1), 0.9, inten);
    } else if (pat == 1) {
        float h = fract(float(G) * 0.0039 + va * 0.1);
        col = tfxHsv(h, 0.9, (0.55 + 0.45 * (0.5 + 0.5 * sin(t * 4.0))) * inten);
    } else if (pat == 2) {
        float scan = 0.75 + 0.25 * sin(gl_FragCoord.y * 0.8 - t * 5.0);
        col = tfxHsv(fract(float(G) * 0.0039), 0.9, scan * inten);
    } else if (pat == 3) {
        float v = 0.55 + 0.45 * (0.5 + 0.5 * sin(t * 3.0));
        col = mix(tfxHsv(fract(float(G) * 0.0039), 0.8, 0.5), tfxHsv(fract(float(G) * 0.0039), 0.9, 1.0), v) * inten;
    } else if (pat == 4) {
        col = tfxHsv(fract(tfxPos.x * 0.05 - t * 0.4 + va * 0.1), 1.0, inten);
    } else if (pat == 5) {
        col = tfxHsv(fract(float(G) * 0.0039 + tfxPos.x * 0.01), 0.85, inten);
    } else if (pat == 6) {
        col = tfxHsv(fract(float(G) * 0.0039 + gl_FragCoord.y * 0.001), 0.85, inten);
    } else if (pat == 7) {
        vec2 p = gl_FragCoord.xy * 0.012;
        float v = sin(p.x * 3.0 + t * 1.7) + sin(p.y * 2.6 - t * 1.3) + sin((p.x + p.y) * 2.0 + t * 2.1);
        col = tfxHsv(fract(v * 0.1667 + 0.5 + float(G) * 0.002), 0.85, inten);
    } else if (pat == 8) {
        float n = tfxHashF(gl_FragCoord.xy * 0.4 + vec2(floor(t * 6.0), 0.0));
        float tw = pow(n, 4.0) * (0.5 + 0.5 * sin(t * 5.0 + n * 30.0));
        col = tfxHsv(fract(float(G) * 0.0039), 0.8, 0.7 * inten) + vec3(tw * 0.8);
    } else if (pat == 9) {
        float f = floor(t * 14.0);
        float n = tfxHashF(floor(gl_FragCoord.xy * 0.35) + vec2(0.0, f));
        float fire = pow(clamp(n, 0.0, 1.0), 1.4);
        col = mix(vec3(0.35, 0.05, 0.02), vec3(1.0, 0.45, 0.05), smoothstep(0.25, 0.6, fire));
        col = mix(col, vec3(1.0, 0.85, 0.25), smoothstep(0.6, 0.95, fire)) * (0.5 + 0.5 * fire);
    } else if (pat == 10) {
        vec2 p = gl_FragCoord.xy;
        float c1 = sin(p.x * 0.02 + p.y * 0.008 + t * 2.2);
        float c2 = sin(p.x * 0.011 - p.y * 0.017 - t * 1.7);
        float caustic = pow(0.5 + 0.5 * (c1 * c2), 2.2);
        col = mix(vec3(0.05, 0.25, 0.55), vec3(0.35, 0.9, 1.0), caustic) * inten;
    } else if (pat == 11) {
        float f = floor(t * 30.0);
        float n = tfxHashF(gl_FragCoord.xy * 0.5 + vec2(f * 13.7, f * 7.3));
        col = vec3(0.75, 0.82, 0.95) * (0.45 + 0.55 * n);
    } else if (pat == 12) {
        float ph = fract(t * 0.7);
        float on = (smoothstep(0.02, 0.06, ph) - smoothstep(0.15, 0.19, ph))
                 + (smoothstep(0.24, 0.28, ph) - smoothstep(0.37, 0.41, ph))
                 + (smoothstep(0.52, 0.56, ph) - smoothstep(0.88, 0.92, ph));
        on = clamp(on, 0.0, 1.0);
        col = vec3(0.55, 0.85, 1.0) * (0.22 + 0.78 * on) * inten;
    } else if (pat == 13) {
        float d = fract(gl_FragCoord.y * 0.004 - t * 1.2);
        float line = pow(1.0 - smoothstep(0.0, 0.08, d), 2.0);
        col = tfxHsv(fract(float(G) * 0.0039), 0.9, 0.4) + vec3(0.8, 0.9, 1.0) * line * 0.8;
    } else if (pat == 14) {
        float band = sin(tfxPos.x * 0.012 + t * 0.8 + sin(gl_FragCoord.y * 0.03 - t * 0.5) * 1.5);
        float h = 0.33 + 0.12 * sin(tfxPos.x * 0.008 - t * 0.6) + va * 0.1;
        col = tfxHsv(fract(h), 0.8, (0.55 + 0.45 * (0.55 + 0.45 * band)) * inten);
    } else {
        col = tfxHsv(fract(t * 0.25 + va * 0.1), 1.0, inten);
    }
    return vec4(clamp(col, 0.0, 1.0), a);
}
