










void applyExtrudeEffect(vec2 uv,
                        vec4 baseColor,
                        vec4 effectColor,
                        vec4 effectColor2,
                        vec4 effectColor3,
                        vec4 effectParams,
                        vec3 glyphT0, vec3 glyphT1, vec3 glyphT2, vec3 glyphT3,
                        sampler2D tex,
                        out vec4 result) {
    vec2 uvMin, uvMax;
    calculateUVBounds(glyphT0, glyphT1, glyphT2, glyphT3, uvMin, uvMax);
    if (uvMax.x < uvMin.x || uvMax.y < uvMin.y) {
        uvMin = vec2(0.0); uvMax = vec2(1.0);
    }

    vec2 texSize = vec2(textureSize(tex, 0));
    float depth = effectParams.x;
    int layers = max(int(effectParams.y + 0.5), 1);
    int mode = int(effectParams.z + 0.5);


    vec2 layerStep = vec2(depth, depth) / texSize;


    bool insideBounds = (uv.x >= uvMin.x && uv.x <= uvMax.x &&
                         uv.y >= uvMin.y && uv.y <= uvMax.y);
    float currentA = insideBounds ? texture(tex, uv).a : 0.0;
    if (currentA > 0.1) {
        result = vec4(baseColor.rgb, currentA * baseColor.a);
        return;
    }


    for (int i = 1; i <= 16; i++) {
        if (i > layers) break;
        vec2 sampleUV = uv - layerStep * float(i);
        if (sampleUV.x < uvMin.x || sampleUV.x > uvMax.x ||
            sampleUV.y < uvMin.y || sampleUV.y > uvMax.y) continue;
        float a = texture(tex, sampleUV).a;
        if (a > 0.5) {
            vec3 layerColor;
            float layerAlpha;
            if (mode == 2 && layers > 1) {

                float t = float(i - 1) / float(layers - 1);
                float segment = t * 2.0;
                vec3  c;
                float aa;
                if (segment < 1.0) {
                    c  = mix(effectColor.rgb,  effectColor2.rgb, segment);
                    aa = mix(effectColor.a,    effectColor2.a,   segment);
                } else {
                    c  = mix(effectColor2.rgb, effectColor3.rgb, segment - 1.0);
                    aa = mix(effectColor2.a,   effectColor3.a,   segment - 1.0);
                }
                layerColor = c;
                layerAlpha = a * aa;
            } else if (mode == 2) {

                layerColor = effectColor.rgb;
                layerAlpha = a * effectColor.a;
            } else if (mode == 1 && layers > 1) {

                float t = float(i - 1) / float(layers - 1);
                layerColor = mix(baseColor.rgb, effectColor.rgb, t);
                layerAlpha = a * mix(baseColor.a, effectColor.a, t);
            } else if (mode == 1) {

                layerColor = effectColor.rgb;
                layerAlpha = a * effectColor.a;
            } else {

                float darken = float(i) / float(layers + 1);
                layerColor = baseColor.rgb * (1.0 - darken * 0.65);
                layerAlpha = a * baseColor.a;
            }
            result = vec4(layerColor, layerAlpha);
            return;
        }
    }
    discard;
}
