void applyFlameEffect(vec2 uv, vec4 baseColor, vec4 effectColor, vec4 effectParams,
                      vec3 glyphT0, vec3 glyphT1, vec3 glyphT2, vec3 glyphT3,
                      float gameTime, sampler2D tex, out vec4 result) {
    float a = texture(tex, uv).a;
    if (a < 0.1) {
        discard;
    }

    vec2 uvMin, uvMax;
    calculateUVBounds(glyphT0, glyphT1, glyphT2, glyphT3, uvMin, uvMax);
    if (uvMax.x < uvMin.x || uvMax.y < uvMin.y) {
        uvMin = vec2(0.0);
        uvMax = vec2(1.0);
    }

    vec2 uvSize = uvMax - uvMin;
    float uNorm = (uvSize.x > 0.0001) ? (uv.x - uvMin.x) / uvSize.x : 0.5;
    float vNorm = (uvSize.y > 0.0001) ? (uv.y - uvMin.y) / uvSize.y : 0.5;

    float speed = max(effectParams.y, 0.1);
    float intensity = effectParams.x;
    float t = gameTime * speed * 20.0;

    float fBase1 = (1.0 - vNorm) * 4.0 + t * 1.5 + uNorm * 2.0;
    float fBase2 = (1.0 - vNorm) * 7.0 - t * 2.5 + uNorm * 3.0 + 10.0;
    float fI1 = floor(fBase1);
    float fI2 = floor(fBase2);
    float fF1 = fract(fBase1);
    float fF2 = fract(fBase2);
    float h01 = fract(sin(fI1 * 12.9898 + 78.233) * 43758.5453);
    float h11 = fract(sin((fI1 + 1.0) * 12.9898 + 78.233) * 43758.5453);
    float h02 = fract(sin(fI2 * 12.9898 + 78.233) * 43758.5453);
    float h12 = fract(sin((fI2 + 1.0) * 12.9898 + 78.233) * 43758.5453);
    float n1 = mix(h01, h11, smoothstep(0.0, 1.0, fF1));
    float n2 = mix(h02, h12, smoothstep(0.0, 1.0, fF2));
    float heat = clamp(n1 * 0.7 + n2 * 0.5, 0.0, 1.0);
    heat *= mix(0.75, 1.0, 1.0 - vNorm);

    vec3 cLow = vec3(0.55, 0.05, 0.0);
    vec3 cMid = vec3(1.0, 0.45, 0.0);
    vec3 cHigh = vec3(1.0, 0.9, 0.3);
    vec3 flameColor = mix(cLow, cMid, smoothstep(0.25, 0.6, heat));
    flameColor = mix(flameColor, cHigh, smoothstep(0.6, 0.95, heat));

    vec3 color = mix(baseColor.rgb, flameColor, intensity);
    float flicker = 0.9 + 0.1 * sin(gameTime * speed * 60.0 + uNorm * 20.0);
    result = vec4(clamp(color * flicker, 0.0, 1.0), a * baseColor.a);
}
