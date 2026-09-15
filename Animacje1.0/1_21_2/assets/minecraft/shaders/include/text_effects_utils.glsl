#moj_import <minecraft:common.glsl>
#moj_import <minecraft:offset.glsl>
#moj_import <minecraft:defaults.glsl>
#moj_import <minecraft:rainbow.glsl>
#moj_import <minecraft:wavy.glsl>
#moj_import <minecraft:bouncy.glsl>
#moj_import <minecraft:blinking.glsl>
#moj_import <minecraft:pulse.glsl>
#moj_import <minecraft:spin.glsl>
#moj_import <minecraft:shake.glsl>
#moj_import <minecraft:fade.glsl>
#moj_import <minecraft:iterating.glsl>
#moj_import <minecraft:glitch.glsl>
#moj_import <minecraft:gradient.glsl>
#moj_import <minecraft:scale.glsl>
#moj_import <minecraft:text_effects_api.glsl>
#moj_import <minecraft:apply_effect.glsl>









bool colorMatches(ivec3 c, vec3 target) {
    return c == ivec3(target * 255.0 + 0.5);
}
bool colorMatches(ivec3 c, vec4 target) {
    return colorMatches(c, target.rgb);
}


bool checkAndSetShadow(ivec3 c, vec3 target) {
    ivec3 t = ivec3(target * 255.0 + 0.5);
    if (c == t) {
        return true;
    }
    if (c == t / 4) {
        currentIsShadow = true;
        return currentIsShadow;
    }
    return false;
}
bool checkAndSetShadow(ivec3 c, vec4 target) {
    return checkAndSetShadow(c, target.rgb);
}


#define TEXT_EFFECT(COLOR) \
    if (colorMatches(c, COLOR))


#define TEXT_EFFECT_WITH_SHADOW(COLOR) \
    if (checkAndSetShadow(c, COLOR))

void applyTextEffects() {
    vec4 vertex = vec4(Position, 1.0);
    ivec3 c = ivec3(Color.rgb * 255.0 + 0.5);




    currentVertex = vertex;
    currentBaseColor = vec4(Color.rgb, 1.0);
    currentIsShadow = false;
    currentApplyToShadow = false;




    #moj_import <minecraft:_config.glsl>


    if (hasAnyEffect()) {
        applyEffect(currentVertex, currentBaseColor, currentIsShadow);
        return;
    }


    applyProjection(vertex);




    if (ProjMat[3][3] == 0.0) {
        gl_Position.z -= 0.001;
    }
    applyColorTexture();
    finalize();
}
