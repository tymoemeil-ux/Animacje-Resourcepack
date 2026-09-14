#ifndef PI
#define PI 3.14159265359
#endif

void applyShimmerEffect(vec2 uv, vec4 baseColor, vec4 effectColor, vec4 effectParams,
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

    float intensity = effectParams.x;
    float speed = effectParams.y;
    float width = clamp(effectParams.z, 0.05, 1.0);

    float d = uNorm * 0.7 + vNorm * 0.3;
    float p = fract(d - gameTime * speed * 0.25);
    float glow = smoothstep(0.0, width * 0.5, p) * (1.0 - smoothstep(width * 0.5, width, p));

    vec3 color = baseColor.rgb + effectColor.rgb * glow * intensity;
    result = vec4(clamp(color, 0.0, 1.0), a * baseColor.a);
}
