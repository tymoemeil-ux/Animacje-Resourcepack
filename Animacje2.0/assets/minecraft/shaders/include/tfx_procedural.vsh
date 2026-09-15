// ============================================================
// SILNIK PROCEDURALNY (VSH) — 8 126 464 unikalnych wariantow
// kod koloru: R = wzor ruchu + faza, G = wzor koloru (FSH),
// B = predkosc + amplituda
// zakres R: 1-31, 48, 80, 112, 208, 145-159, 161-175, 177-191,
//           193-207, 225-239, 241-254 (zero kolizji z 155 nazwami)
// ============================================================
void tfxProcDetect(ivec3 c, float g) {
    int R = c.r;
    int G = c.g;
    int B = c.b;
    tfxIDg = 156.0;
    tfxBaseg = vec4(float(G) / 255.0, float(B) / 255.0, float(R) / 255.0, 1.0);

    float spd = 0.5 + (float(B) / 255.0) * 1.5;
    float amp = 0.006 + (float(B) / 255.0) * 0.012;
    float t = GameTime * spd;
    int pat = (R - 1) % 16;
    float va = fract(float(R) * 0.61803) * 6.28318;

    if (pat == 0) {
        tfxOffg.y += sin(g * 0.6 - t * 4.0 + va) * amp * 1.6;
    } else if (pat == 1) {
        tfxOffg.y += sin(g * 0.25 - t * 2.0 + va) * amp * 2.2;
    } else if (pat == 2) {
        float ph = fract(t * 0.8 + va * 0.1);
        float b = sin(min(ph / 0.4, 1.0) * 3.14159);
        tfxOffg.y += b * b * amp * 3.0;
    } else if (pat == 3) {
        float ph = t * 3.0 + g * 0.5 + va;
        tfxOffg.x += cos(ph) * amp;
        tfxOffg.y += sin(ph) * amp * 1.4;
    } else if (pat == 4) {
        float ph = t * 3.0 + g * 0.35 + va;
        tfxOffg.x += cos(ph) * amp * 1.4;
        tfxOffg.y += sin(ph * 2.0) * amp;
    } else if (pat == 5) {
        float tri = abs(fract(t * 0.9 + g * 0.04 + va * 0.1) * 2.0 - 1.0) * 2.0 - 1.0;
        tfxOffg.x += tri * amp * 2.0;
    } else if (pat == 6) {
        float tri = abs(fract(t * 0.9 + g * 0.05 + va * 0.1) * 2.0 - 1.0) * 2.0 - 1.0;
        tfxOffg.y += tri * amp * 2.0;
    } else if (pat == 7) {
        float f = floor(t * 16.0);
        tfxOffg.x += (tfxHash(vec2(f, g)) - 0.5) * amp * 2.0;
        tfxOffg.y += (tfxHash(vec2(f, g + 1.0)) - 0.5) * amp * 2.0;
    } else if (pat == 8) {
        tfxOffg.x += sin(t * 2.0 + g * 0.15 + va) * amp * 2.4;
    } else if (pat == 9) {
        float ph = fract(t * 0.5 + va * 0.05);
        tfxOffg.y += ph * amp * 4.0;
        tfxOffg.x += sin(ph * 6.28 + g) * amp * 0.5;
    } else if (pat == 10) {
        float ph = fract(t * 0.5 + va * 0.05);
        tfxOffg.y -= ph * amp * 4.0;
    } else if (pat == 11) {
        tfxOffg.y += sin(g * 0.8 - t * 6.0 + va) * amp + sin(g * 0.35 - t * 3.0) * amp * 0.7;
    } else if (pat == 12) {
        float s = sign(sin(g * 0.5 - t * 3.0 + va));
        tfxOffg.y += s * smoothstep(0.0, 0.25, abs(s)) * amp * 2.0;
    } else if (pat == 13) {
        float ph = fract(t * 0.7 + va * 0.1);
        float a2 = ph < 0.3 ? min(ph / 0.3, 1.0) : exp((0.3 - ph) * 4.0) * cos((ph - 0.3) * 16.0);
        tfxOffg.y -= a2 * amp * 4.0;
    } else if (pat == 14) {
        tfxOffg.x += sin(t * 5.0 + va) * amp * (1.0 + 0.4 * sin(t * 0.7));
    } else {
        float f = floor(t * 10.0);
        tfxOffg.x += (tfxHash(vec2(f, g * 2.0)) - 0.5) * amp * 3.0;
        tfxOffg.y += (tfxHash(vec2(f + 7.0, g)) - 0.5) * amp * 3.0;
    }
}
