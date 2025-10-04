//::///////////////////////////////////////////////
//:: Overhaul Include: Debug
//:: op_i_debug.nss
//:://////////////////////////////////////////////
/*
    Overhaul debug functions.

    To enable:
    Set DEBUG_LEVEL to one of the levels:

    NONE     No debug - if recompiled all debug is stripped
    ERROR    Errors only
    WARNING  Warnings and errors only
    INFO     All debug - every piece of information available

    Then recompile all scripts.

    Example code usage (compiler now folds if statements based on some basic
    constant folding):

    if (DEBUG_LEVEL >= ERROR) Debug("Error!", ERROR);
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

// Debug levels
const int NONE    = 0;  // No debug - if recompiled all debug is stripped
const int ERROR   = 1;  // Errors only
const int WARNING = 2;  // Warnings and errors only
const int INFO    = 3;  // All debug - every piece of information available

// Set to the types of debug you want as per above
const int DEBUG_LEVEL = INFO;

const string DEBUG_COLOUR_ERROR   = "<c\xFF\x01\x01>";  // bright red.
const string DEBUG_COLOUR_WARNING = "<c\xFF\x66\x01>";  // Orange
const string DEBUG_COLOUR_INFO    = "<c\xFF\xFF\xFF>";  // White
const string DEBUG_COLOUR_END     = "</c>";

// Print sDebug in various places depending on the nDebugLevel
void Debug(string sDebug, int nLogLevel = INFO);

// Debugs each nwscript visible effect on oObject
void DebugEffects(object oObject);

// Print sDebug in various places depending on the nDebugLevel
void Debug(string sDebug, int nLogLevel = INFO)
{
    if (nLogLevel <= DEBUG_LEVEL)
    {
        // TODO:
        // These are useful to have but cannot be added as default parameters:
        //   __FUNCTION__ - Function name
        //   __LINE__ - Line of the Debug statement call
        //   __DATE__ - Compile date
        //   __TIME__ - Compile time
        // We'd need to recode all the Debug() calls to use these, to do later!
        // Note __FILENAME__ isn't needed since GetScriptName works fine.
        sDebug = "[" + GetScriptName() + "] " + sDebug;

        WriteTimestampedLogEntry(sDebug);

        switch (nLogLevel)
        {
            case ERROR: sDebug = DEBUG_COLOUR_ERROR + sDebug + DEBUG_COLOUR_END;
            case WARNING: sDebug = DEBUG_COLOUR_WARNING + sDebug + DEBUG_COLOUR_END;
            case INFO: sDebug = DEBUG_COLOUR_INFO + sDebug + DEBUG_COLOUR_END;
        }

        SendMessageToPC(GetFirstPC(), sDebug);

        // SpeakString(sDebug);
    }
}

string GetReadableEffectType(int nType)
{
    switch (nType)
    {
        case EFFECT_TYPE_INVALIDEFFECT: return "INVALIDEFFECT"; break;
        case EFFECT_TYPE_DAMAGE_RESISTANCE: return "DAMAGE_RESISTANCE"; break;
        case EFFECT_TYPE_REGENERATE: return "REGENERATE"; break;
        case EFFECT_TYPE_DAMAGE_REDUCTION: return "DAMAGE_REDUCTION"; break;
        case EFFECT_TYPE_TEMPORARY_HITPOINTS: return "TEMPORARY_HITPOINTS"; break;
        case EFFECT_TYPE_ENTANGLE: return "ENTANGLE"; break;
        case EFFECT_TYPE_INVULNERABLE: return "INVULNERABLE"; break;
        case EFFECT_TYPE_DEAF: return "DEAF"; break;
        case EFFECT_TYPE_RESURRECTION: return "RESURRECTION"; break;
        case EFFECT_TYPE_IMMUNITY: return "IMMUNITY"; break;
        case EFFECT_TYPE_ENEMY_ATTACK_BONUS: return "ENEMY_ATTACK_BONUS"; break;
        case EFFECT_TYPE_ARCANE_SPELL_FAILURE: return "ARCANE_SPELL_FAILURE"; break;
        case EFFECT_TYPE_AREA_OF_EFFECT: return "AREA_OF_EFFECT"; break;
        case EFFECT_TYPE_BEAM: return "BEAM"; break;
        case EFFECT_TYPE_CHARMED: return "CHARMED"; break;
        case EFFECT_TYPE_CONFUSED: return "CONFUSED"; break;
        case EFFECT_TYPE_FRIGHTENED: return "FRIGHTENED"; break;
        case EFFECT_TYPE_DOMINATED: return "DOMINATED"; break;
        case EFFECT_TYPE_PARALYZE: return "PARALYZE"; break;
        case EFFECT_TYPE_DAZED: return "DAZED"; break;
        case EFFECT_TYPE_STUNNED: return "STUNNED"; break;
        case EFFECT_TYPE_SLEEP: return "SLEEP"; break;
        case EFFECT_TYPE_POISON: return "POISON"; break;
        case EFFECT_TYPE_DISEASE: return "DISEASE"; break;
        case EFFECT_TYPE_CURSE: return "CURSE"; break;
        case EFFECT_TYPE_SILENCE: return "SILENCE"; break;
        case EFFECT_TYPE_TURNED: return "TURNED"; break;
        case EFFECT_TYPE_HASTE: return "HASTE"; break;
        case EFFECT_TYPE_SLOW: return "SLOW"; break;
        case EFFECT_TYPE_ABILITY_INCREASE: return "ABILITY_INCREASE"; break;
        case EFFECT_TYPE_ABILITY_DECREASE: return "ABILITY_DECREASE"; break;
        case EFFECT_TYPE_ATTACK_INCREASE: return "ATTACK_INCREASE"; break;
        case EFFECT_TYPE_ATTACK_DECREASE: return "ATTACK_DECREASE"; break;
        case EFFECT_TYPE_DAMAGE_INCREASE: return "DAMAGE_INCREASE"; break;
        case EFFECT_TYPE_DAMAGE_DECREASE: return "DAMAGE_DECREASE"; break;
        case EFFECT_TYPE_DAMAGE_IMMUNITY_INCREASE: return "DAMAGE_IMMUNITY_INCREASE"; break;
        case EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE: return "DAMAGE_IMMUNITY_DECREASE"; break;
        case EFFECT_TYPE_AC_INCREASE: return "AC_INCREASE"; break;
        case EFFECT_TYPE_AC_DECREASE: return "AC_DECREASE"; break;
        case EFFECT_TYPE_MOVEMENT_SPEED_INCREASE: return "MOVEMENT_SPEED_INCREASE"; break;
        case EFFECT_TYPE_MOVEMENT_SPEED_DECREASE: return "MOVEMENT_SPEED_DECREASE"; break;
        case EFFECT_TYPE_SAVING_THROW_INCREASE: return "SAVING_THROW_INCREASE"; break;
        case EFFECT_TYPE_SAVING_THROW_DECREASE: return "SAVING_THROW_DECREASE"; break;
        case EFFECT_TYPE_SPELL_RESISTANCE_INCREASE: return "SPELL_RESISTANCE_INCREASE"; break;
        case EFFECT_TYPE_SPELL_RESISTANCE_DECREASE: return "SPELL_RESISTANCE_DECREASE"; break;
        case EFFECT_TYPE_SKILL_INCREASE: return "SKILL_INCREASE"; break;
        case EFFECT_TYPE_SKILL_DECREASE: return "SKILL_DECREASE"; break;
        case EFFECT_TYPE_INVISIBILITY: return "INVISIBILITY"; break;
        case EFFECT_TYPE_IMPROVEDINVISIBILITY: return "IMPROVEDINVISIBILITY"; break;
        case EFFECT_TYPE_DARKNESS: return "DARKNESS"; break;
        case EFFECT_TYPE_DISPELMAGICALL: return "DISPELMAGICALL"; break;
        case EFFECT_TYPE_ELEMENTALSHIELD: return "ELEMENTALSHIELD"; break;
        case EFFECT_TYPE_NEGATIVELEVEL: return "NEGATIVELEVEL"; break;
        case EFFECT_TYPE_POLYMORPH: return "POLYMORPH"; break;
        case EFFECT_TYPE_SANCTUARY: return "SANCTUARY"; break;
        case EFFECT_TYPE_TRUESEEING: return "TRUESEEING"; break;
        case EFFECT_TYPE_SEEINVISIBLE: return "SEEINVISIBLE"; break;
        case EFFECT_TYPE_TIMESTOP: return "TIMESTOP"; break;
        case EFFECT_TYPE_BLINDNESS: return "BLINDNESS"; break;
        case EFFECT_TYPE_SPELLLEVELABSORPTION: return "SPELLLEVELABSORPTION"; break;
        case EFFECT_TYPE_DISPELMAGICBEST: return "DISPELMAGICBEST"; break;
        case EFFECT_TYPE_ULTRAVISION: return "ULTRAVISION"; break;
        case EFFECT_TYPE_MISS_CHANCE: return "MISS_CHANCE"; break;
        case EFFECT_TYPE_CONCEALMENT: return "CONCEALMENT"; break;
        case EFFECT_TYPE_SPELL_IMMUNITY: return "SPELL_IMMUNITY"; break;
        case EFFECT_TYPE_VISUALEFFECT: return "VISUALEFFECT"; break;
        case EFFECT_TYPE_DISAPPEARAPPEAR: return "DISAPPEARAPPEAR"; break;
        case EFFECT_TYPE_SWARM: return "SWARM"; break;
        case EFFECT_TYPE_TURN_RESISTANCE_DECREASE: return "TURN_RESISTANCE_DECREASE"; break;
        case EFFECT_TYPE_TURN_RESISTANCE_INCREASE: return "TURN_RESISTANCE_INCREASE"; break;
        case EFFECT_TYPE_PETRIFY: return "PETRIFY"; break;
        case EFFECT_TYPE_CUTSCENE_PARALYZE: return "CUTSCENE_PARALYZE"; break;
        case EFFECT_TYPE_ETHEREAL: return "ETHEREAL"; break;
        case EFFECT_TYPE_SPELL_FAILURE: return "SPELL_FAILURE"; break;
        case EFFECT_TYPE_CUTSCENEGHOST: return "CUTSCENEGHOST"; break;
        case EFFECT_TYPE_CUTSCENEIMMOBILIZE: return "CUTSCENEIMMOBILIZE"; break;
        case EFFECT_TYPE_RUNSCRIPT: return "RUNSCRIPT"; break;
        case EFFECT_TYPE_ICON: return "ICON"; break;
        case EFFECT_TYPE_PACIFY: return "PACIFY"; break;
        case EFFECT_TYPE_BONUS_FEAT: return "BONUS_FEAT"; break;
        case EFFECT_TYPE_TIMESTOP_IMMUNITY: return "TIMESTOP_IMMUNITY"; break;
        case EFFECT_TYPE_FORCE_WALK: return "FORCE_WALK"; break;
        case EFFECT_TYPE_APPEAR: return "APPEAR"; break;
        case EFFECT_TYPE_CUTSCENE_DOMINATED: return "CUTSCENE_DOMINATED"; break;
        case EFFECT_TYPE_DAMAGE: return "DAMAGE"; break;
        case EFFECT_TYPE_DEATH: return "DEATH"; break;
        case EFFECT_TYPE_DISAPPEAR: return "DISAPPEAR"; break;
        case EFFECT_TYPE_HEAL: return "HEAL"; break;
        case EFFECT_TYPE_HITPOINTCHANGEWHENDYING: return "HITPOINTCHANGEWHENDYING"; break;
        case EFFECT_TYPE_KNOCKDOWN: return "KNOCKDOWN"; break;
        case EFFECT_TYPE_MODIFY_ATTACKS: return "MODIFY_ATTACKS"; break;
        case EFFECT_TYPE_SUMMON_CREATURE: return "SUMMON_CREATURE"; break;
        case EFFECT_TYPE_TAUNT: return "TAUNT"; break;
        case EFFECT_TYPE_WOUNDING: return "WOUNDING"; break;
    }
    return IntToString(nType);
}

string GetSubtypeName(int nSubtype)
{
    switch (nSubtype)
    {
        case 0: return "ENGINE"; break;
        case SUBTYPE_MAGICAL: return "MAGICAL"; break;
        case SUBTYPE_SUPERNATURAL: return "SUPERNATURAL"; break;
        case SUBTYPE_EXTRAORDINARY: return "EXTRAORDINARY"; break;
        case SUBTYPE_UNYIELDING: return "UNYIELDING"; break;
    }
    return "ERROR";
}

void DebugEffects(object oObject)
{
    int nCount;
    object oCreator;
    string sTag, sIntegersEtc;
    vector vVector;

    string sType = "Thing";
    switch (GetObjectType(oObject))
    {
        case OBJECT_TYPE_AREA_OF_EFFECT: sType = "Area of Effect"; break;
        case OBJECT_TYPE_CREATURE: sType = "Creature"; break;
        case OBJECT_TYPE_DOOR: sType = "Door"; break;
        case OBJECT_TYPE_ENCOUNTER: sType = "Encounter"; break;
        case OBJECT_TYPE_ITEM: sType = "Item"; break;
        case OBJECT_TYPE_PLACEABLE: sType = "Placeable"; break;
        case OBJECT_TYPE_STORE: sType = "Store"; break;
        case OBJECT_TYPE_TRIGGER: sType = "Trigger"; break;
        case OBJECT_TYPE_WAYPOINT: sType = "Waypoint"; break;
    }

    Debug("[DebugEffects] " + sType + " name: " + GetName(oObject) + " tag: [" + GetTag(oObject) + "] OID: [" + ObjectToString(oObject) + "]");

    // Report on all effects
    effect eEffect = GetFirstEffect(oObject);
    while (GetIsEffectValid(eEffect))
    {
        nCount++;

        string sDebug = "No. [" + IntToString(nCount) + "]" +
                        " Type [" + GetReadableEffectType(GetEffectType(eEffect, TRUE)) + "]" +
                        " Creator [" + GetName(GetEffectCreator(eEffect)) + "|" + ObjectToString(GetEffectCreator(eEffect)) + "]" +
                        " Subtype [" + GetSubtypeName(GetEffectSubType(eEffect)) + "]" +
                        " Duration Type [" + IntToString(GetEffectDurationType(eEffect)) + "]";

        if (GetEffectDurationType(eEffect) == DURATION_TYPE_TEMPORARY)
        {
            sDebug += " Duration [" + IntToString(GetEffectDuration(eEffect)) + "]" +
                      " Duration Remaining [" + IntToString(GetEffectDurationRemaining(eEffect)) + "]";
        }

        sDebug += " SpellId [" + IntToString(GetEffectSpellId(eEffect)) + "]" +
                  " CL [" + IntToString(GetEffectCasterLevel(eEffect)) + "]";

        if (GetEffectTag(eEffect) != "")
        {
            sDebug += " Tag [" + GetEffectTag(eEffect) + "]";
        }

        if (GetEffectInteger(eEffect, 0)) sDebug += " int0 [" + IntToString(GetEffectInteger(eEffect, 0)) + "]";
        if (GetEffectInteger(eEffect, 1)) sDebug += " int1 [" + IntToString(GetEffectInteger(eEffect, 1)) + "]";
        if (GetEffectInteger(eEffect, 2)) sDebug += " int2 [" + IntToString(GetEffectInteger(eEffect, 2)) + "]";
        if (GetEffectInteger(eEffect, 3)) sDebug += " int3 [" + IntToString(GetEffectInteger(eEffect, 3)) + "]";
        if (GetEffectInteger(eEffect, 4)) sDebug += " int4 [" + IntToString(GetEffectInteger(eEffect, 4)) + "]";
        if (GetEffectInteger(eEffect, 5)) sDebug += " int5 [" + IntToString(GetEffectInteger(eEffect, 5)) + "]";
        if (GetEffectInteger(eEffect, 6)) sDebug += " int6 [" + IntToString(GetEffectInteger(eEffect, 6)) + "]";
        if (GetEffectInteger(eEffect, 7)) sDebug += " int7 [" + IntToString(GetEffectInteger(eEffect, 7)) + "]";
        if (GetEffectInteger(eEffect, 8)) sDebug += " int8 [" + IntToString(GetEffectInteger(eEffect, 8)) + "]";
        if (GetEffectInteger(eEffect, 9)) sDebug += " int9 [" + IntToString(GetEffectInteger(eEffect, 9)) + "]";
        if (GetEffectInteger(eEffect, 10)) sDebug += " int10 [" + IntToString(GetEffectInteger(eEffect, 10)) + "]";
        if (GetEffectInteger(eEffect, 11)) sDebug += " int11 [" + IntToString(GetEffectInteger(eEffect, 11)) + "]";
        if (GetEffectInteger(eEffect, 12)) sDebug += " int12 [" + IntToString(GetEffectInteger(eEffect, 12)) + "]";
        if (GetEffectInteger(eEffect, 13)) sDebug += " int13 [" + IntToString(GetEffectInteger(eEffect, 13)) + "]";
        if (GetEffectInteger(eEffect, 14)) sDebug += " int14 [" + IntToString(GetEffectInteger(eEffect, 14)) + "]";
        if (GetEffectInteger(eEffect, 15)) sDebug += " int15 [" + IntToString(GetEffectInteger(eEffect, 15)) + "]";
        if (GetEffectInteger(eEffect, 16)) sDebug += " int16 [" + IntToString(GetEffectInteger(eEffect, 16)) + "]";

        if (ObjectToString(GetEffectObject(eEffect, 0)) != "") sDebug += " obj0 [" + GetName(GetEffectObject(eEffect, 0)) + "|" + ObjectToString(GetEffectObject(eEffect, 0)) + "]";
        if (GetIsObjectValid(GetEffectObject(eEffect, 1))) sDebug += " obj1 [" + GetName(GetEffectObject(eEffect, 1)) + "]";
        if (GetIsObjectValid(GetEffectObject(eEffect, 2))) sDebug += " obj2 [" + GetName(GetEffectObject(eEffect, 2)) + "]";
        if (GetIsObjectValid(GetEffectObject(eEffect, 3))) sDebug += " obj3 [" + GetName(GetEffectObject(eEffect, 3)) + "]";

        if (GetEffectFloat(eEffect, 0) != 0.0) sDebug += " flt0 [" + FloatToString(GetEffectFloat(eEffect, 0)) + "]";
        if (GetEffectFloat(eEffect, 1) != 0.0) sDebug += " flt1 [" + FloatToString(GetEffectFloat(eEffect, 1)) + "]";
        if (GetEffectFloat(eEffect, 2) != 0.0) sDebug += " flt2 [" + FloatToString(GetEffectFloat(eEffect, 2)) + "]";
        if (GetEffectFloat(eEffect, 3) != 0.0) sDebug += " flt3 [" + FloatToString(GetEffectFloat(eEffect, 3)) + "]";

        vector vVector = GetEffectVector(eEffect, 0);
        if (vVector.x != 0.0 || vVector.y != 0.0 || vVector.z != 0.0) sDebug += " vec0 [" + FloatToString(vVector.x) + "|" + FloatToString(vVector.y) + "|" + FloatToString(vVector.z) + "]";
        vVector = GetEffectVector(eEffect, 1);
        if (vVector.x != 0.0 || vVector.y != 0.0 || vVector.z != 0.0) sDebug += " vec1 [" + FloatToString(vVector.x) + "|" + FloatToString(vVector.y) + "|" + FloatToString(vVector.z) + "]";

        Debug(sDebug);

        eEffect = GetNextEffect(oObject);
    }
}
