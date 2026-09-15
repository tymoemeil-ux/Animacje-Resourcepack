void applyGlitchHardEffect(vec2 uv, vec4 baseColor, vec4 effectColor, vec4 effectParams,
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
    float strength = max(effectParams.y, 0.1);
    float t = gameTime * speed;

    float rowF = floor(vNorm * 12.0);
    float stepF = floor(t * 8.0);
    float gSeed = fract(sin(dot(vec2(rowF, stepF), vec2(12.9898, 78.233))) * 43758.5453);
    float hit = step(0.65, gSeed);
    float shift = (gSeed - 0.5) * 2.0 * hit * strength * 0.05;

    vec2 off = vec2(shift, 0.0);
    float aC = texture(tex, uv + off).a;
    float aR = texture(tex, uv + off + vec2(0.006, 0.0)).a;
    float aB = texture(tex, uv + off - vec2(0.006, 0.0)).a;

    vec3 color = baseColor.rgb * a;
    if (hit > 0.5) {
        color = vec3(baseColor.r * aR, baseColor.g * aC, baseColor.b * aB);
        color += effectColor.rgb * (gSeed - 0.5) * strength;
    }

    result = vec4(clamp(color, 0.0, 1.0), a * baseColor.a);
}
