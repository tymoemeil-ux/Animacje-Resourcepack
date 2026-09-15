// ============================================================
// EFEKT (RUCH): METRONOM   |   kolor spustowy: #A0A0F4
// powolne wahanie z hamowaniem na koncach, srebro
// ============================================================
if (c == ivec3(160, 160, 244)) {
        tfxIDg = 86.0;
        float e = smoothstep(0.0, 0.5, 0.5 + 0.5 * sin(GameTime * 2.2));
        tfxOffg.x += (e * 2.0 - 1.0) * 0.018;
}
