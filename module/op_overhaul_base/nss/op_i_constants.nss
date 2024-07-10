//::///////////////////////////////////////////////
//:: Overhaul Include: Constants
//:: op_i_constants.nss
//:://////////////////////////////////////////////
/*
    Hand written constant values for 2das etc.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////


// Some default/invalid values
const int SPELL_ANY = -2; // Since GetEffectSpellId can return -1
const int SPELL_INVALID = -1;
const int EFFECT_TYPE_ALL = -1;

const int MAX_INT = 2147483647;
const float MAX_FLOAT = 9999999.0;

// iprp_onhitspell.2da
const int IP_CONST_ONHIT_CASTSPELL_ONHIT_BLACKSTAFF = 141;

// effecticons.2da
const int EFFECT_ICON_GENERIC_DECREASE          = 130;
const int EFFECT_ICON_GENERIC_INCREASE          = 131;
const int EFFECT_ICON_AREA_OF_EFFECT            = 132;
const int EFFECT_ICON_BALEFUL_POLYMORPH         = 133;
const int EFFECT_ICON_BIGBYS_HAND               = 134;
const int EFFECT_ICON_FORCE_WALK                = 135;
const int EFFECT_ICON_GHOST                     = 136;
const int EFFECT_ICON_GLOBE_OF_INVUNERABILITY   = 137;
const int EFFECT_ICON_SPELL_MANTLE              = 138;
const int EFFECT_ICON_KNOCKDOWN                 = 139;
const int EFFECT_ICON_MODIFY_ATTACKS_DECREASED  = 140;
const int EFFECT_ICON_MODIFY_ATTACKS_INCREASED  = 141;
const int EFFECT_ICON_SUMMON_MONSTER            = 142;
const int EFFECT_ICON_SUMMON_SWARM              = 143;
const int EFFECT_ICON_TURN_RESISTANCE_DECREASE  = 144;
const int EFFECT_ICON_TURN_RESISTANCE_INCREASE  = 145;
const int EFFECT_ICON_MISS_CHANCE               = 146;
const int EFFECT_ICON_ULTRAVISION               = 147;
const int EFFECT_ICON_ARCANE_SPELL_FAILURE_BAD  = 148;
const int EFFECT_ICON_ARCANE_SPELL_FAILURE_GOOD = 149;
const int EFFECT_ICON_BARD_SONG                 = 150;
const int EFFECT_ICON_CURSE_SONG                = 151;
const int EFFECT_ICON_BONUS_FEAT                = 152;

// visualeffects.2da
const int VFX_INVALID                       = -1;
const int VFX_DUR_LEAF                      = 132; // Wide leaf VFX used in SoU Heurodis final fight
const int VFX_FNF_CLOUD                     = 133; // Clouds going upwards (ie as if the ground was falling) in SoU Heurodis final fight when she dies, and Beholder appearing in Chapter 1 HotU
const int VFX_FNF_WIND                      = 134; // White lines randomly going directly upwards (ie if ground was falling) in SoU Heurodis final fight and some random bits of HotU like teleports
const int VFX_FNF_ROCKEXPLODE               = 135; // Used in Crumble spell as impact VFX (which looks odd), but SoU final fight uses it to have rocks going upwards slowly.
const int VFX_FNF_ROCKEXPLODE2              = 136; // Variant of VFX_IMP_ROCKEXPLODE with a big chunk of rock floating up.
const int VFX_FNF_ROCKSUP                   = 137; // "Digging out" apeparing kind of VFX, used in SoU for Stinger and Kobold ambushes
const int VFX_FNF_SPELL_FAIL_HEAD           = 292; // Spell failed to cast (when using hands up animations)
const int VFX_FNF_SPELL_FAIL_HAND           = 293; // Spell failed to cast (when using hands forwards animations)
const int VFX_IMP_HIGHLIGHT_FLASH_WHITE     = 294; // Instantly applied quick "Flash" (similar to holding TAB); was actually a game 1.0 VFX just no constant. HotU Geas being applied by Halaster uses this.
const int VFX_DUR_GHOSTLY_PULSE_QUICK       = 295; // Fast ghostly pulse
const int VFX_COM_BLOOD_REG_WIMP_YELLOW     = 296; // Combat blood "wimpy version" I think - used by the engine but we could use in scripts.
const int VFX_COM_BLOOD_LRG_WIMP_YELLOW     = 297;
const int VFX_COM_BLOOD_CRT_WIMP_YELLOW     = 298;
const int VFX_COM_BLOOD_REG_WIMP_GREEN      = 299;
const int VFX_COM_BLOOD_LRG_WIMP_GREEN      = 300;
const int VFX_COM_BLOOD_CRT_WIMP_GREEN      = 301;
const int VFX_IMP_DESTRUCTION_LOW           = 302; // Unused in scripts AFAIK, purple "pulling in" and different sound effect too
const int VFX_SCENE_WEIRD                   = 323;
const int VFX_EYES_BLUE_HUMAN_MALE          = 324;
const int VFX_EYES_BLUE_HUMAN_FEMALE        = 325;
const int VFX_EYES_BLUE_DWARF_MALE          = 326;
const int VFX_EYES_BLUE_DWARF_FEMALE        = 327;
const int VFX_EYES_BLUE_ELF_MALE            = 328;
const int VFX_EYES_BLUE_ELF_FEMALE          = 329;
const int VFX_EYES_BLUE_GNOME_MALE          = 330;
const int VFX_EYES_BLUE_GNOME_FEMALE        = 331;
const int VFX_EYES_BLUE_HALFLING_MALE       = 332;
const int VFX_EYES_BLUE_HALFLING_FEMALE     = 333;
const int VFX_EYES_BLUE_HALFORC_MALE        = 334;
const int VFX_EYES_BLUE_HALFORC_FEMALE      = 335;
const int VFX_EYES_BLUE_TROGLODYTE          = 336;
const int VFX_SCENE_EVARD                   = 346; // also DUR_TENTACLE
const int VFX_SCENE_TOWER                   = 347;
const int VFX_SCENE_TEMPLE                  = 348;
const int VFX_SCENE_LAVA                    = 349;
const int VFX_SCENE_LAVA2                   = 350;
const int VFX_FNF_SCREEN_SHAKE2             = 356;
const int VFX_IMP_MIRV_NORMAL_ARROW         = 357;
const int VFX_WELL                          = 358;
const int VFX_IMP_MIRV_NORMAL_DART          = 359;
const int VFX_SCENE_WATER                   = 401;
const int VFX_SCENE_GRASS                   = 402;
const int VFX_SCENE_FORMIAN1                = 404;
const int VFX_SCENE_FORMIAN2                = 405;
const int VFX_SCENE_PITTRAP                 = 406;
const int VFX_SCENE_ICE                     = 426;
const int VFX_SCENE_MFPILLAR                = 427;
const int VFX_SCENE_MFWATERFALL             = 428;
const int VFX_SCENE_MFGROUNDCOVER           = 429;
const int VFX_SCENE_MFGROUNDCOVER2          = 430;
const int VFX_SCENE_MF6                     = 431;
const int VFX_SCENE_MF7                     = 432;
const int VFX_SCENE_MF8                     = 433;
const int VFX_SCENE_MF9                     = 434;
const int VFX_SCENE_MF10                    = 435;
const int VFX_SCENE_MF11                    = 436;
const int VFX_SCENE_MF12                    = 437;
const int VFX_SCENE_MF13                    = 438;
const int VFX_SCENE_MF14                    = 439;
const int VFX_SCENE_MF15                    = 440;
const int VFX_SCENE_MF16                    = 441;
const int VFX_SCENE_ICE_CLEAR               = 442;
const int VFX_SCENE_EVIL_CASTLE_WALL        = 443;
const int VFX_BEAM_FLAME                    = 444;
const int VFX_DUR_PROT_ACIDSHIELD           = 448; // Acid Shield, ala MESTILS_ACID_SHEATH
const int VFX_SCENE_BUILDING                = 449;
const int VFX_SCENE_BURNED_RUBBLE           = 450;
const int VFX_SCENE_BURNING_HALF_HOUSE      = 451;
const int VFX_SCENE_RUINED_ARCH             = 452;
const int VFX_SCENE_SOLID_ARCH              = 453;
const int VFX_SCENE_BURNED_RUBBLE_2         = 454;
const int VFX_SCENE_MARKET_1                = 455;
const int VFX_SCENE_MARKET_2                = 456;
const int VFX_SCENE_GAZEBO                  = 457;
const int VFX_SCENE_WAGON                   = 458;
const int VFX_SCENE_SEWER_WATER             = 461;
const int VFX_CONJ_MIND                     = 466;
const int VFX_CONJ_FIRE                     = 467;
const int VFX_DUR_BARD_SONG_SILENT          = 468;
const int VFX_IMP_PULSE_BOMB                = 469;
const int VFX_IMP_SILENCE_NO_SOUND          = 470;
const int VFX_FNF_TELEPORT_IN               = 471;
const int VFX_FNF_TELEPORT_OUT              = 472;
const int VFX_DUR_CONECOLD_HEAD             = 490;
const int VFX_COM_BLOOD_CRT_RED_HEAD        = 491;
const int VFX_COM_BLOOD_CRT_GREEN_HEAD      = 492;
const int VFX_COM_BLOOD_CRT_YELLOW_HEAD     = 493;
const int VFX_FNF_DRAGBREATHGROUND          = 494;
const int VFX_SCENE_BLACK_TILE              = 506;
const int VFX_DUR_BARD_SONG_EVIL            = 507;
const int VFX_DUR_UNSUPPORTED_CAGE          = 508;
const int VFX_DUR_UNSUPPORTED_ANIMAL_CAGE   = 509;
const int VFX_DUR_UNSUPPORTED_FLAME_L       = 510;
const int VFX_SCENE_PRISON_FLOOR            = 511;
const int VFX_DUR_DLA_SHIELDMAP             = 619;
const int VFX_IMP_LANCESHATTER_A            = 620;
const int VFX_IMP_LANCESHATTER_B            = 621;
const int VFX_IMP_LANCESHATTER_C            = 622;
const int VFX_SCENE_TILT_RAIL_END           = 640;
const int VFX_SCENE_TILT_RAIL_END_SMALL     = 641;
const int VFX_SCENE_TILT_RAIL               = 642;
const int VFX_SCENE_TILT_RAIL_SMALL         = 643;
const int VFX_DUR_ARROW_WHITE_01            = 646;
const int VFX_DUR_ARROW_WHITE_02            = 647;
const int VFX_DUR_ARROW_WHITE_03            = 648;
const int VFX_DUR_ARROW_WHITE_04            = 649;
const int VFX_DUR_ARROW_WHITE_05            = 650;
const int VFX_DUR_ARROW_WHITE_06            = 651;
const int VFX_DUR_ARROW_WHITE_07            = 652;
const int VFX_DUR_ARROW_WHITE_08            = 653;
const int VFX_DUR_ARROW_BLACK_01            = 654;
const int VFX_DUR_ARROW_BLACK_02            = 655;
const int VFX_DUR_ARROW_BLACK_03            = 656;
const int VFX_DUR_ARROW_BLACK_04            = 657;
const int VFX_DUR_ARROW_BLACK_05            = 658;
const int VFX_DUR_ARROW_BLUE_01             = 659;
const int VFX_DUR_ARROW_BLUE_02             = 660;
const int VFX_DUR_ARROW_BLUE_03             = 661;
const int VFX_DUR_ARROW_BLUE_04             = 662;
const int VFX_DUR_ARROW_BLUE_05             = 663;
const int VFX_DUR_ARROW_RED_01              = 664;
const int VFX_DUR_ARROW_RED_02              = 665;
const int VFX_DUR_ARROW_RED_03              = 666;
const int VFX_DUR_ARROW_YELLOW_01           = 667;
const int VFX_DUR_ARROW_YELLOW_02           = 668;
const int VFX_DUR_ARROW_YELLOW_03           = 669;
const int SFX_IMP_LANCEHIT                  = 671;
const int SFX_IMP_JOUSTFALL                 = 672;
const int VFX_FNF_PIRANHA                   = 10000;
const int VFX_SILVEYES                      = 10001;
const int VFX_ICONGLOW                      = 10002;

// spells.2da
const int SPELL_GREATER_SHADOW_CONJURATION        = 71;
const int SPELL_SHADES                            = 158;
const int SPELL_SHADOW_CONJURATION                = 159;
const int SPELL_FEAT_BLINDING_SPEED               = 647;
const int SPELLABILITY_CURE_CRITICAL_WOUNDS_OTHER = 567;
const int SPELLABILITY_RESTOREATION_OTHER         = 568;
const int SPELLABILITY_SUMMON_BAATEZU             = 701;
const int SPELLABILITY_HARM_SELF                  = 759;

