// ============================================================
// EFEKT (HYBRYDA: kolor + ruch): NEON_PULS   |   kolor spustowy: #A0A020
// ostro pulsujacy neon
// ============================================================
if (c == ivec3(160, 160, 32)) {
        tfxIDg = 9.0;
        tfxBaseg = vec4(1.0);
        tfxOffg.y += sin(GameTime * 6.0) * 0.008;
}
