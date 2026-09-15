// ============================================================
// EFEKT (HYBRYDA: kolor + ruch): AURORA   |   kolor spustowy: #A0A044
// aurora — zielono-fioletowe zaslonki dryfujace poziomo
// ============================================================
if (c == ivec3(160, 160, 68)) {
        tfxIDg = 30.0;
        tfxBaseg = vec4(1.0);
        tfxOffg.x += sin(GameTime * 1.2) * 0.007;
}
