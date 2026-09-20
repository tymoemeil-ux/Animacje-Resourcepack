





#ifndef PI
#define PI 3.14159265359
#endif

void applyChromaticEffect(vec2 uv, vec4 baseColor, vec4 effectColor, vec4 effectParams,
                          vec3 glyphT0, vec3 glyphT1, vec3 glyphT2, vec3 glyphT3,
                          float gameTime, sampler2D tex, out vec4 result) {
    vec2 uvMin, uvMax;
    calculateUVBounds(glyphT0, glyphT1, glyphT2, glyphT3, uvMin, uvMax);
    if (uvMax.x < uvMin.x || uvMax.y < uvMin.y) {
        uvMin = vec2(0.0); uvMax = vec2(1.0);
    }

    vec2 texSize = vec2(textureSize(tex, 0));
    float intensity = effectParams.x;
    float speed = effectParams.y;


    float anim = 1.0 + 0.4 * sin(gameTime * speed * 1000.0);
    vec2 offset = vec2(intensity * anim / texSize.x, 0.0);


    float aR = 0.0, aG = 0.0, aB = 0.0;
    vec2 sR = uv - offset;
    vec2 sG = uv;
    vec2 sB = uv + offset;
    if (sR.x >= uvMin.x && sR.x <= uvMax.x && sR.y >= uvMin.y && sR.y <= uvMax.y) aR = texture(tex, sR).a;
    if (sG.x >= uvMin.x && sG.x <= uvMax.x && sG.y >= uvMin.y && sG.y <= uvMax.y) aG = texture(tex, sG).a;
    if (sB.x >= uvMin.x && sB.x <= uvMax.x && sB.y >= uvMin.y && sB.y <= uvMax.y) aB = texture(tex, sB).a;

    float maxA = max(max(aR, aG), aB);
    if (maxA < 0.1) discard;


    vec3 color;
    color.r = aR + aG * baseColor.r;
    color.g = aG * baseColor.g;
    color.b = aB + aG * baseColor.b;
    color = clamp(color, 0.0, 1.0);

    result = vec4(color, maxA * baseColor.a);
}
