// ============================================================
// EFEKT (HYBRYDA: kolor + ruch): LOD   |   kolor spustowy: #A0A03C
// lod — zimna sin z ruchomymi iskrzeniami
// ============================================================
if (c == ivec3(160, 160, 60)) {
        tfxIDg = 28.0;
        tfxBaseg = vec4(1.0);
        tfxOffg.y += sin(GameTime * 1.8) * 0.004;
}
