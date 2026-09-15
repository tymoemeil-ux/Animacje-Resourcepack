






vec4 currentVertex;
vec4 currentBaseColor;
bool currentIsShadow = false;
bool currentApplyToShadow = false;


bool flagShake = false;
bool flagWavy = false;
bool flagRainbow = false;
bool flagBouncy = false;
bool flagBlinking = false;
bool flagPulse = false;
bool flagSpin = false;
bool flagSequentialSpin = false;
bool flagFade = false;
bool flagIterating = false;
bool flagGlitch = false;
bool flagScale = false;
bool flagGradient = false;
bool flagDynamicGradient = false;
bool flagAurora = false;
bool flagSplit = false;
bool flagOutline = false;
bool flagHatch = false;
bool flagNeon = false;
bool flagColorOverride = false;
bool flagChromatic = false;
bool flagExtrude = false;
bool flagNoise = false;
bool flagLiquid = false;
bool flagWater = false;
bool flagBob = false;
bool flagSway = false;
bool flagZigzag = false;
bool flagWobble = false;
bool flagFall = false;
bool flagRise = false;
bool flagOrbit = false;
bool flagDrift = false;
bool flagTypewriter = false;
bool flagErase = false;
bool flagHeartbeat = false;
bool flagFlicker = false;
bool flagBreathe = false;
bool flagBlask = false;
bool flagIskry = false;
bool flagPlomien = false;
bool flagPopcorn = false;
bool flagEksplozja = false;
bool flagWinda = false;
bool flagDeszcz = false;
bool flagMrugacz = false;
bool flagSkoczki = false;
bool flagLaser = false;
bool flagHolo = false;
bool flagGlitchHard = false;
bool flagMatrix = false;
bool flagCaustics = false;
bool flagWarp = false;
bool flagKrysztal = false;
bool flagPortal = false;
bool flagXray = false;
bool flagTermowizja = false;
bool flagTornado = false;
bool flagWahadlo = false;
bool flagWibracja = false;
bool flagPrzegon = false;
bool flagBumper = false;
bool flagHarmonijka = false;
bool flagNeonPuls = false;
bool flagSzklo = false;
bool flagZlotyBlask = false;
bool flagDiamet = false;
bool flagKrew = false;
bool flagPianka = false;
bool flagDym = false;
bool flagPiorun = false;
bool flagRadioaktywny = false;
bool flagPulsar = false;
bool flagGalaktyka = false;
bool flagTron = false;
bool flagPrizma = false;
bool flagCukierek = false;
bool flagOcean = false;
bool flagCzarnaDziura = false;
bool flagMrozy = false;
bool flagMagma = false;
bool flagPlasma = false;
bool flagAureola = false;
bool flagBlysk = false;
bool flagSmuga = false;
bool flagIskrenice = false;
bool flagTecfala = false;
bool flagSerce = false;
bool flagKula = false;
bool flagLuk = false;
bool flagMglawica = false;
bool flagSnieg = false;
bool flagRefleks = false;
bool flagKaskada = false;
bool flagNeonfala = false;
bool flagPerla = false;
bool flagZar = false;
bool flagFirerain = false;
bool flagKolumna = false;
bool flagLaser2 = false;
bool flagOdlamki = false;
bool flagGrzmot = false;
bool flagSwiatlo = false;
bool flagObrys = false;
bool flagGwiazdy = false;
bool flagElastyk = false;
bool flagZel = false;
bool flagSkok = false;
bool flagFala2 = false;
bool flagOrbit2 = false;
bool flagGrzmotW = false;
bool flagTsunami = false;
bool flagEkspres = false;
bool flagTectno = false;
bool flagKaruzela = false;
bool flagSpirala = false;
bool flagPociag = false;
bool flagBurza = false;
bool flagTitan = false;
bool flagMetronom = false;
bool flagFala3d = false;
bool flagPiorka = false;


float paramShakeSpeed = SHAKE_SPEED;
float paramShakeIntensity = SHAKE_INTENSITY;
float paramWaveSpeed = WAVE_SPEED;
float paramWaveAmplitude = WAVE_AMPLITUDE;
float paramWaveXFrequency = WAVE_X_FREQUENCY;
float paramRainbowSpeed = RAINBOW_SPEED;
float paramBounceSpeed = BOUNCE_SPEED;
float paramBounceAmplitude = BOUNCE_AMPLITUDE;
float paramBlinkSpeed = BLINK_SPEED;
float paramPulseSpeed = PULSE_SPEED;
float paramPulseSize = PULSE_SIZE;
float paramSpinSpeed = SPIN_SPEED;
float paramFadeSpeed = FADE_SPEED;
float paramIteratingSpeed = ITERATING_SPEED;
float paramIteratingSpace = ITERATING_SPACE;
float paramGlitchSpeed = GLITCH_SPEED;
float paramGlitchIntensity = GLITCH_INTENSITY;
float paramScaleFactor = SCALE_FACTOR;
float paramScaleOffsetX = SCALE_OFFSET_X;
float paramScaleOffsetY = SCALE_OFFSET_Y;
vec3 paramGradientStart = GRADIENT_START;
float paramGradientStartA = 1.0;
vec3 paramGradientEnd = GRADIENT_END;
float paramGradientEndA = 1.0;
float paramGradientDirection = GRADIENT_DIRECTION;
vec3 paramDynGradientStart = DYN_GRADIENT_START;
float paramDynGradientStartA = 1.0;
vec3 paramDynGradientEnd = DYN_GRADIENT_END;
float paramDynGradientEndA = 1.0;
float paramDynGradientDirection = DYN_GRADIENT_DIRECTION;
float paramDynGradientSpeed = DYN_GRADIENT_SPEED;
vec3 paramAuroraColor1 = AURORA_COLOR_1;
float paramAuroraColor1A = 1.0;
vec3 paramAuroraColor2 = AURORA_COLOR_2;
float paramAuroraColor2A = 1.0;
vec3 paramAuroraColor3 = AURORA_COLOR_3;
float paramAuroraColor3A = 1.0;
float paramAuroraSpeed = AURORA_SPEED;
float paramSplitIntensity = SPLIT_INTENSITY;
float paramSplitSpeed = SPLIT_SPEED;
vec4 paramOutlineColor = OUTLINE_COLOR;
float paramOutlineThickness = OUTLINE_THICKNESS;
vec4 paramHatchColor = HATCH_COLOR;
float paramHatchSpeed = HATCH_SPEED;
float paramHatchDensity = HATCH_DENSITY;
vec4 paramNeonColor = NEON_COLOR;
float paramNeonIntensity = NEON_INTENSITY;
float paramNeonSpeed = NEON_SPEED;
float paramChromaticIntensity = CHROMATIC_INTENSITY;
float paramChromaticSpeed = CHROMATIC_SPEED;
float paramExtrudeDepth = EXTRUDE_DEPTH;
float paramExtrudeLayers = EXTRUDE_LAYERS;
vec4 paramExtrudeColor = EXTRUDE_COLOR;
vec4 paramExtrudeColor2 = EXTRUDE_COLOR2;
vec4 paramExtrudeColor3 = EXTRUDE_COLOR3;
float paramExtrudeUseColor = 0.0;
float paramNoiseIntensity = NOISE_INTENSITY;
float paramNoiseSpeed = NOISE_SPEED;
float paramLiquidIntensity = LIQUID_INTENSITY;
float paramLiquidSpeed = LIQUID_SPEED;
vec4  paramWaterColor     = WATER_COLOR;
float paramWaterLevel     = WATER_LEVEL;
float paramWaterAmplitude = WATER_AMPLITUDE;
float paramWaterSpeed     = WATER_SPEED;
float paramWaterFrequency = WATER_FREQUENCY;
float paramBobSpeed = BOB_SPEED;
float paramBobAmplitude = BOB_AMPLITUDE;
float paramSwaySpeed = SWAY_SPEED;
float paramSwayAmplitude = SWAY_AMPLITUDE;
float paramZigzagSpeed = ZIGZAG_SPEED;
float paramZigzagAmplitude = ZIGZAG_AMPLITUDE;
float paramWobbleSpeed = WOBBLE_SPEED;
float paramWobbleAmplitude = WOBBLE_AMPLITUDE;
float paramFallSpeed = FALL_SPEED;
float paramRiseSpeed = RISE_SPEED;
float paramOrbitSpeed = ORBIT_SPEED;
float paramOrbitRadius = ORBIT_RADIUS;
float paramDriftSpeed = DRIFT_SPEED;
float paramTypewriterSpeed = TYPEWRITER_SPEED;
float paramEraseSpeed = ERASE_SPEED;
float paramHeartbeatSpeed = HEARTBEAT_SPEED;
float paramHeartbeatSize = HEARTBEAT_SIZE;
float paramFlickerSpeed = FLICKER_SPEED;
float paramFlickerIntensity = FLICKER_INTENSITY;
float paramBreatheSpeed = BREATHE_SPEED;
vec4 paramBlaskColor = BLASK_COLOR;
float paramBlaskIntensity = BLASK_INTENSITY;
float paramBlaskSpeed = BLASK_SPEED;
float paramBlaskWidth = BLASK_WIDTH;
vec4 paramIskryColor = ISKRY_COLOR;
float paramIskryIntensity = ISKRY_INTENSITY;
float paramIskrySpeed = ISKRY_SPEED;
float paramIskryDensity = ISKRY_DENSITY;
float paramPlomienIntensity = PLOMIEN_INTENSITY;
float paramPlomienSpeed = PLOMIEN_SPEED;
float paramPopcornSpeed = POPCORN_SPEED;
float paramPopcornSize = POPCORN_SIZE;
float paramEksplozjaSpeed = EKSPLOZJA_SPEED;
float paramEksplozjaRadius = EKSPLOZJA_RADIUS;
float paramWindaSpeed = WINDA_SPEED;
float paramDeszczSpeed = DESZCZ_SPEED;
float paramMrugaczSpeed = MRUGACZ_SPEED;
float paramSkoczkiSpeed = SKOCZKI_SPEED;
float paramSkoczkiAmplitude = SKOCZKI_AMPLITUDE;
vec4 paramLaserColor = LASER_COLOR;
float paramLaserSpeed = LASER_SPEED;
float paramLaserWidth = LASER_WIDTH;
vec4 paramHoloColor = HOLO_COLOR;
float paramHoloSpeed = HOLO_SPEED;
float paramHoloLines = HOLO_LINES;
vec4 paramGlitchHardColor = GLITCH_HARD_COLOR;
float paramGlitchHardSpeed = GLITCH_HARD_SPEED;
float paramGlitchHardStrength = GLITCH_HARD_STRENGTH;
vec4 paramMatrixColor = MATRIX_COLOR;
float paramMatrixSpeed = MATRIX_SPEED;
float paramMatrixCols = MATRIX_COLS;
vec4 paramCausticsColor = CAUSTICS_COLOR;
float paramCausticsSpeed = CAUSTICS_SPEED;
float paramCausticsScale = CAUSTICS_SCALE;
vec4 paramWarpColor = WARP_COLOR;
float paramWarpSpeed = WARP_SPEED;
float paramWarpStrength = WARP_STRENGTH;
vec4 paramKrysztalColor = KRYSTZAL_COLOR;
float paramKrysztalSpeed = KRYSTZAL_SPEED;
float paramKrysztalCells = KRYSTZAL_CELLS;
vec4 paramPortalColor = PORTAL_COLOR;
float paramPortalSpeed = PORTAL_SPEED;
float paramPortalSwirls = PORTAL_SWIRLS;
vec4 paramXrayColor = XRAY_COLOR;
float paramXraySpeed = XRAY_SPEED;
float paramXrayWidth = XRAY_WIDTH;
vec4 paramTermowizjaColor = TERMOWIZJA_COLOR;
float paramTermowizjaSpeed = TERMOWIZJA_SPEED;
float paramTermowizjaContrast = TERMOWIZJA_CONTRAST;
float paramTornadoSpeed = TORNADO_SPEED;
float paramTornadoSize = TORNADO_SIZE;
float paramWahadloSpeed = WAHADLO_SPEED;
float paramWahadloSize = WAHADLO_SIZE;
float paramWibracjaSpeed = WIBRACJA_SPEED;
float paramWibracjaSize = WIBRACJA_SIZE;
float paramPrzegonSpeed = PRZEGON_SPEED;
float paramPrzegonSize = PRZEGON_SIZE;
float paramBumperSpeed = BUMPER_SPEED;
float paramBumperSize = BUMPER_SIZE;
float paramHarmonijkaSpeed = HARMONIJKA_SPEED;
float paramHarmonijkaSize = HARMONIJKA_SIZE;
vec4 paramNeonPulsColor = NEON_PULS_COLOR;
float paramNeonPulsSPEED = NEON_PULS_SPEED;
float paramNeonPulsGLOW = NEON_PULS_GLOW;
vec4 paramSzkloColor = SZKLO_COLOR;
float paramSzkloSPEED = SZKLO_SPEED;
float paramSzkloWIDTH = SZKLO_WIDTH;
vec4 paramZlotyBlaskColor = ZLOTY_BLASK_COLOR;
float paramZlotyBlaskSPEED = ZLOTY_BLASK_SPEED;
float paramZlotyBlaskWIDTH = ZLOTY_BLASK_WIDTH;
vec4 paramDiametColor = DIAMET_COLOR;
float paramDiametSPEED = DIAMET_SPEED;
float paramDiametDENSITY = DIAMET_DENSITY;
vec4 paramKrewColor = KREW_COLOR;
float paramKrewSPEED = KREW_SPEED;
float paramKrewCOLS = KREW_COLS;
vec4 paramPiankaColor = PIANKA_COLOR;
float paramPiankaSPEED = PIANKA_SPEED;
float paramPiankaSIZE = PIANKA_SIZE;
vec4 paramDymColor = DYM_COLOR;
float paramDymSPEED = DYM_SPEED;
float paramDymDRIFT = DYM_DRIFT;
vec4 paramPiorunColor = PIORUN_COLOR;
float paramPiorunSPEED = PIORUN_SPEED;
float paramPiorunPOWER = PIORUN_POWER;
vec4 paramRadioaktywnyColor = RADIOAKTYWNY_COLOR;
float paramRadioaktywnySPEED = RADIOAKTYWNY_SPEED;
float paramRadioaktywnyINTENSITY = RADIOAKTYWNY_INTENSITY;
vec4 paramPulsarColor = PULSAR_COLOR;
float paramPulsarSPEED = PULSAR_SPEED;
float paramPulsarRINGS = PULSAR_RINGS;
vec4 paramGalaktykaColor = GALAKTYKA_COLOR;
float paramGalaktykaSPEED = GALAKTYKA_SPEED;
float paramGalaktykaSTARS = GALAKTYKA_STARS;
vec4 paramTronColor = TRON_COLOR;
float paramTronSPEED = TRON_SPEED;
float paramTronGRID = TRON_GRID;
vec4 paramPrizmaColor = PRIZMA_COLOR;
float paramPrizmaSPEED = PRIZMA_SPEED;
float paramPrizmaROWS = PRIZMA_ROWS;
vec4 paramCukierekColor = CUKIEREK_COLOR;
float paramCukierekSPEED = CUKIEREK_SPEED;
float paramCukierekWIDTH = CUKIEREK_WIDTH;
vec4 paramOceanColor = OCEAN_COLOR;
float paramOceanSPEED = OCEAN_SPEED;
float paramOceanWAVES = OCEAN_WAVES;
vec4 paramCzarnaDziuraColor = CZARNA_DZIURA_COLOR;
float paramCzarnaDziuraSPEED = CZARNA_DZIURA_SPEED;
float paramCzarnaDziuraSTRENGTH = CZARNA_DZIURA_STRENGTH;
vec4 paramMrozyColor = MROZY_COLOR;
float paramMrozySPEED = MROZY_SPEED;
float paramMrozyCELLS = MROZY_CELLS;
vec4 paramMagmaColor = MAGMA_COLOR;
float paramMagmaSPEED = MAGMA_SPEED;
float paramMagmaCRACKS = MAGMA_CRACKS;
vec4 paramPlasmaColor = PLASMA_COLOR;
float paramPlasmaSPEED = PLASMA_SPEED;
float paramPlasmaCONTRAST = PLASMA_CONTRAST;
vec4 paramAureolaColor = AUREOLA_COLOR;
float paramAureolaSPEED = AUREOLA_SPEED;
float paramAureolaINTENSITY = AUREOLA_INTENSITY;
vec4 paramBlyskColor = BLYSK_COLOR;
float paramBlyskSPEED = BLYSK_SPEED;
float paramBlyskWIDTH = BLYSK_WIDTH;
vec4 paramSmugaColor = SMUGA_COLOR;
float paramSmugaSPEED = SMUGA_SPEED;
float paramSmugaWIDTH = SMUGA_WIDTH;
vec4 paramIskreniceColor = ISKRENICE_COLOR;
float paramIskreniceSPEED = ISKRENICE_SPEED;
float paramIskreniceDENSITY = ISKRENICE_DENSITY;
vec4 paramTecfalaColor = TECAFALA_COLOR;
float paramTecfalaSPEED = TECAFALA_SPEED;
float paramTecfalaROWS = TECAFALA_ROWS;
vec4 paramSerceColor = SERCE_COLOR;
float paramSerceSPEED = SERCE_SPEED;
float paramSerceINTENSITY = SERCE_INTENSITY;
vec4 paramKulaColor = KULA_COLOR;
float paramKulaSPEED = KULA_SPEED;
float paramKulaRADIUS = KULA_RADIUS;
vec4 paramLukColor = LUK_COLOR;
float paramLukSPEED = LUK_SPEED;
float paramLukARCS = LUK_ARCS;
vec4 paramMglawicaColor = MGLAWICA_COLOR;
float paramMglawicaSPEED = MGLAWICA_SPEED;
float paramMglawicaDRIFT = MGLAWICA_DRIFT;
vec4 paramSniegColor = SNIEG_COLOR;
float paramSniegSPEED = SNIEG_SPEED;
float paramSniegFLAKES = SNIEG_FLAKES;
vec4 paramRefleksColor = REFLEKS_COLOR;
float paramRefleksSPEED = REFLEKS_SPEED;
float paramRefleksPOWER = REFLEKS_POWER;
vec4 paramKaskadaColor = KASKADA_COLOR;
float paramKaskadaSPEED = KASKADA_SPEED;
float paramKaskadaWIDTH = KASKADA_WIDTH;
vec4 paramNeonfalaColor = NEONFALA_COLOR;
float paramNeonfalaSPEED = NEONFALA_SPEED;
float paramNeonfalaHUE = NEONFALA_HUE;
vec4 paramPerlaColor = PERLA_COLOR;
float paramPerlaSPEED = PERLA_SPEED;
float paramPerlaIRI = PERLA_IRI;
vec4 paramZarColor = ZAR_COLOR;
float paramZarSPEED = ZAR_SPEED;
float paramZarEMBERS = ZAR_EMBERS;
vec4 paramFirerainColor = FIRERAIN_COLOR;
float paramFirerainSPEED = FIRERAIN_SPEED;
float paramFirerainDROPS = FIRERAIN_DROPS;
vec4 paramKolumnaColor = KOLUMNA_COLOR;
float paramKolumnaSPEED = KOLUMNA_SPEED;
float paramKolumnaCOLUMNS = KOLUMNA_COLUMNS;
vec4 paramLaser2Color = LASER2_COLOR;
float paramLaser2SPEED = LASER2_SPEED;
float paramLaser2WIDTH = LASER2_WIDTH;
vec4 paramOdlamkiColor = ODLAMKI_COLOR;
float paramOdlamkiSPEED = ODLAMKI_SPEED;
float paramOdlamkiSHARDS = ODLAMKI_SHARDS;
vec4 paramGrzmotColor = GRZMOT_COLOR;
float paramGrzmotSPEED = GRZMOT_SPEED;
float paramGrzmotPOWER = GRZMOT_POWER;
vec4 paramSwiatloColor = SWIATLO_COLOR;
float paramSwiatloSPEED = SWIATLO_SPEED;
float paramSwiatloRADIUS = SWIATLO_RADIUS;
vec4 paramObrysColor = OBRYS_COLOR;
float paramObrysSPEED = OBRYS_SPEED;
float paramObrysINTENSITY = OBRYS_INTENSITY;
vec4 paramGwiazdyColor = GWIAZDY_COLOR;
float paramGwiazdySPEED = GWIAZDY_SPEED;
float paramGwiazdySTARS = GWIAZDY_STARS;
float paramElastykSpeed = ELASTYK_SPEED;
float paramElastykSize = ELASTYK_SIZE;
float paramZelSpeed = ZEL_SPEED;
float paramZelSize = ZEL_SIZE;
float paramSkokSpeed = SKOK_SPEED;
float paramSkokSize = SKOK_SIZE;
float paramFala2Speed = FALA2_SPEED;
float paramFala2Size = FALA2_SIZE;
float paramOrbit2Speed = ORBIT2_SPEED;
float paramOrbit2Size = ORBIT2_SIZE;
float paramGrzmotWSpeed = GRZMOTW_SPEED;
float paramGrzmotWSize = GRZMOTW_SIZE;
float paramTsunamiSpeed = TSUNAMI_SPEED;
float paramTsunamiSize = TSUNAMI_SIZE;
float paramEkspresSpeed = EKSPRES_SPEED;
float paramEkspresSize = EKSPRES_SIZE;
float paramTectnoSpeed = TECTNO_SPEED;
float paramTectnoSize = TECTNO_SIZE;
float paramKaruzelaSpeed = KARUZELA_SPEED;
float paramKaruzelaSize = KARUZELA_SIZE;
float paramSpiralaSpeed = SPIRALA_SPEED;
float paramSpiralaSize = SPIRALA_SIZE;
float paramPociagSpeed = POCIAG_SPEED;
float paramPociagSize = POCIAG_SIZE;
float paramBurzaSpeed = BURZA_SPEED;
float paramBurzaSize = BURZA_SIZE;
float paramTitanSpeed = TITAN_SPEED;
float paramTitanSize = TITAN_SIZE;
float paramMetronomSpeed = METRONOM_SPEED;
float paramMetronomSize = METRONOM_SIZE;
float paramFala3dSpeed = FALA3D_SPEED;
float paramFala3dSize = FALA3D_SIZE;
float paramPiorkaSpeed = PIORKA_SPEED;
float paramPiorkaSize = PIORKA_SIZE;


vec3 rgb(float r, float g, float b) {
    return vec3(r / 255.0, g / 255.0, b / 255.0);
}


vec3 rgb(uint rgb_v) {
    float r = float((rgb_v >> 16) & 0xFFu) / 255.0;
    float g = float((rgb_v >> 8)  & 0xFFu) / 255.0;
    float b = float( rgb_v        & 0xFFu) / 255.0;
    return vec3(r, g, b);
}


vec3 rgb(int irgb_v) {
    return rgb(uint(irgb_v));
}


vec4 rgba(float r, float g, float b, float a) {
    return vec4(r / 255.0, g / 255.0, b / 255.0, a);
}


vec4 rgba(uint v) {
    float r = float((v >> 24) & 0xFFu) / 255.0;
    float g = float((v >> 16) & 0xFFu) / 255.0;
    float b = float((v >> 8)  & 0xFFu) / 255.0;
    float a = float( v        & 0xFFu) / 255.0;
    return vec4(r, g, b, a);
}


vec4 rgba(int irgba_v) {
    return rgba(uint(irgba_v));
}


vec4 argb(float a, float r, float g, float b) {
    return vec4(r / 255.0, g / 255.0, b / 255.0, a);
}


vec4 argb(uint v) {
    float a = float((v >> 24) & 0xFFu) / 255.0;
    float r = float((v >> 16) & 0xFFu) / 255.0;
    float g = float((v >> 8)  & 0xFFu) / 255.0;
    float b = float( v        & 0xFFu) / 255.0;
    return vec4(r, g, b, a);
}


vec4 argb(int iargb_v) {
    return argb(uint(iargb_v));
}


void apply_color(vec3 color) {
    currentBaseColor.rgb = color;
    flagColorOverride = true;
}




void apply_color(vec4 color) {
    currentBaseColor = color;
    flagColorOverride = true;
}


bool hasAnyEffect() {
    return flagShake || flagWavy || flagRainbow || flagBouncy || flagBlinking ||
           flagPulse || flagSpin || flagSequentialSpin || flagFade ||
           flagIterating || flagGlitch || flagScale || flagGradient || flagDynamicGradient ||
           flagAurora || flagSplit || flagOutline || flagHatch || flagNeon ||
           flagColorOverride || flagChromatic || flagExtrude || flagNoise || flagLiquid || flagWater || flagBob || flagSway || flagZigzag || flagWobble ||
           flagFall || flagRise || flagOrbit || flagDrift || flagTypewriter ||
           flagErase || flagHeartbeat || flagFlicker || flagBreathe ||
           flagBlask || flagIskry || flagPlomien || flagPopcorn || flagEksplozja ||
           flagWinda || flagDeszcz || flagMrugacz || flagSkoczki ||
           flagLaser || flagHolo || flagGlitchHard || flagMatrix || flagCaustics ||
           flagWarp || flagKrysztal || flagPortal || flagXray || flagTermowizja ||
           flagTornado || flagWahadlo || flagWibracja || flagPrzegon || flagBumper || flagHarmonijka ||
           flagNeonPuls || flagSzklo || flagZlotyBlask || flagDiamet || flagKrew || flagPianka || flagDym || flagPiorun || flagRadioaktywny || flagPulsar || flagGalaktyka || flagTron || flagPrizma || flagCukierek || flagOcean || flagCzarnaDziura || flagMrozy || flagMagma || flagPlasma || flagAureola ||
           flagKaruzela || flagSpirala || flagPociag || flagBurza || flagTitan || flagMetronom || flagFala3d || flagPiorka ||
           flagBlysk || flagSmuga || flagIskrenice || flagTecfala || flagSerce || flagKula || flagLuk || flagMglawica || flagSnieg || flagRefleks || flagKaskada || flagNeonfala || flagPerla || flagZar || flagFirerain || flagKolumna || flagLaser2 || flagOdlamki || flagGrzmot || flagSwiatlo || flagObrys || flagGwiazdy ||
           flagElastyk || flagZel || flagSkok || flagFala2 || flagOrbit2 || flagGrzmotW || flagTsunami || flagEkspres || flagTectno;
}


void apply_shake() {
    flagShake = true;
}

void apply_shake(float speed, float intensity) {
    flagShake = true;
    paramShakeSpeed = speed;
    paramShakeIntensity = intensity;
}


void apply_wavy() {
    flagWavy = true;
}

void apply_wavy(float speed) {
    flagWavy = true;
    paramWaveSpeed = speed;
}

void apply_wavy(float speed, float amplitude) {
    flagWavy = true;
    paramWaveSpeed = speed;
    paramWaveAmplitude = amplitude;
}

void apply_wavy(float speed, float amplitude, float xFrequency) {
    flagWavy = true;
    paramWaveSpeed = speed;
    paramWaveAmplitude = amplitude;
    paramWaveXFrequency = xFrequency;
}


void apply_rainbow() {
    flagRainbow = true;
}

void apply_rainbow(float speed) {
    flagRainbow = true;
    paramRainbowSpeed = speed;
}


void apply_bouncy() {
    flagBouncy = true;
}

void apply_bouncy(float speed) {
    flagBouncy = true;
    paramBounceSpeed = speed;
}

void apply_bouncy(float speed, float amplitude) {
    flagBouncy = true;
    paramBounceSpeed = speed;
    paramBounceAmplitude = amplitude;
}


void apply_blinking() {
    flagBlinking = true;
}

void apply_blinking(float speed) {
    flagBlinking = true;
    paramBlinkSpeed = speed;
}


void apply_pulse() {
    flagPulse = true;
}

void apply_pulse(float speed) {
    flagPulse = true;
    paramPulseSpeed = speed;
}

void apply_pulse(float speed, float size) {
    flagPulse = true;
    paramPulseSpeed = speed;
    paramPulseSize = size;
}


void apply_spin() {
    flagSpin = true;
}

void apply_spin(float speed) {
    flagSpin = true;
    paramSpinSpeed = speed;
}


void apply_sequential_spin() {
    flagSequentialSpin = true;
}

void apply_sequential_spin(float speed) {
    flagSequentialSpin = true;
    paramSpinSpeed = speed;
}


void apply_fade() {
    flagFade = true;
}

void apply_fade(float speed) {
    flagFade = true;
    paramFadeSpeed = speed;
}


void apply_iterating() {
    flagIterating = true;
}

void apply_iterating(float speed) {
    flagIterating = true;
    paramIteratingSpeed = speed;
}

void apply_iterating(float speed, float space) {
    flagIterating = true;
    paramIteratingSpeed = speed;
    paramIteratingSpace = space;
}


void apply_scale(float scale) {
    flagScale = true;
    paramScaleFactor = scale;
}

void apply_scale(float scale, float offsetX, float offsetY) {
    flagScale = true;
    paramScaleFactor = scale;
    paramScaleOffsetX = offsetX;
    paramScaleOffsetY = offsetY;
}

void apply_offset(float offsetX, float offsetY) {
    if (!flagScale) {
        paramScaleFactor = 1.0;
    }
    flagScale = true;
    paramScaleFactor = 0.0;
    paramScaleOffsetX = offsetX;
    paramScaleOffsetY = offsetY;
}


void apply_glitch() {
    flagGlitch = true;
}

void apply_glitch(float speed, float intensity) {
    flagGlitch = true;
    paramGlitchSpeed = speed;
    paramGlitchIntensity = intensity;
}


void apply_gradient(vec3 start, vec3 end, float direction) {
    flagGradient = true;
    paramGradientStart = start;
    paramGradientEnd = end;
    paramGradientDirection = direction;
}

void apply_gradient(vec4 start, vec4 end, float direction) {
    flagGradient = true;
    paramGradientStart = start.rgb;
    paramGradientStartA = start.a;
    paramGradientEnd = end.rgb;
    paramGradientEndA = end.a;
    paramGradientDirection = direction;
}

void apply_gradient(vec3 start, vec3 end) {
    apply_gradient(start, end, GRADIENT_DIRECTION);
}

void apply_gradient() {
    flagGradient = true;
}


void apply_dynamic_gradient(vec3 start, vec3 end, float direction, float speed) {
    flagDynamicGradient = true;
    paramDynGradientStart = start;
    paramDynGradientEnd = end;
    paramDynGradientDirection = direction;
    paramDynGradientSpeed = speed;
}

void apply_dynamic_gradient(vec4 start, vec4 end, float direction, float speed) {
    flagDynamicGradient = true;
    paramDynGradientStart = start.rgb;
    paramDynGradientStartA = start.a;
    paramDynGradientEnd = end.rgb;
    paramDynGradientEndA = end.a;
    paramDynGradientDirection = direction;
    paramDynGradientSpeed = speed;
}

void apply_dynamic_gradient(vec3 start, vec3 end, float direction) {
    apply_dynamic_gradient(start, end, direction, DYN_GRADIENT_SPEED);
}

void apply_dynamic_gradient(vec3 start, vec3 end) {
    apply_dynamic_gradient(start, end, DYN_GRADIENT_DIRECTION, DYN_GRADIENT_SPEED);
}

void apply_dynamic_gradient() {
    flagDynamicGradient = true;
}

void apply_lava(float speed) {
    apply_dynamic_gradient(rgb(255, 20, 0), rgb(255, 200, 0), 2.0, speed);
}

void apply_lava() {
    apply_lava(300.0);
}


void apply_aurora(vec4 c1, vec4 c2, vec4 c3, float speed) {
    flagAurora = true;
    paramAuroraColor1 = c1.rgb; paramAuroraColor1A = c1.a;
    paramAuroraColor2 = c2.rgb; paramAuroraColor2A = c2.a;
    paramAuroraColor3 = c3.rgb; paramAuroraColor3A = c3.a;
    paramAuroraSpeed = speed;
}

void apply_aurora(vec3 c1, vec3 c2, vec3 c3, float speed) {
    flagAurora = true;
    paramAuroraColor1 = c1;
    paramAuroraColor2 = c2;
    paramAuroraColor3 = c3;
    paramAuroraSpeed = speed;
}

void apply_aurora(float speed) {
    flagAurora = true;
    paramAuroraSpeed = speed;
}

void apply_aurora() {
    flagAurora = true;
}


void apply_split(float intensity, float speed) {
    flagSplit = true;
    paramSplitIntensity = intensity;
    paramSplitSpeed = speed;
}

void apply_split(float intensity) {
    flagSplit = true;
    paramSplitIntensity = intensity;
}

void apply_split() {
    flagSplit = true;
}


void apply_outline(vec4 color, float thickness) {
    flagOutline = true;
    paramOutlineColor = color;
    paramOutlineThickness = thickness;
}

void apply_outline(vec3 color, float thickness) {
    flagOutline = true;
    paramOutlineColor = vec4(color, 1.0);
    paramOutlineThickness = thickness;
}

void apply_outline(vec3 color) {
    flagOutline = true;
    paramOutlineColor = vec4(color, 1.0);
}

void apply_outline() {
    flagOutline = true;
}


void apply_hatch(vec4 color, float speed, float density) {
    flagHatch = true;
    paramHatchColor = color;
    paramHatchSpeed = speed;
    paramHatchDensity = density;
}

void apply_hatch(vec3 color, float speed, float density) {
    flagHatch = true;
    paramHatchColor = vec4(color, 1.0);
    paramHatchSpeed = speed;
    paramHatchDensity = density;
}

void apply_hatch(float speed) {
    flagHatch = true;
    paramHatchSpeed = speed;
}

void apply_hatch() {
    flagHatch = true;
}


void apply_neon(vec4 color, float intensity, float speed) {
    flagNeon = true;
    paramNeonColor = color;
    paramNeonIntensity = intensity;
    paramNeonSpeed = speed;
}

void apply_neon(vec3 color, float intensity) {
    flagNeon = true;
    paramNeonColor = vec4(color, 1.0);
    paramNeonIntensity = intensity;
}

void apply_neon(vec3 color) {
    flagNeon = true;
    paramNeonColor = vec4(color, 1.0);
}

void apply_neon() {
    flagNeon = true;
}


void apply_chromatic() {
    flagChromatic = true;
}

void apply_chromatic(float intensity) {
    flagChromatic = true;
    paramChromaticIntensity = intensity;
}

void apply_chromatic(float intensity, float speed) {
    flagChromatic = true;
    paramChromaticIntensity = intensity;
    paramChromaticSpeed = speed;
}


void apply_extrude() {
    flagExtrude = true;
    paramExtrudeUseColor = 0.0;
}

void apply_extrude(float depth) {
    flagExtrude = true;
    paramExtrudeDepth = depth;
    paramExtrudeUseColor = 0.0;
}

void apply_extrude(float depth, float layers) {
    flagExtrude = true;
    paramExtrudeDepth = depth;
    paramExtrudeLayers = layers;
    paramExtrudeUseColor = 0.0;
}

void apply_extrude(float depth, float layers, vec3 endColor) {
    flagExtrude = true;
    paramExtrudeDepth = depth;
    paramExtrudeLayers = layers;
    paramExtrudeColor = vec4(endColor, 1.0);
    paramExtrudeUseColor = 1.0;
}

void apply_extrude(float depth, float layers, vec4 endColor) {
    flagExtrude = true;
    paramExtrudeDepth = depth;
    paramExtrudeLayers = layers;
    paramExtrudeColor = endColor;
    paramExtrudeUseColor = 1.0;
}

void apply_extrude(float depth, float layers, vec3 c1, vec3 c2, vec3 c3) {
    flagExtrude = true;
    paramExtrudeDepth = depth;
    paramExtrudeLayers = layers;
    paramExtrudeColor  = vec4(c1, 1.0);
    paramExtrudeColor2 = vec4(c2, 1.0);
    paramExtrudeColor3 = vec4(c3, 1.0);
    paramExtrudeUseColor = 2.0;
}

void apply_extrude(float depth, float layers, vec4 c1, vec4 c2, vec4 c3) {
    flagExtrude = true;
    paramExtrudeDepth = depth;
    paramExtrudeLayers = layers;
    paramExtrudeColor  = c1;
    paramExtrudeColor2 = c2;
    paramExtrudeColor3 = c3;
    paramExtrudeUseColor = 2.0;
}


void apply_noise() {
    flagNoise = true;
}

void apply_noise(float intensity) {
    flagNoise = true;
    paramNoiseIntensity = intensity;
}

void apply_noise(float intensity, float speed) {
    flagNoise = true;
    paramNoiseIntensity = intensity;
    paramNoiseSpeed = speed;
}


void apply_liquid() {
    flagLiquid = true;
}

void apply_liquid(float intensity) {
    flagLiquid = true;
    paramLiquidIntensity = intensity;
}

void apply_liquid(float intensity, float speed) {
    flagLiquid = true;
    paramLiquidIntensity = intensity;
    paramLiquidSpeed = speed;
}


void apply_water() {
    flagWater = true;
}
void apply_water(vec3 color) {
    flagWater = true;
    paramWaterColor = vec4(color, 1.0);
}
void apply_water(vec4 color) {
    flagWater = true;
    paramWaterColor = color;
}
void apply_water(vec3 color, float level) {
    flagWater = true;
    paramWaterColor = vec4(color, 1.0);
    paramWaterLevel = level;
}
void apply_water(vec3 color, float level, float amplitude, float speed) {
    flagWater = true;
    paramWaterColor = vec4(color, 1.0);
    paramWaterLevel = level;
    paramWaterAmplitude = amplitude;
    paramWaterSpeed = speed;
}
void apply_water(vec4 color, float level, float amplitude, float speed) {
    flagWater = true;
    paramWaterColor = color;
    paramWaterLevel = level;
    paramWaterAmplitude = amplitude;
    paramWaterSpeed = speed;
}
void apply_water(vec3 color, float level, float amplitude, float speed, float frequency) {
    flagWater = true;
    paramWaterColor = vec4(color, 1.0);
    paramWaterLevel = level;
    paramWaterAmplitude = amplitude;
    paramWaterSpeed = speed;
    paramWaterFrequency = frequency;
}

void apply_bob() {
    flagBob = true;
}

void apply_bob(float speed) {
    flagBob = true;
    paramBobSpeed = speed;
}

void apply_bob(float speed, float amplitude) {
    flagBob = true;
    paramBobSpeed = speed;
    paramBobAmplitude = amplitude;
}

void apply_sway() {
    flagSway = true;
}

void apply_sway(float speed) {
    flagSway = true;
    paramSwaySpeed = speed;
}

void apply_sway(float speed, float amplitude) {
    flagSway = true;
    paramSwaySpeed = speed;
    paramSwayAmplitude = amplitude;
}

void apply_zigzag() {
    flagZigzag = true;
}

void apply_zigzag(float speed) {
    flagZigzag = true;
    paramZigzagSpeed = speed;
}

void apply_zigzag(float speed, float amplitude) {
    flagZigzag = true;
    paramZigzagSpeed = speed;
    paramZigzagAmplitude = amplitude;
}

void apply_wobble() {
    flagWobble = true;
}

void apply_wobble(float speed) {
    flagWobble = true;
    paramWobbleSpeed = speed;
}

void apply_wobble(float speed, float amplitude) {
    flagWobble = true;
    paramWobbleSpeed = speed;
    paramWobbleAmplitude = amplitude;
}

void apply_fall() {
    flagFall = true;
}

void apply_fall(float speed) {
    flagFall = true;
    paramFallSpeed = speed;
}

void apply_rise() {
    flagRise = true;
}

void apply_rise(float speed) {
    flagRise = true;
    paramRiseSpeed = speed;
}

void apply_orbit() {
    flagOrbit = true;
}

void apply_orbit(float speed) {
    flagOrbit = true;
    paramOrbitSpeed = speed;
}

void apply_orbit(float speed, float radius) {
    flagOrbit = true;
    paramOrbitSpeed = speed;
    paramOrbitRadius = radius;
}

void apply_drift() {
    flagDrift = true;
}

void apply_drift(float speed) {
    flagDrift = true;
    paramDriftSpeed = speed;
}

void apply_typewriter() {
    flagTypewriter = true;
}

void apply_typewriter(float speed) {
    flagTypewriter = true;
    paramTypewriterSpeed = speed;
}

void apply_erase() {
    flagErase = true;
}

void apply_erase(float speed) {
    flagErase = true;
    paramEraseSpeed = speed;
}

void apply_heartbeat() {
    flagHeartbeat = true;
}

void apply_heartbeat(float speed) {
    flagHeartbeat = true;
    paramHeartbeatSpeed = speed;
}

void apply_heartbeat(float speed, float size) {
    flagHeartbeat = true;
    paramHeartbeatSpeed = speed;
    paramHeartbeatSize = size;
}

void apply_flicker() {
    flagFlicker = true;
}

void apply_flicker(float speed) {
    flagFlicker = true;
    paramFlickerSpeed = speed;
}

void apply_flicker(float speed, float intensity) {
    flagFlicker = true;
    paramFlickerSpeed = speed;
    paramFlickerIntensity = intensity;
}

void apply_breathe() {
    flagBreathe = true;
}

void apply_breathe(float speed) {
    flagBreathe = true;
    paramBreatheSpeed = speed;
}

void apply_blask() {
    flagBlask = true;
}

void apply_blask(float intensity, float speed, float width) {
    flagBlask = true;
    paramBlaskIntensity = intensity;
    paramBlaskSpeed = speed;
    paramBlaskWidth = width;
}

void apply_blask(float intensity) {
    flagBlask = true;
    paramBlaskIntensity = intensity;
}

void apply_iskry() {
    flagIskry = true;
}

void apply_iskry(float intensity, float speed, float density) {
    flagIskry = true;
    paramIskryIntensity = intensity;
    paramIskrySpeed = speed;
    paramIskryDensity = density;
}

void apply_iskry(float intensity) {
    flagIskry = true;
    paramIskryIntensity = intensity;
}

void apply_plomien() {
    flagPlomien = true;
}

void apply_plomien(float speed) {
    flagPlomien = true;
    paramPlomienSpeed = speed;
}

void apply_plomien(float intensity, float speed) {
    flagPlomien = true;
    paramPlomienIntensity = intensity;
    paramPlomienSpeed = speed;
}

void apply_popcorn() {
    flagPopcorn = true;
}

void apply_popcorn(float speed) {
    flagPopcorn = true;
    paramPopcornSpeed = speed;
}

void apply_popcorn(float speed, float size) {
    flagPopcorn = true;
    paramPopcornSpeed = speed;
    paramPopcornSize = size;
}

void apply_eksplozja() {
    flagEksplozja = true;
}

void apply_eksplozja(float speed) {
    flagEksplozja = true;
    paramEksplozjaSpeed = speed;
}

void apply_eksplozja(float speed, float radius) {
    flagEksplozja = true;
    paramEksplozjaSpeed = speed;
    paramEksplozjaRadius = radius;
}

void apply_winda() {
    flagWinda = true;
}

void apply_winda(float speed) {
    flagWinda = true;
    paramWindaSpeed = speed;
}

void apply_deszcz() {
    flagDeszcz = true;
}

void apply_deszcz(float speed) {
    flagDeszcz = true;
    paramDeszczSpeed = speed;
}

void apply_mrugacz() {
    flagMrugacz = true;
}

void apply_mrugacz(float speed) {
    flagMrugacz = true;
    paramMrugaczSpeed = speed;
}

void apply_skoczki() {
    flagSkoczki = true;
}

void apply_skoczki(float speed) {
    flagSkoczki = true;
    paramSkoczkiSpeed = speed;
}

void apply_skoczki(float speed, float amplitude) {
    flagSkoczki = true;
    paramSkoczkiSpeed = speed;
    paramSkoczkiAmplitude = amplitude;
}

void apply_laser() {
    flagLaser = true;
}

void apply_laser(float speed) {
    flagLaser = true;
    paramLaserSpeed = speed;
}

void apply_laser(float speed, float width) {
    flagLaser = true;
    paramLaserSpeed = speed;
    paramLaserWidth = width;
}

void apply_holo() {
    flagHolo = true;
}

void apply_holo(float speed) {
    flagHolo = true;
    paramHoloSpeed = speed;
}

void apply_holo(float speed, float lines) {
    flagHolo = true;
    paramHoloSpeed = speed;
    paramHoloLines = lines;
}

void apply_glitch_hard() {
    flagGlitchHard = true;
}

void apply_glitch_hard(float speed) {
    flagGlitchHard = true;
    paramGlitchHardSpeed = speed;
}

void apply_glitch_hard(float speed, float strength) {
    flagGlitchHard = true;
    paramGlitchHardSpeed = speed;
    paramGlitchHardStrength = strength;
}

void apply_matrix() {
    flagMatrix = true;
}

void apply_matrix(float speed) {
    flagMatrix = true;
    paramMatrixSpeed = speed;
}

void apply_matrix(float speed, float cols) {
    flagMatrix = true;
    paramMatrixSpeed = speed;
    paramMatrixCols = cols;
}

void apply_caustics() {
    flagCaustics = true;
}

void apply_caustics(float speed) {
    flagCaustics = true;
    paramCausticsSpeed = speed;
}

void apply_caustics(float speed, float scale) {
    flagCaustics = true;
    paramCausticsSpeed = speed;
    paramCausticsScale = scale;
}

void apply_warp() {
    flagWarp = true;
}

void apply_warp(float speed) {
    flagWarp = true;
    paramWarpSpeed = speed;
}

void apply_warp(float speed, float strength) {
    flagWarp = true;
    paramWarpSpeed = speed;
    paramWarpStrength = strength;
}

void apply_krysztal() {
    flagKrysztal = true;
}

void apply_krysztal(float speed) {
    flagKrysztal = true;
    paramKrysztalSpeed = speed;
}

void apply_krysztal(float speed, float cells) {
    flagKrysztal = true;
    paramKrysztalSpeed = speed;
    paramKrysztalCells = cells;
}

void apply_portal() {
    flagPortal = true;
}

void apply_portal(float speed) {
    flagPortal = true;
    paramPortalSpeed = speed;
}

void apply_portal(float speed, float swirls) {
    flagPortal = true;
    paramPortalSpeed = speed;
    paramPortalSwirls = swirls;
}

void apply_xray() {
    flagXray = true;
}

void apply_xray(float speed) {
    flagXray = true;
    paramXraySpeed = speed;
}

void apply_xray(float speed, float width) {
    flagXray = true;
    paramXraySpeed = speed;
    paramXrayWidth = width;
}

void apply_termowizja() {
    flagTermowizja = true;
}

void apply_termowizja(float speed) {
    flagTermowizja = true;
    paramTermowizjaSpeed = speed;
}

void apply_termowizja(float speed, float contrast) {
    flagTermowizja = true;
    paramTermowizjaSpeed = speed;
    paramTermowizjaContrast = contrast;
}

void apply_tornado() {
    flagTornado = true;
}

void apply_tornado(float speed) {
    flagTornado = true;
    paramTornadoSize = speed;
}

void apply_tornado(float speed, float Size) {
    flagTornado = true;
    paramTornadoSize = speed;
    paramTornadoSize = Size;
}

void apply_wahadlo() {
    flagWahadlo = true;
}

void apply_wahadlo(float speed) {
    flagWahadlo = true;
    paramWahadloSize = speed;
}

void apply_wahadlo(float speed, float Size) {
    flagWahadlo = true;
    paramWahadloSize = speed;
    paramWahadloSize = Size;
}

void apply_wibracja() {
    flagWibracja = true;
}

void apply_wibracja(float speed) {
    flagWibracja = true;
    paramWibracjaSize = speed;
}

void apply_wibracja(float speed, float Size) {
    flagWibracja = true;
    paramWibracjaSize = speed;
    paramWibracjaSize = Size;
}

void apply_przegon() {
    flagPrzegon = true;
}

void apply_przegon(float speed) {
    flagPrzegon = true;
    paramPrzegonSize = speed;
}

void apply_przegon(float speed, float Size) {
    flagPrzegon = true;
    paramPrzegonSize = speed;
    paramPrzegonSize = Size;
}

void apply_bumper() {
    flagBumper = true;
}

void apply_bumper(float speed) {
    flagBumper = true;
    paramBumperSize = speed;
}

void apply_bumper(float speed, float Size) {
    flagBumper = true;
    paramBumperSize = speed;
    paramBumperSize = Size;
}

void apply_harmonijka() {
    flagHarmonijka = true;
}

void apply_harmonijka(float speed) {
    flagHarmonijka = true;
    paramHarmonijkaSize = speed;
}

void apply_harmonijka(float speed, float Size) {
    flagHarmonijka = true;
    paramHarmonijkaSize = speed;
    paramHarmonijkaSize = Size;
}

void apply_neon_puls() {
    flagNeonPuls = true;
}

void apply_neon_puls(float sPEED) {
    flagNeonPuls = true;
    paramNeonPulsSPEED = sPEED;
}

void apply_neon_puls(float sPEED, float gLOW) {
    flagNeonPuls = true;
    paramNeonPulsSPEED = sPEED;
    paramNeonPulsGLOW = gLOW;
}

void apply_szklo() {
    flagSzklo = true;
}

void apply_szklo(float sPEED) {
    flagSzklo = true;
    paramSzkloSPEED = sPEED;
}

void apply_szklo(float sPEED, float wIDTH) {
    flagSzklo = true;
    paramSzkloSPEED = sPEED;
    paramSzkloWIDTH = wIDTH;
}

void apply_zloty_blask() {
    flagZlotyBlask = true;
}

void apply_zloty_blask(float sPEED) {
    flagZlotyBlask = true;
    paramZlotyBlaskSPEED = sPEED;
}

void apply_zloty_blask(float sPEED, float wIDTH) {
    flagZlotyBlask = true;
    paramZlotyBlaskSPEED = sPEED;
    paramZlotyBlaskWIDTH = wIDTH;
}

void apply_diamet() {
    flagDiamet = true;
}

void apply_diamet(float sPEED) {
    flagDiamet = true;
    paramDiametSPEED = sPEED;
}

void apply_diamet(float sPEED, float dENSITY) {
    flagDiamet = true;
    paramDiametSPEED = sPEED;
    paramDiametDENSITY = dENSITY;
}

void apply_krew() {
    flagKrew = true;
}

void apply_krew(float sPEED) {
    flagKrew = true;
    paramKrewSPEED = sPEED;
}

void apply_krew(float sPEED, float cOLS) {
    flagKrew = true;
    paramKrewSPEED = sPEED;
    paramKrewCOLS = cOLS;
}

void apply_pianka() {
    flagPianka = true;
}

void apply_pianka(float sPEED) {
    flagPianka = true;
    paramPiankaSPEED = sPEED;
}

void apply_pianka(float sPEED, float sIZE) {
    flagPianka = true;
    paramPiankaSPEED = sPEED;
    paramPiankaSIZE = sIZE;
}

void apply_dym() {
    flagDym = true;
}

void apply_dym(float sPEED) {
    flagDym = true;
    paramDymSPEED = sPEED;
}

void apply_dym(float sPEED, float dRIFT) {
    flagDym = true;
    paramDymSPEED = sPEED;
    paramDymDRIFT = dRIFT;
}

void apply_piorun() {
    flagPiorun = true;
}

void apply_piorun(float sPEED) {
    flagPiorun = true;
    paramPiorunSPEED = sPEED;
}

void apply_piorun(float sPEED, float pOWER) {
    flagPiorun = true;
    paramPiorunSPEED = sPEED;
    paramPiorunPOWER = pOWER;
}

void apply_radioaktywny() {
    flagRadioaktywny = true;
}

void apply_radioaktywny(float sPEED) {
    flagRadioaktywny = true;
    paramRadioaktywnySPEED = sPEED;
}

void apply_radioaktywny(float sPEED, float iNTENSITY) {
    flagRadioaktywny = true;
    paramRadioaktywnySPEED = sPEED;
    paramRadioaktywnyINTENSITY = iNTENSITY;
}

void apply_pulsar() {
    flagPulsar = true;
}

void apply_pulsar(float sPEED) {
    flagPulsar = true;
    paramPulsarSPEED = sPEED;
}

void apply_pulsar(float sPEED, float rINGS) {
    flagPulsar = true;
    paramPulsarSPEED = sPEED;
    paramPulsarRINGS = rINGS;
}

void apply_galaktyka() {
    flagGalaktyka = true;
}

void apply_galaktyka(float sPEED) {
    flagGalaktyka = true;
    paramGalaktykaSPEED = sPEED;
}

void apply_galaktyka(float sPEED, float sTARS) {
    flagGalaktyka = true;
    paramGalaktykaSPEED = sPEED;
    paramGalaktykaSTARS = sTARS;
}

void apply_tron() {
    flagTron = true;
}

void apply_tron(float sPEED) {
    flagTron = true;
    paramTronSPEED = sPEED;
}

void apply_tron(float sPEED, float gRID) {
    flagTron = true;
    paramTronSPEED = sPEED;
    paramTronGRID = gRID;
}

void apply_prizma() {
    flagPrizma = true;
}

void apply_prizma(float sPEED) {
    flagPrizma = true;
    paramPrizmaSPEED = sPEED;
}

void apply_prizma(float sPEED, float rOWS) {
    flagPrizma = true;
    paramPrizmaSPEED = sPEED;
    paramPrizmaROWS = rOWS;
}

void apply_cukierek() {
    flagCukierek = true;
}

void apply_cukierek(float sPEED) {
    flagCukierek = true;
    paramCukierekSPEED = sPEED;
}

void apply_cukierek(float sPEED, float wIDTH) {
    flagCukierek = true;
    paramCukierekSPEED = sPEED;
    paramCukierekWIDTH = wIDTH;
}

void apply_ocean() {
    flagOcean = true;
}

void apply_ocean(float sPEED) {
    flagOcean = true;
    paramOceanSPEED = sPEED;
}

void apply_ocean(float sPEED, float wAVES) {
    flagOcean = true;
    paramOceanSPEED = sPEED;
    paramOceanWAVES = wAVES;
}

void apply_czarna_dziura() {
    flagCzarnaDziura = true;
}

void apply_czarna_dziura(float sPEED) {
    flagCzarnaDziura = true;
    paramCzarnaDziuraSPEED = sPEED;
}

void apply_czarna_dziura(float sPEED, float sTRENGTH) {
    flagCzarnaDziura = true;
    paramCzarnaDziuraSPEED = sPEED;
    paramCzarnaDziuraSTRENGTH = sTRENGTH;
}

void apply_mrozy() {
    flagMrozy = true;
}

void apply_mrozy(float sPEED) {
    flagMrozy = true;
    paramMrozySPEED = sPEED;
}

void apply_mrozy(float sPEED, float cELLS) {
    flagMrozy = true;
    paramMrozySPEED = sPEED;
    paramMrozyCELLS = cELLS;
}

void apply_magma() {
    flagMagma = true;
}

void apply_magma(float sPEED) {
    flagMagma = true;
    paramMagmaSPEED = sPEED;
}

void apply_magma(float sPEED, float cRACKS) {
    flagMagma = true;
    paramMagmaSPEED = sPEED;
    paramMagmaCRACKS = cRACKS;
}

void apply_plasma() {
    flagPlasma = true;
}

void apply_plasma(float sPEED) {
    flagPlasma = true;
    paramPlasmaSPEED = sPEED;
}

void apply_plasma(float sPEED, float cONTRAST) {
    flagPlasma = true;
    paramPlasmaSPEED = sPEED;
    paramPlasmaCONTRAST = cONTRAST;
}

void apply_aureola() {
    flagAureola = true;
}

void apply_aureola(float sPEED) {
    flagAureola = true;
    paramAureolaSPEED = sPEED;
}

void apply_aureola(float sPEED, float iNTENSITY) {
    flagAureola = true;
    paramAureolaSPEED = sPEED;
    paramAureolaINTENSITY = iNTENSITY;
}

void apply_karuzela() {
    flagKaruzela = true;
}

void apply_karuzela(float speed) {
    flagKaruzela = true;
    paramKaruzelaSpeed = speed;
}

void apply_karuzela(float speed, float size) {
    flagKaruzela = true;
    paramKaruzelaSpeed = speed;
    paramKaruzelaSize = size;
}

void apply_spirala() {
    flagSpirala = true;
}

void apply_spirala(float speed) {
    flagSpirala = true;
    paramSpiralaSpeed = speed;
}

void apply_spirala(float speed, float size) {
    flagSpirala = true;
    paramSpiralaSpeed = speed;
    paramSpiralaSize = size;
}

void apply_pociag() {
    flagPociag = true;
}

void apply_pociag(float speed) {
    flagPociag = true;
    paramPociagSpeed = speed;
}

void apply_pociag(float speed, float size) {
    flagPociag = true;
    paramPociagSpeed = speed;
    paramPociagSize = size;
}

void apply_burza() {
    flagBurza = true;
}

void apply_burza(float speed) {
    flagBurza = true;
    paramBurzaSpeed = speed;
}

void apply_burza(float speed, float size) {
    flagBurza = true;
    paramBurzaSpeed = speed;
    paramBurzaSize = size;
}

void apply_titan() {
    flagTitan = true;
}

void apply_titan(float speed) {
    flagTitan = true;
    paramTitanSpeed = speed;
}

void apply_titan(float speed, float size) {
    flagTitan = true;
    paramTitanSpeed = speed;
    paramTitanSize = size;
}

void apply_metronom() {
    flagMetronom = true;
}

void apply_metronom(float speed) {
    flagMetronom = true;
    paramMetronomSpeed = speed;
}

void apply_metronom(float speed, float size) {
    flagMetronom = true;
    paramMetronomSpeed = speed;
    paramMetronomSize = size;
}

void apply_fala_3d() {
    flagFala3d = true;
}

void apply_fala_3d(float speed) {
    flagFala3d = true;
    paramFala3dSpeed = speed;
}

void apply_fala_3d(float speed, float size) {
    flagFala3d = true;
    paramFala3dSpeed = speed;
    paramFala3dSize = size;
}

void apply_piorka() {
    flagPiorka = true;
}

void apply_piorka(float speed) {
    flagPiorka = true;
    paramPiorkaSpeed = speed;
}

void apply_piorka(float speed, float size) {
    flagPiorka = true;
    paramPiorkaSpeed = speed;
    paramPiorkaSize = size;
}

void apply_blysk() {
    flagBlysk = true;
}

void apply_blysk(float sPEED) {
    flagBlysk = true;
    paramBlyskSPEED = sPEED;
}

void apply_blysk(float sPEED, float wIDTH) {
    flagBlysk = true;
    paramBlyskSPEED = sPEED;
    paramBlyskWIDTH = wIDTH;
}

void apply_smuga() {
    flagSmuga = true;
}

void apply_smuga(float sPEED) {
    flagSmuga = true;
    paramSmugaSPEED = sPEED;
}

void apply_smuga(float sPEED, float wIDTH) {
    flagSmuga = true;
    paramSmugaSPEED = sPEED;
    paramSmugaWIDTH = wIDTH;
}

void apply_iskrenice() {
    flagIskrenice = true;
}

void apply_iskrenice(float sPEED) {
    flagIskrenice = true;
    paramIskreniceSPEED = sPEED;
}

void apply_iskrenice(float sPEED, float dENSITY) {
    flagIskrenice = true;
    paramIskreniceSPEED = sPEED;
    paramIskreniceDENSITY = dENSITY;
}

void apply_tecafala() {
    flagTecfala = true;
}

void apply_tecafala(float sPEED) {
    flagTecfala = true;
    paramTecfalaSPEED = sPEED;
}

void apply_tecafala(float sPEED, float rOWS) {
    flagTecfala = true;
    paramTecfalaSPEED = sPEED;
    paramTecfalaROWS = rOWS;
}

void apply_serce() {
    flagSerce = true;
}

void apply_serce(float sPEED) {
    flagSerce = true;
    paramSerceSPEED = sPEED;
}

void apply_serce(float sPEED, float iNTENSITY) {
    flagSerce = true;
    paramSerceSPEED = sPEED;
    paramSerceINTENSITY = iNTENSITY;
}

void apply_kula() {
    flagKula = true;
}

void apply_kula(float sPEED) {
    flagKula = true;
    paramKulaSPEED = sPEED;
}

void apply_kula(float sPEED, float rADIUS) {
    flagKula = true;
    paramKulaSPEED = sPEED;
    paramKulaRADIUS = rADIUS;
}

void apply_luk() {
    flagLuk = true;
}

void apply_luk(float sPEED) {
    flagLuk = true;
    paramLukSPEED = sPEED;
}

void apply_luk(float sPEED, float aRCS) {
    flagLuk = true;
    paramLukSPEED = sPEED;
    paramLukARCS = aRCS;
}

void apply_mglawica() {
    flagMglawica = true;
}

void apply_mglawica(float sPEED) {
    flagMglawica = true;
    paramMglawicaSPEED = sPEED;
}

void apply_mglawica(float sPEED, float dRIFT) {
    flagMglawica = true;
    paramMglawicaSPEED = sPEED;
    paramMglawicaDRIFT = dRIFT;
}

void apply_snieg() {
    flagSnieg = true;
}

void apply_snieg(float sPEED) {
    flagSnieg = true;
    paramSniegSPEED = sPEED;
}

void apply_snieg(float sPEED, float fLAKES) {
    flagSnieg = true;
    paramSniegSPEED = sPEED;
    paramSniegFLAKES = fLAKES;
}

void apply_refleks() {
    flagRefleks = true;
}

void apply_refleks(float sPEED) {
    flagRefleks = true;
    paramRefleksSPEED = sPEED;
}

void apply_refleks(float sPEED, float pOWER) {
    flagRefleks = true;
    paramRefleksSPEED = sPEED;
    paramRefleksPOWER = pOWER;
}

void apply_kaskada() {
    flagKaskada = true;
}

void apply_kaskada(float sPEED) {
    flagKaskada = true;
    paramKaskadaSPEED = sPEED;
}

void apply_kaskada(float sPEED, float wIDTH) {
    flagKaskada = true;
    paramKaskadaSPEED = sPEED;
    paramKaskadaWIDTH = wIDTH;
}

void apply_neonfala() {
    flagNeonfala = true;
}

void apply_neonfala(float sPEED) {
    flagNeonfala = true;
    paramNeonfalaSPEED = sPEED;
}

void apply_neonfala(float sPEED, float hUE) {
    flagNeonfala = true;
    paramNeonfalaSPEED = sPEED;
    paramNeonfalaHUE = hUE;
}

void apply_perla() {
    flagPerla = true;
}

void apply_perla(float sPEED) {
    flagPerla = true;
    paramPerlaSPEED = sPEED;
}

void apply_perla(float sPEED, float iRI) {
    flagPerla = true;
    paramPerlaSPEED = sPEED;
    paramPerlaIRI = iRI;
}

void apply_zar() {
    flagZar = true;
}

void apply_zar(float sPEED) {
    flagZar = true;
    paramZarSPEED = sPEED;
}

void apply_zar(float sPEED, float eMBERS) {
    flagZar = true;
    paramZarSPEED = sPEED;
    paramZarEMBERS = eMBERS;
}

void apply_firerain() {
    flagFirerain = true;
}

void apply_firerain(float sPEED) {
    flagFirerain = true;
    paramFirerainSPEED = sPEED;
}

void apply_firerain(float sPEED, float dROPS) {
    flagFirerain = true;
    paramFirerainSPEED = sPEED;
    paramFirerainDROPS = dROPS;
}

void apply_kolumna() {
    flagKolumna = true;
}

void apply_kolumna(float sPEED) {
    flagKolumna = true;
    paramKolumnaSPEED = sPEED;
}

void apply_kolumna(float sPEED, float cOLUMNS) {
    flagKolumna = true;
    paramKolumnaSPEED = sPEED;
    paramKolumnaCOLUMNS = cOLUMNS;
}

void apply_laser2() {
    flagLaser2 = true;
}

void apply_laser2(float sPEED) {
    flagLaser2 = true;
    paramLaser2SPEED = sPEED;
}

void apply_laser2(float sPEED, float wIDTH) {
    flagLaser2 = true;
    paramLaser2SPEED = sPEED;
    paramLaser2WIDTH = wIDTH;
}

void apply_odlamki() {
    flagOdlamki = true;
}

void apply_odlamki(float sPEED) {
    flagOdlamki = true;
    paramOdlamkiSPEED = sPEED;
}

void apply_odlamki(float sPEED, float sHARDS) {
    flagOdlamki = true;
    paramOdlamkiSPEED = sPEED;
    paramOdlamkiSHARDS = sHARDS;
}

void apply_grzmot() {
    flagGrzmot = true;
}

void apply_grzmot(float sPEED) {
    flagGrzmot = true;
    paramGrzmotSPEED = sPEED;
}

void apply_grzmot(float sPEED, float pOWER) {
    flagGrzmot = true;
    paramGrzmotSPEED = sPEED;
    paramGrzmotPOWER = pOWER;
}

void apply_swiatlo() {
    flagSwiatlo = true;
}

void apply_swiatlo(float sPEED) {
    flagSwiatlo = true;
    paramSwiatloSPEED = sPEED;
}

void apply_swiatlo(float sPEED, float rADIUS) {
    flagSwiatlo = true;
    paramSwiatloSPEED = sPEED;
    paramSwiatloRADIUS = rADIUS;
}

void apply_obrys() {
    flagObrys = true;
}

void apply_obrys(float sPEED) {
    flagObrys = true;
    paramObrysSPEED = sPEED;
}

void apply_obrys(float sPEED, float iNTENSITY) {
    flagObrys = true;
    paramObrysSPEED = sPEED;
    paramObrysINTENSITY = iNTENSITY;
}

void apply_gwiazdy() {
    flagGwiazdy = true;
}

void apply_gwiazdy(float sPEED) {
    flagGwiazdy = true;
    paramGwiazdySPEED = sPEED;
}

void apply_gwiazdy(float sPEED, float sTARS) {
    flagGwiazdy = true;
    paramGwiazdySPEED = sPEED;
    paramGwiazdySTARS = sTARS;
}

void apply_elastyk() {
    flagElastyk = true;
}

void apply_elastyk(float speed) {
    flagElastyk = true;
    paramElastykSpeed = speed;
}

void apply_elastyk(float speed, float size) {
    flagElastyk = true;
    paramElastykSpeed = speed;
    paramElastykSize = size;
}

void apply_zel() {
    flagZel = true;
}

void apply_zel(float speed) {
    flagZel = true;
    paramZelSpeed = speed;
}

void apply_zel(float speed, float size) {
    flagZel = true;
    paramZelSpeed = speed;
    paramZelSize = size;
}

void apply_skok() {
    flagSkok = true;
}

void apply_skok(float speed) {
    flagSkok = true;
    paramSkokSpeed = speed;
}

void apply_skok(float speed, float size) {
    flagSkok = true;
    paramSkokSpeed = speed;
    paramSkokSize = size;
}

void apply_fala2() {
    flagFala2 = true;
}

void apply_fala2(float speed) {
    flagFala2 = true;
    paramFala2Speed = speed;
}

void apply_fala2(float speed, float size) {
    flagFala2 = true;
    paramFala2Speed = speed;
    paramFala2Size = size;
}

void apply_orbit2() {
    flagOrbit2 = true;
}

void apply_orbit2(float speed) {
    flagOrbit2 = true;
    paramOrbit2Speed = speed;
}

void apply_orbit2(float speed, float size) {
    flagOrbit2 = true;
    paramOrbit2Speed = speed;
    paramOrbit2Size = size;
}

void apply_grzmot_w() {
    flagGrzmotW = true;
}

void apply_grzmot_w(float speed) {
    flagGrzmotW = true;
    paramGrzmotWSpeed = speed;
}

void apply_grzmot_w(float speed, float size) {
    flagGrzmotW = true;
    paramGrzmotWSpeed = speed;
    paramGrzmotWSize = size;
}

void apply_tsunami() {
    flagTsunami = true;
}

void apply_tsunami(float speed) {
    flagTsunami = true;
    paramTsunamiSpeed = speed;
}

void apply_tsunami(float speed, float size) {
    flagTsunami = true;
    paramTsunamiSpeed = speed;
    paramTsunamiSize = size;
}

void apply_ekspres() {
    flagEkspres = true;
}

void apply_ekspres(float speed) {
    flagEkspres = true;
    paramEkspresSpeed = speed;
}

void apply_ekspres(float speed, float size) {
    flagEkspres = true;
    paramEkspresSpeed = speed;
    paramEkspresSize = size;
}

void apply_tectno() {
    flagTectno = true;
}

void apply_tectno(float speed) {
    flagTectno = true;
    paramTectnoSpeed = speed;
}

void apply_tectno(float speed, float size) {
    flagTectno = true;
    paramTectnoSpeed = speed;
    paramTectnoSize = size;
}
