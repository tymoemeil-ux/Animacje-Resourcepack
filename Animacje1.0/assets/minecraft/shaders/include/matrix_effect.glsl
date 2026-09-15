void applyMatrixEffect(vec2 uv, vec4 baseColor, vec4 effectColor, vec4 effectParams,
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


    float speed = max(effectParams.x, 0.1);
    float cols = max(effectParams.y, 2.0);
    float t = gameTime * speed;

    float col = floor(uNorm * cols);
    float colSeed = fract(sin(col * 12.9898 + 78.233) * 43758.5453);
    float colSpeed = 0.5 + 0.7 * colSeed;
    float head = fract(t * colSpeed + col * 0.29);
    float d = fract(vNorm + head);

    float trail = exp(-d * 5.0);
    float headGlow = 1.0 - smoothstep(0.0, 0.06, d);

    vec3 color = mix(baseColor.rgb, effectColor.rgb, 0.85);
    color *= 0.3 + trail * 1.2 + headGlow * 1.4;

    result = vec4(clamp(color, 0.0, 1.0), a * baseColor.a);
}
