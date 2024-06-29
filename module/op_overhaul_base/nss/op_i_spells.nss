//::///////////////////////////////////////////////
//:: Overhaul Include: Spells
//:: op_i_spells.nss
//:://////////////////////////////////////////////
/*
    Include file for Spells and Spell-like Abilities.

    Note on spells impersonating other spells, eg: Shadow Conjuration type spells:
    * You execute the spell script for say, Shadow Conjuration, this then uses ExecuteScript to call
      the real spell script, but set the parameter SPELL_ID to be what you want the script to use.
      The rest of the spells properties will use the GetSpellSaveDC etc. properly (ie it'll be illusion
      spell school of a higher level).
      Signal Event will use nSpellId which will be the original, meaning easier to work with AI and other
      things, and the effects will be generated as if from the original ID for easier checking and removal.

    The global variables for spells are:

    oCaster - The caller of the script by default
    oCastItem - The spell cast item, if any
    oTarget - The target if any
    lTarget - The target location (or location of oTarget if valid)
    nSpellId - The SPELL_* cast
    nSpellType - The SPELL_TYPE_* that nSpellId is
    nSpellSchool - The spell school of nSpellId, used in DoResistSpell and other locations
    nSpellSaveDC - the Spell Save DC (if a proper spell)
    nCasterLevel - the Caster Level
    nMetaMagic - Metamagic feat
    nCasterClass - Caster class
    nSpellLevel - Spell level
    bSpontaneous - Spontaneously cast or not
    bHostile - Hostile or not (set in spells.2da but some spells can be both!)
    bIllusionary - If a Shadow spell see op_s_shadow.nss (GetSpellTargetValid will do the will save)

    If these are altered later they are used in the ApplySpellEffectToObject() and
    ApplySpellEffectAtLocation() functions.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_debug"
#include "op_i_eosconstant"
#include "op_i_constants"
#include "op_i_feats"
#include "op_i_itemprops"
#include "op_i_runscript"
#include "utl_i_maths"
#include "utl_i_item"
#include "utl_i_strings"

// These are the games string refs for immunity feedback.
// Format <CUSTOM0> : Immune to XXXX.
// Using this in case SendFeedbackString() is added to the game.
const int STRREF_IMMUNITY_BLINDNESS             = 62467;  //<CUSTOM0> : Immune to Blindness.
const int STRREF_IMMUNITY_CHARM                 = 62470;  //<CUSTOM0> : Immune to Charm.
const int STRREF_IMMUNITY_CONFUSION             = 62465;  //<CUSTOM0> : Immune to Confusion.
const int STRREF_IMMUNITY_CRITICAL_HITS         = 62454;  //<CUSTOM0> : Immune to Critical Hits.
const int STRREF_IMMUNITY_CURSE                 = 62469;  //<CUSTOM0> : Immune to Curse.
const int STRREF_IMMUNITY_DAZE                  = 62464;  //<CUSTOM0> : Immune to Daze.
const int STRREF_IMMUNITY_DEAFNESS              = 62468;  //<CUSTOM0> : Immune to Deafness.
const int STRREF_IMMUNITY_DEATH_MAGIC           = 62455;  //<CUSTOM0> : Immune to Death Magic.
const int STRREF_IMMUNITY_DISEASE               = 62453;  //<CUSTOM0> : Immune to Disease.
const int STRREF_IMMUNITY_DOMINATE              = 62471;  //<CUSTOM0> : Immune to Dominate.
const int STRREF_IMMUNITY_ENTANGLE              = 62472;  //<CUSTOM0> : Immune to Entangle.
const int STRREF_IMMUNITY_FEAR                  = 62456;  //<CUSTOM0> : Immune to Fear.
const int STRREF_IMMUNITY_KNOCKDOWN             = 62457;  //<CUSTOM0> : Immune to Knockdown.
const int STRREF_IMMUNITY_MIND_AFFECTING_SPELLS = 62460;  //<CUSTOM0> : Immune to Mind Affecting Spells.
const int STRREF_IMMUNITY_NEGATIVE_LEVELS       = 62459;  //<CUSTOM0> : Immune to Negative Levels.
const int STRREF_IMMUNITY_PARALYSIS             = 62458;  //<CUSTOM0> : Immune to Paralysis.
const int STRREF_IMMUNITY_POISON                = 62461;  //<CUSTOM0> : Immune to Poison.
const int STRREF_IMMUNITY_SILENCE               = 62473;  //<CUSTOM0> : Immune to Silence.
const int STRREF_IMMUNITY_SLEEP                 = 62463;  //<CUSTOM0> : Immune to Sleep.
const int STRREF_IMMUNITY_SLOW                  = 62474;  //<CUSTOM0> : Immune to Slow.
const int STRREF_IMMUNITY_SNEAK_ATTACKS         = 62462;  //<CUSTOM0> : Immune to Sneak Attacks.
const int STRREF_IMMUNITY_STUN                  = 62466;  //<CUSTOM0> : Immune to Stun.

const int STRREF_SOMEONE = 8349;  // Someone

const int ROUNDS  = 0;
const int MINUTES = 1;
const int HOURS   = 2;

const int TOUCH_MELEE  = 0;
const int TOUCH_RANGED = 1;

// For GetSpellTargetValid similar to Bioware's
const int SPELL_TARGET_ANYTHING         = 0;  // Anything. Most useful for spells like Dispel Magic.
const int SPELL_TARGET_ALLALLIES        = 1;  // Allies only
const int SPELL_TARGET_STANDARDHOSTILE  = 2;  // Standard hostile - IE: Will hit allies in certain PvP
const int SPELL_TARGET_SELECTIVEHOSTILE = 3;  // Selective hostile - IE: Will not hit allies

const int SPELL_ANY = -2; // Since GetEffectSpellId can return -1
const int SPELL_INVALID = -1;
const int EFFECT_TYPE_ALL = -1;

// Missing saving throw type constant
const int SAVING_THROW_TYPE_PARALYSIS = 20;

const int SORT_METHOD_NONE      = 0; // Just doesn't bother sorting
const int SORT_METHOD_LOWEST_HP = 1;
const int SORT_METHOD_LOWEST_HD = 2;
const int SORT_METHOD_DISTANCE  = 3;

// GetScriptParam settings when a script is executed
const string SCRIPT_PARAMETER_SPELL_ID    = "SCRIPT_PARAMETER_SPELL_ID";     // Spell Id
const string SCRIPT_PARAMETER_ILLUSIONARY = "SCRIPT_PARAMETER_ILLUSIONARY";  // Boolean
const string SCRIPT_PARAMETER_ILLUSIONARY_STRENGTH = "SCRIPT_PARAMETER_ILLUSIONARY_STRENGTH"; // 20 = 20% strength

// Spell types (UserType column) stored in nSpellType
const int SPELL_TYPE_INVALID         = 0; // Invalid setting! Error!!!
const int SPELL_TYPE_SPELL           = 1; // Standard spell.
const int SPELL_TYPE_CREATURE_POWER  = 2; // Or "Spell ability". Uses HD for resist spell. Checks spell immunity.
const int SPELL_TYPE_FEAT            = 3; // No resist spell/absorption checks are valid. Checks spell immunity.
const int SPELL_TYPE_ITEM_POWER      = 4; // No resist spell/absorption checks are valid. Checks spell immunity.

// Extra shape types - more may come later for complex spells. Will include links to spells.2da
const int SHAPE_HSPHERE = 100;

// Debug the spell and variables
void DebugSpellVariables();

// Checks for if the spell hook needs to be executed and execute it and check the return value if so.
int DoSpellHook();

// Returns TRUE if this is a state script running since we can't test GetCurrentlyRunningEvent
int GetIsStateScript();

// Gets the item used to cast the spell. This only works in main spell scripts or run scripts not Area of Effects for now.
object GetSpellCastItemCalculated();

// This gets the caster, usually OBJECT_SELF, or if an AOE it's GetAreaOfEffectCreator().
object GetSpellCaster();

// This gets the spell ID but overrides it if we are calling a spell with ExecuteScript
int GetSpellIdCalculated();

// This gets the SPELL_TYPE_* the spell ID is classified as (UserType column)
int GetSpellType(int nSpellIdToCheck);

// This gets if nSpellId is hostile or not using spells.2da
// If left at -1 uses the global value
int GetSpellIsHostile(int nSpellIdToCheck);

// This calculates the spell save DC for the given spell adding in bonuses and penalties as required
// For a AOE it uses the stored DC.
int GetSpellSaveDCCalculated(object oCaster, int nSpellIdToCheck);

// This calculates the spell caster level for any additional bonuses due to feats or similar.
// For a AOE it uses the stored caster level.
int GetCasterLevelCalculated(object oCaster, int nSpellIdToCheck);

// Retrieves the metamagic used, in a spell script, AOE script or run script
int GetMetaMagicFeatCalculated();

// Retrieves the spell casting class, in a spell script or run script. AOEs won't store this yet.
int GetLastSpellCastClassCalculated();

// Retrieves the spell level (0 - 9), in a spell script or run script. AOEs won't store this yet.
int GetLastSpellLevelCalculated();

// Retrieves if the spell was spontaneously ccast, in a spell script or run script. AOEs won't store this yet.
int GetSpellCastSpontaneouslyCalculated();

// Will return the target of the spell. Some special cases are taken into account with Run Script and potions.
object GetSpellTargetObjectCalculated();

// Will return the location of oTarget if valid, else GetSpellTargetLocation.
location GetSpellTargetLocationCalculated(object oTarget);

// Perform a saving throw roll.
// Unlike MySavingThrow this will not "return failure in case of immunity" since, well, they're immune!
// Instead they'll be immune and we'll send appropriate feedback messages.
//   Returns: 0 if the saving throw roll failed
//   Returns: 1 if the saving throw roll succeeded
//   Returns: 2 if the target was immune to the save type specified
// Note: If used within an Area of Effect Object Script (On Enter, OnExit, OnHeartbeat), you MUST pass GetAreaOfEffectCreator() into oSaveVersus!
int DoSavingThrow(object oTarget, object oSaveVersus, int nSavingThrow, int nDC, int nSaveType = SAVING_THROW_TYPE_NONE, float fDelay = 0.0);

// Returns the modified amount of nDamage based on the saving throw being successful for half (or more if reflex save and feats are involved).
int DoDamageSavingThrow(int nDamage, object oTarget, object oSaveVersus, int nSavingThrow, int nDC, int nSaveType = SAVING_THROW_TYPE_NONE, float fDelay = 0.0);

// Used to route the resist magic checks into this function to check for spell countering by SR, Immunity, Globes or Mantles.
// Now a simple TRUE if spell resisted/immune/absorbed, or FALSE otherwise.
// Can now be called in a "non-true spell" so be careful and don't use in monster ability scripts.
int DoResistSpell(object oTarget, object oCaster, float fDelay = 0.0, int bResistCheck = TRUE, int bImmunityCheck = TRUE, int bAbsorbCheck = TRUE);

// Gets the assay resistance bonus to caster level for oCaster if it is affecting oTarget
int GetAssayResistanceBonus(object oTarget, object oCaster);

// Does a relevant touch attack. Some classes add bonuses to touch attacks, which can be added in here.
// - nType can be TOUCH_MELEE or TOUCH_RANGED
// Return values:
// * 0 - Miss
// * 1 - Hit
// * 2 - Critical Hit
int DoTouchAttack(object oTarget, object oVersus, int nType, int bDisplayFeedback = TRUE);

// Applies Dispel Magic to the given target (Area of Effects are also handled, as are Summoned Creatures)
void DoDispelMagic(object oTarget, int nCasterLevel, effect eVis, float fDelay, int bAll, int bBreach = FALSE);

// Performs a spell breach up to nTotal spell are removed and nSR spell resistance is lowered.
void DoSpellBreach(object oTarget, int nTotal, int nSR, int bVFX = TRUE);

// Gets if the spell script is illusionary (script param SCRIPT_PARAMETER_ILLUSIONARY set to "1")
int GetSpellIsIllusionary();

// Gets the illusionary strength of the current script call. Not relevant if not an
// illusion spell. 20 would be 20% strength if they save a will save.
int GetSpellIllusionaryStrength();

// Checks if oTarget failed the will save done in GetSpellTargetValid() when they
// were checked. Can affect GetDiceRoll/GetDuration.
int GetTargetIllusionarySave(object oTarget);

// Does (and stores) the Will saving throw for illusion saves.
void DoIllusionSavingThrow(object oTarget, object oCaster);

// Applies metamagic to the given dice roll
// eg GetDiceRoll(4, 6, 8) will roll 4d6 and add 8 to the final roll
// Metamagic is applied automatically (alter with the global nMetaMagic) alongside illusion changes
int GetDiceRoll(int nNumberOfDice, int nDiceSize, int nBonus = 0);

// Applies metamagic to the given duration
// * nType - The conversion used, ROUNDS (6 seconds), MINUTES ("1 turn" in old NWN = 1 minute/10 rounds) or HOURS (module dependant)
// Metamagic is applied automatically alongside illusion changes
float GetDuration(int nDuration, int nDurationType);

// Checks if the given target is valid to be targeted by oCaster
int GetSpellTargetValid(object oTarget, object oCaster, int nTargetType);

// Converts a SAVING_THROW_TYPE_* to an IMMUNITY_TYPE_* where these are checked for in the saving throw functions
// else it will be IMMUNITY_TYPE_NONE (0)
int GetImmunityTypeFromSavingThrowType(int nSaveType);

// Check and do immunity for the given immunity type.
// It also provides feedback to the given creatures if valid, and the game usually gives such feedback.
int GetIsImmuneWithFeedback(object oCreature, int nImmunityType, object oVersus = OBJECT_INVALID);

// Provide some feedback formatted to the games method of showing immunity feedback
// This doesn't cover every immunity type, only those the game usually feeds back on.
void SendImmunityFeedback(object oCaster, object oTarget, int nImmunityType);

// This allows the application of a random delay to effects based on time parameters passed in.
float GetRandomDelay(float fMinimumTime = 0.4, float MaximumTime = 1.1);

// This gets the delay for the given programmed VFX (progfx) MIRV else a default of target distance / 20
float GetVisualEffectHitDelay(int nVFX, object oTarget, object oSource);

// Rewrites the effect stack to use the given properties (default values don't override the current ones)
effect EffectChangeProperties(effect eEffect, int nSpellId = SPELL_INVALID, int nCasterLevel = 0, object oCreator = OBJECT_SELF);

// Applies the given effect but merges in the right spell Id, caster Id and caster level.
void ApplySpellEffectToObject(int nDurationType, effect eEffect, object oTarget, float fDuration = 0.0);

// Applies the given effect but merges in the right spell Id, caster Id and caster level.
void ApplySpellEffectAtLocation(int nDurationType, effect eEffect, location lTarget, float fDuration = 0.0);

// Applies the given item property to the given item.
// All existing item properties with a tag matching the spell ID are removed.
void ApplySpellItemPropertyToItem(int nDurationType, itemproperty ipProperty, object oItem, float fDuration = 0.0);

// Signals a spell cast event.
// By default if the default parameters are used then the global automatically
// generated values are used instead.
void SignalSpellCastAt(object oSignalTarget = OBJECT_INVALID, object oSignalCaster = OBJECT_INVALID, int bSignalHostile = -1, int nSignalSpellId = -1);

// Returns TRUE if we are OK running our AOE scripts.
// Does a check for the AOE creator, and destroys ourself with no effect if they no longer exist.
// This might be removed later but for now will stop some bugs.
int AOECheck();

// Sends fake damage messages as per the game format for oTarget and oSource
void FakeDamageMessage(object oTarget, object oSource, int nDamage, int nDamageType);

// Gets the scale of the VFX to apply to oCreature. If not a creature it returns 1.0.
float GetVFXScale(object oCreature);

// Gets the given spells name, returns "" on error.
string GetSpellName(int nSpellId);

// Gets the level the given spell is usually cast at, Eg Magic Missile is 1 for Wizards/Sorcerers
// If CLASS_TYPE_INVALID is used it gets the Innate level instead.
int GetSpellLevel(int nSpellId, int nClass = CLASS_TYPE_INVALID);

// Gets the spell school of the given spell ID. Of course those not assigned to a class
// spellbook is probably not a "real" spell school.
// Returns -1 on error.
int GetSpellSchool(int nSpellId);

// Returns TRUE if the spell has targeting defined in the column "TargetShape"
int GetSpellIsAreaOfEffect(int nSpellId);

// Returns a human readable name for the given effect (eg: "Fear" or "Negative Level").
string GetEffectName(effect eEffect);

// Returns TRUE if the given creature is incorporeal (generally based off their appearance).
int GetIsIncorporeal(object oCreature);

// Returns TRUE if the given creature is made of metal (eg Iron Golem) based off appearance.
int GetIsMetalCreature(object oCreature);

// Returns TRUE if the given creature is humanoid (base races plus goblins etc.)
int GetIsHumanoidCreature(object oCreature);

// Returns TRUE if the given creature is mindless (elemental, undead, vermin, construct, ooze)
int GetIsMindless(object oCreature);

// Gets if either domain matches the given domain on the given class
int GetClassHasDomain(object oCreature, int nClass, int nDomain);

// Returns TRUE if oObject has at least one effect matching the parameters.
// * nEffectType - Can be EFFECT_TYPE_ALL to be ignored
// * sTag - Only checked if not blank
int GetHasEffect(object oObject, int nEffectType, string sTag = "");

// Removes effects from the given spell ID. Returns TRUE if one was removed.
// * nSpellId - If SPELL_ANY it will remove any spell Id. -1 or SPELL_INVALID is "Invalid spell ID" so technically still a subset of effects.
// * sTag - If set the tag must match
// * nEffectType - If set the effect type must match
int RemoveEffectsFromSpell(object oObject, int nSpellId, int nEffectType = EFFECT_TYPE_ALL, string sTag = "");

// Finds the duration remaining of the given spell on oObject
float GetRemainingDurationOfSpell(object oObject, int nSpellId);

// Cures a JsonArray of integer effects with some caveats:
// - oTarget - Creature to cure
// - jArray - The array of EFFECT_TYPE_* integers to remove. Note:
//         EFFECT_TYPE_ABILITY_DECREASE - Only removes non-poison, non-disease based ones
//         EFFECT_TYPE_POISON / EFFECT_TYPE_DISEASE - Since these effects can eventually
//                     disappear but the ability score changes persist we sadly
//                     have to clear all ability scores from them generated by
//                     the engine
// - bSuperanturalRemoval - If FALSE it will not remove Supernatural effects.
void CureEffects(object oTarget, json jArray, int bSupernaturalRemoval = FALSE);

// Loops through relevant shape to get all the targets in it. It then sorts them using nSortMethod.
// * nTargetType - The SPELL_TARGET_* type to check versus oCaster
// * nSortMethod - The sorting method to apply once all the creatures are added.
//                 SORT_METHOD_NONE      - No sorting (slightly faster)
//                 SORT_METHOD_LOWEST_HP - Sorts so first object is the lowest HP
//                 SORT_METHOD_LOWEST_HD - Sorts so first object is the lowest HD
//                 SORT_METHOD_DISTANCE  - Sorts so the first object is the lowest distance
// The other variables can be set, but if not then the current Spell Id will sort the shape and size.
json GetArrayOfTargets(int nTargetType, int nSortMethod = SORT_METHOD_DISTANCE, int nObjectFilter=OBJECT_TYPE_CREATURE, int nShape = -1, float fSize = -1.0, location lArrayTarget=LOCATION_INVALID, int bLineOfSight=TRUE, vector vOrigin=[0.0,0.0,0.0]);

// Gets the given Object stored as FIELD_OBJECTID in jArray at nIndex
object GetArrayObject(json jArray, int nIndex);

// Returns a EffectRunScript that is automatically configured. Will NOT set an apply script since the given effect is invalid.
// The data field in the effect will be set with information that isn't set on the effect, and retrieved
// automatically, eg: nMetaMagic, nSpellSaveDC, nSpellLevel
// * sScript - If not set will use current script name + "rs" (eg: op_s_melfsacid -> op_s_melfsacidrs)
effect EffectRunScriptAutomatic(float fInterval = 6.0, string sScript = "");

// This tags the given effect with JSON_FIELD_* information and returns it
effect EffectTagWithMetadata(effect eEffect);

// Retrieves the effects save DC (need to be set with EffectTagWithMetadata)
// Returns 0 if not found
int GetEffectTaggedSpellSaveDC(effect eEffect);

// Retrieves the effects metamagic (need to be set with EffectTagWithMetadata)
// Returns 0 if not found
int GetEffectTaggedMetaMagic(effect eEffect);

// Retrieves the effects caster class (need to be set with EffectTagWithMetadata)
// Returns CLASS_TYPE_INVALID if not found
int GetEffectTaggedCasterClass(effect eEffect);

// Retrieves the effects spell level (need to be set with EffectTagWithMetadata)
// Returns -1 if not found
int GetEffectTaggedSpellLevel(effect eEffect);

// Retrieves the effects spontaneous casting state (need to be set with EffectTagWithMetadata)
// Returns 0 if not found
int GetEffectTaggedSpontaneous(effect eEffect);

// Returns the effect used to track item properties and removes them when this effect is removed
// Uses the spell ID of this effect to track this.
// * jOIDs - OIDs of the items to track
// Apply the item properties with ApplySpellItemPropertyToItem()
effect EffectTrackItemProperties(json jOIDs, int nSpellIdToTrack = SPELL_INVALID);

// Sets the tracking ID used in EffectTrackItemProperties(). This means only that one
// will be actioned (and any removed in the same script won't).
void SetItemTrackingID(effect eAppliedEffect, object oTarget = OBJECT_INVALID, int nSpellId = SPELL_INVALID);

// Returns TRUE if the given effect matches the stored tracking ID
int GetItemTrackingIDMatches(effect eRunScript, object oTrackingParent = OBJECT_SELF);

// Returns a garanteed invalid, and otherwise useless, effect.
effect EffectInvalidEffect();

// Gets an appropriate effect based on the target (PC or master is PC) and difficulty
// Works around some issues when some effects are buggy applied to PCs as well.
// Used for: Fear, Paralysis, Stun, Confusion, Charm, Dominate.
effect GetScaledEffect(effect eEffect, object oTarget);

// Gets difficulty based scaling of duration if the target is a PC. Has to be manually applied.
// Should be used for: Paralysis, Stun, Daze, Sleep, Charm, Domination (although the latter 2 get converted to Daze)
// * nDuratoinType - ROUNDS, MINUTES, HOURS
float GetScaledDuration(object oTarget, int nDuration, int nDurationType);

// Retrieves the SHAPE_* value from spells.2da. Returns -1 on error.
int GetSpellShape(int nSpellId);

// Retrieves the size value of a spells shape from spells.2da. Returns -1.0 on error.
// bX if TRUE uses TargetSizeX since for Cube and Spell Cylinders it's the X value that is relevant.
// If bX is false gets the TargetSizeY value
float GetSpellShapeSize(int nSpellId, int bX = TRUE);

// Checks if any creature of the given target type is present in the given AOE at lCheckTarget (if not set defaults to lTarget).
// CURRENTLY DOES NOT SUPPORT RETANGLES LIKE BLADE BARRIER OR WALL OF FIRE
int GetIsTargetInAOEAtLocation(int nAOE, int nTargetType = SPELL_TARGET_SELECTIVEHOSTILE, location lCheckTarget = LOCATION_INVALID);


// These global variables are used in most spell scripts and are initialised here to be consistent
// NB: You can't reuse these variables in the very functions in this list, so we pass them in.
object oCastItem = GetSpellCastItemCalculated();
object oCaster   = GetSpellCaster();
object oTarget   = GetSpellTargetObjectCalculated();
location lTarget = GetSpellTargetLocationCalculated(oTarget);
int nSpellId     = GetSpellIdCalculated();
int nSpellType   = GetSpellType(nSpellId);
int nSpellSchool = GetSpellSchool(nSpellId);
int nSpellSaveDC = GetSpellSaveDCCalculated(oCaster, nSpellId);
int nCasterLevel = GetCasterLevelCalculated(oCaster, nSpellId);
int nMetaMagic   = GetMetaMagicFeatCalculated();
int nCasterClass = GetLastSpellCastClassCalculated();
int nSpellLevel  = GetLastSpellLevelCalculated();
int bSpontaneous = GetSpellCastSpontaneouslyCalculated();
int bHostile     = GetSpellIsHostile(nSpellId);
int bIllusionary = GetSpellIsIllusionary();
int nIllusionaryStrength = GetSpellIllusionaryStrength();

// Debug the spell and variables
void DebugSpellVariables()
{
    if (DEBUG_LEVEL >= LOG_LEVEL_INFO)
    {
        OP_Debug("[Spell Script] Script:" + GetStringColoredRGB("[" + GetScriptName() +
                                          "] ID: [" + IntToString(nSpellId) +
                                          "] Name: [" + GetSpellName(nSpellId) +
                                          "] Type: [" + IntToString(nSpellType) +
                                          "] Level: [" + IntToString(nSpellLevel) +
                                          "] Caster: [" + GetName(oCaster) +
                                          "] Cast Item: [" + GetName(oCastItem) +
                                          "] Caster class: [" + IntToString(nCasterClass) +
                                          "] Spontanously cast: [" + IntToString(bSpontaneous) +
                                          "] Target: [" + GetName(oTarget) +
                                          "] Save DC: [" + IntToString(nSpellSaveDC) +
                                          "] Caster Level: [" + IntToString(nCasterLevel) +
                                          "] MetaMagic: [" + IntToString(nMetaMagic) +
                                          "] Hostile: [" + IntToString(bHostile) +
                                          "] bIllusionary: [" + IntToString(bIllusionary) +
                                          "] nIllusionaryStrength: [" + IntToString(nIllusionaryStrength) + "]", 255, 255, 255));
    }
}

// Checks for if the spell hook needs to be executed and execute it and check the return value if so.
int DoSpellHook()
{
    // Debug spell if logging enabled
    DebugSpellVariables();

    // Do not do the hook if this is an illusion spell
    if (bIllusionary) return FALSE;

    // TODO dummy spell hook for now
    return FALSE;
}

// Returns TRUE if this is a state script running since we can't test GetCurrentlyRunningEvent
int GetIsStateScript()
{
    // Test the scripts explicitly
    string sScriptName = GetScriptName();
    if (GetStringLeft(sScriptName, 6) == "op_ss_")
    {
        return TRUE;
    }
    return FALSE;
}

// Gets the item used to cast the spell. This only works in main spell scripts or run scripts not Area of Effects for now.
object GetSpellCastItemCalculated()
{
    if (GetIsStateScript()) return OBJECT_INVALID;

    if (GetObjectType(OBJECT_SELF) == OBJECT_TYPE_AREA_OF_EFFECT)
    {
        return OBJECT_INVALID;
    }

    if (GetLastRunScriptEffectScriptType() != 0)
    {
        if (!GetIsObjectValid(GetEffectCreator(GetLastRunScriptEffect())))
        {
            OP_Debug("[GetSpellCaster] Invalid caster for run script. Applied script?", LOG_LEVEL_ERROR);
        }
        return OBJECT_INVALID; // TODO
    }
    return GetSpellCastItem();
}


// This gets the caster, usually OBJECT_SELF, or if an AOE it's GetAreaOfEffectCreator().
object GetSpellCaster()
{
    if (GetIsStateScript()) return OBJECT_INVALID;

    if (GetObjectType(OBJECT_SELF) == OBJECT_TYPE_AREA_OF_EFFECT)
    {
        return GetAreaOfEffectCreator();
    }
    if (GetLastRunScriptEffectScriptType() != 0)
    {
        if (!GetIsObjectValid(GetEffectCreator(GetLastRunScriptEffect())))
        {
            OP_Debug("[GetSpellCaster] Invalid caster for run script. Applied script?", LOG_LEVEL_ERROR);
        }
        return GetEffectCreator(GetLastRunScriptEffect());
    }
    return OBJECT_SELF;
}

// This gets the spell ID but overrides it if we are calling a spell with ExecuteScript
int GetSpellIdCalculated()
{
    if (GetIsStateScript()) return SPELL_INVALID;

    string sParam = GetScriptParam(SCRIPT_PARAMETER_SPELL_ID);
    if (sParam != "")
    {
        return StringToInt(sParam);
    }

    // If it's a run script we retrieve it from the effect
    if (GetLastRunScriptEffectScriptType() != 0)
    {
        if (!GetIsEffectValid(GetLastRunScriptEffect()))
        {
            OP_Debug("[GetSpellIdCalculated] Invalid effect for run script. Applied script?", LOG_LEVEL_ERROR);
        }

        return GetEffectSpellId(GetLastRunScriptEffect());
    }

    // Else it's a spell script or AOE script
    return GetSpellId();
}

// This gets the SPELL_TYPE_* the spell ID is classified as (UserType column)
int GetSpellType(int nSpellIdToCheck)
{
    if (GetIsStateScript()) return SPELL_TYPE_INVALID;

    string sUserType = Get2DAString("spells", "UserType", nSpellIdToCheck);
    switch (HashString(sUserType))
    {
        case "1": return SPELL_TYPE_SPELL; break;
        case "2": return SPELL_TYPE_CREATURE_POWER; break;
        case "3": return SPELL_TYPE_FEAT; break;
        case "4": return SPELL_TYPE_ITEM_POWER; break;
    }
    // Something else invalid
    OP_Debug("[GetSpellType] Invalid UserType column!", LOG_LEVEL_ERROR);
    return SPELL_TYPE_INVALID;
}

// This gets if nSpellId is hostile or not using spells.2da
// If left at -1 uses the global value
int GetSpellIsHostile(int nSpellIdToCheck)
{
    if (nSpellIdToCheck >= 0 && nSpellIdToCheck <= Get2DARowCount("spells"))
    {
        // How the game does it
        if (StringToInt(Get2DAString("spells", "HostileSetting", nSpellIdToCheck)) != 0)
        {
            return TRUE;
        }
    }
    // Everything else is false.
    return FALSE;
}

// This calculates the spell save DC for the given spell adding in bonuses and penalties as required
// For a AOE it uses the stored DC on the AOE object then uses oCaster to change the value.
int GetSpellSaveDCCalculated(object oCaster, int nSpellIdToCheck)
{
    if (nSpellIdToCheck == SPELL_INVALID) return 0;

    // Run script stores the save DC
    if (GetLastRunScriptEffectScriptType() != 0)
    {
        return GetRunScriptSpellSaveDC(GetLastRunScriptEffect());
    }
    // AOEs store the save DC from when cast
    else if (GetObjectType(OBJECT_SELF) == OBJECT_TYPE_AREA_OF_EFFECT)
    {
        // TODO: Update this value with variables from caster based on spell ID + class cast
        // We can calculate these changes I think, safely, more or less, without storing
        // the save DC on the AOE somehow.
        return GetSpellSaveDC();
    }

    // Default fallback is a spell script which can have altered values for the save DC
    int nSpellSaveDC = GetSpellSaveDC();

    // Modifications due to casters feats etc. would go here

    // Need to save it back to AOE's...somehow

    return nSpellSaveDC;
}

// This calculates the spell caster level for any additional bonuses due to feats or similar.
// For a AOE pass in it as the oCaster, then it uses the stored caster level.
int GetCasterLevelCalculated(object oCaster, int nSpellIdToCheck)
{
    if (nSpellIdToCheck == SPELL_INVALID) return 0;

    // Run script stores the caster level
    if (GetLastRunScriptEffectScriptType() != 0)
    {
        if (!GetIsEffectValid(GetLastRunScriptEffect()))
        {
            OP_Debug("[GetCasterLevelCalculated] Invalid effect for run script. Applied script?", LOG_LEVEL_ERROR);
        }

        // Caster level is stored on the effect itself
        return GetEffectCasterLevel(GetLastRunScriptEffect());
    }
    // If we are an Area of Effect we can get it from ourselves now
    else if (GetObjectType(OBJECT_SELF) == OBJECT_TYPE_AREA_OF_EFFECT)
    {
        // This is stored fine since we can change the effects that generate it.
        return GetCasterLevel(OBJECT_SELF);
    }

    int nCasterLevel = GetCasterLevel(oCaster);

    // Modifications due to casters feats etc.

    return nCasterLevel;
}

// Retrieves the metamagic used, in a spell script, AOE script or run script
int GetMetaMagicFeatCalculated()
{
    if (GetIsStateScript()) return METAMAGIC_NONE;

    if (GetLastRunScriptEffectScriptType() != 0)
    {
        return GetRunScriptMetaMagic(GetLastRunScriptEffect());
    }
    // If we are an Area of Effect we can get it from ourselves now
    else if (GetObjectType(OBJECT_SELF) == OBJECT_TYPE_AREA_OF_EFFECT)
    {
        // This hasn't got an override yet. Won't matter until it does.
        return GetMetaMagicFeat();
    }
    int nMetaMagic = GetMetaMagicFeat();

    // Apply any automatic metamagic or changes to metamagic here

    return nMetaMagic;
}

// Retrieves the spell casting class, in a spell script or run script.
int GetLastSpellCastClassCalculated()
{
    if (GetIsStateScript()) return METAMAGIC_NONE;

    if (GetLastRunScriptEffectScriptType() != 0)
    {
        return GetRunScriptCasterClass(GetLastRunScriptEffect());
    }
    return GetLastSpellCastClass();
}

// Retrieves the spell level (0 - 9), in a spell script or run script.
int GetLastSpellLevelCalculated()
{
    if (GetIsStateScript()) return METAMAGIC_NONE;

    if (GetLastRunScriptEffectScriptType() != 0)
    {
        return GetRunScriptSpellLevel(GetLastRunScriptEffect());
    }
    return GetLastSpellLevel();

}

// Retrieves if the spell was spontaneously ccast, in a spell script or run script.
int GetSpellCastSpontaneouslyCalculated()
{
    if (GetIsStateScript()) return METAMAGIC_NONE;

    if (GetLastRunScriptEffectScriptType() != 0)
    {
        return GetRunScriptSpontaneous(GetLastRunScriptEffect());
    }
    return GetSpellCastSpontaneously();
}

// Will return the target of the spell. Some special cases are taken into account with Run Script and potions.
object GetSpellTargetObjectCalculated()
{
    if (GetIsStateScript()) return OBJECT_SELF;

    // If run script we have OBJECT_SELF as the target
    if (GetLastRunScriptEffectScriptType() != 0)
    {
        return OBJECT_SELF;
    }

    // If AOE scripts we set it appropriately
    int nScript = GetCurrentlyRunningEvent();
    if (nScript == EVENT_SCRIPT_AREAOFEFFECT_ON_HEARTBEAT ||
        nScript == EVENT_SCRIPT_AREAOFEFFECT_ON_USER_DEFINED_EVENT)
    {
        return OBJECT_INVALID;
    }
    else if(nScript == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_ENTER)
    {
        return GetEnteringObject();
    }
    else if(nScript == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_EXIT)
    {
        return GetExitingObject();
    }

    // Potions can only ever be used on self, notable when using some potions on enemies (a bug in the engine)
    if (GetIsObjectValid(GetSpellCastItem()))
    {
        if (GetBaseItemType(GetSpellCastItem()) == BASE_ITEM_POTIONS ||
            GetBaseItemType(GetSpellCastItem()) == BASE_ITEM_ENCHANTED_POTION)
        {
            return OBJECT_SELF;
        }
    }

    // Else it's just the default target determined by the engine
    return GetSpellTargetObject();
}

// Will return the location of oTarget if valid, else GetSpellTargetLocation.
location GetSpellTargetLocationCalculated(object oTarget)
{
    location lReturn;
    if (GetIsObjectValid(oTarget))
    {
        return GetLocation(oTarget);
    }
    // If AOE scripts we set have no valid location for these two events so
    // use ourselves
    int nScript = GetCurrentlyRunningEvent();
    if (nScript == EVENT_SCRIPT_AREAOFEFFECT_ON_HEARTBEAT ||
        nScript == EVENT_SCRIPT_AREAOFEFFECT_ON_USER_DEFINED_EVENT)
    {
        return GetLocation(OBJECT_SELF);
    }

    return GetSpellTargetLocation();
}

// Perform a saving throw roll.
// Unlike MySavingThrow this will not "return failure in case of immunity" since, well, they're immune!
// Instead they'll be immune and we'll send appropriate feedback messages.
//   Returns: 0 if the saving throw roll failed
//   Returns: 1 if the saving throw roll succeeded
//   Returns: 2 if the target was immune to the save type specified
// Note: If used within an Area of Effect Object Script (On Enter, OnExit, OnHeartbeat), you MUST pass GetAreaOfEffectCreator() into oSaveVersus!
int DoSavingThrow(object oTarget, object oSaveVersus, int nSavingThrow, int nDC, int nSaveType = SAVING_THROW_TYPE_NONE, float fDelay = 0.0)
{
    // Sanity check
    if (nDC < 1)
    {
        nDC = 1;
    }
    else if (nDC > 255)
    {
        nDC = 255;
    }

    effect eVis;
    int nResult = 0;
    if (nSavingThrow == SAVING_THROW_FORT)
    {
        nResult = FortitudeSave(oTarget, nDC, nSaveType, oSaveVersus);
        if (nResult == 1)
            eVis = EffectVisualEffect(VFX_IMP_FORTITUDE_SAVING_THROW_USE);
    }
    else if (nSavingThrow == SAVING_THROW_REFLEX)
    {
        nResult = ReflexSave(oTarget, nDC, nSaveType, oSaveVersus);
        if (nResult == 1)
            eVis = EffectVisualEffect(VFX_IMP_REFLEX_SAVE_THROW_USE);
    }
    else if (nSavingThrow == SAVING_THROW_WILL)
    {
        nResult = WillSave(oTarget, nDC, nSaveType, oSaveVersus);
        if (nResult == 1)
            eVis = EffectVisualEffect(VFX_IMP_WILL_SAVING_THROW_USE);
    }
    else
    {
        OP_Debug("[ERROR] DoSavingThrow: Invalid saving throw specified.");
    }
    // Apply VFX
    /*
        return 0 = FAILED SAVE
        return 1 = SAVE SUCCESSFUL
        return 2 = IMMUNE TO WHAT WAS BEING SAVED AGAINST
    */
    if (nResult == 1 || nResult == 2)
    {
        if (nResult == 2)
        {
            eVis = EffectVisualEffect(VFX_IMP_MAGIC_RESISTANCE_USE);
            // Provide some feedback formatted to the games method of showing immunity feedback
            // But we don't just fire the effect off - return 2 still that they're immune.
            int nImmunityType = GetImmunityTypeFromSavingThrowType(nSaveType);

            if (nImmunityType != IMMUNITY_TYPE_NONE)
            {
                SendImmunityFeedback(oSaveVersus, oTarget, nImmunityType);
            }
        }
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
    }
    return nResult;
}

// Returns the modified amount of nDamage based on the saving throw being successful for half (or more if reflex save and feats are involved).
int DoDamageSavingThrow(int nDamage, object oTarget, object oSaveVersus, int nSavingThrow, int nDC, int nSaveType = SAVING_THROW_TYPE_NONE, float fDelay = 0.0)
{
    if (nSavingThrow == SAVING_THROW_REFLEX)
    {
        if(!DoSavingThrow(oTarget, oSaveVersus, nSavingThrow, nDC, nSaveType, fDelay))
        {
            if (GetHasFeat(FEAT_IMPROVED_EVASION, oTarget))
            {
                nDamage /= 2;
            }
        }
        else if (GetHasFeat(FEAT_EVASION, oTarget) || GetHasFeat(FEAT_IMPROVED_EVASION, oTarget))
        {
            nDamage = 0;
        }
        else
        {
            nDamage /= 2;
        }
    }
    else if (DoSavingThrow(oTarget, oSaveVersus, nSavingThrow, nDC, nSaveType, fDelay))
    {
        nDamage /= 2;
    }

    return nDamage;
}

// Used to route the resist magic checks into this function to check for spell countering by SR, Immunity, Globes or Mantles.
// Now a simple TRUE if spell resisted/immune/absorbed, or FALSE otherwise.
// Can now be called in a "non-true spell" so be careful and don't use in monster ability scripts.
int DoResistSpell(object oTarget, object oCaster, float fDelay = 0.0, int bResistCheck = TRUE, int bImmunityCheck = TRUE, int bAbsorbCheck = TRUE)
{
    // Alter the delay so it applies just before any other VFX
    if (fDelay > 0.5)
    {
        fDelay = fDelay - 0.1;
    }

    // Error check
    if (!GetIsObjectValid(oTarget) || !GetIsObjectValid(oCaster))
    {
        OP_Debug("[DoResistSpell] Error, caster or target is invalid. Caster: " + GetName(oCaster) + " Target: " + GetName(oTarget), LOG_LEVEL_ERROR);
        return FALSE;
    }

    // Checks are done based on the nSpellType;
    // - SPELL_TYPE_SPELL           - Standard spell
    // - SPELL_TYPE_CREATURE_POWER  - Or "Spell ability". Uses HD for resist spell. Checks spell immunity.
    // - SPELL_TYPE_FEAT            - No resist spell/absorption checks are valid. Checks spell immunity.
    // - SPELL_TYPE_ITEM_POWER      - No resist spell/absorption checks are valid. Checks spell immunity.

    // We test the 3 resist spell functions in the ResistSpell order for now:
    // Spell Absorption (Limited), Spell Absorption (Unlimited), Spell Immunity, Spell Resistance

    if (nSpellType == SPELL_TYPE_SPELL)
    {
        // Spell Absorption (Limited) ie mantles
        if (SpellAbsorptionLimitedCheck(oTarget, oCaster, nSpellId, nSpellSchool, nSpellLevel))
        {
            OP_Debug("[DoResistSpell] SpellAbsorptionLimitedCheck: TRUE against target: " + GetName(oTarget));
            if (fDelay > 0.5)
            {
                fDelay = fDelay - 0.1;
            }
            DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_SPELL_MANTLE_USE), oTarget));
            return TRUE;
        }

        // Spell Absorption (Unlimited) ie Globes
        if (SpellAbsorptionUnlimitedCheck(oTarget, oCaster, nSpellId, nSpellSchool, nSpellLevel))
        {
            OP_Debug("[DoResistSpell] SpellAbsorptionUnlimitedCheck: TRUE against target: " + GetName(oTarget));
            DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_GLOBE_USE), oTarget));
            return TRUE;
        }
    }

    // Spell Immunity
    if (SpellImmunityCheck(oTarget, oCaster, nSpellId))
    {
        OP_Debug("[DoResistSpell] SpellImmunityCheck: TRUE against target: " + GetName(oTarget));
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_GLOBE_USE), oTarget));
        return TRUE;
    }

    if (nSpellType == SPELL_TYPE_SPELL || nSpellType == SPELL_TYPE_CREATURE_POWER)
    {
        // Spell Resistance
        int nTargetSpellResistance = GetSpellResistance(oTarget);
        int nResistSpellCasterLevel = nCasterLevel;

        // Creature powers use the casters HD
        if (nSpellType == SPELL_TYPE_CREATURE_POWER)
        {
            nResistSpellCasterLevel = GetHitDice(oCaster);
        }

        // Add spell penetration feats
        if (GetHasFeat(FEAT_EPIC_SPELL_PENETRATION, oCaster))
        {
            nResistSpellCasterLevel += 6;
        }
        else if (GetHasFeat(FEAT_GREATER_SPELL_PENETRATION, oCaster))
        {
            nResistSpellCasterLevel += 4;
        }
        else if (GetHasFeat(FEAT_SPELL_PENETRATION, oCaster))
        {
            nResistSpellCasterLevel += 2;
        }

        // Check for Assay Resistance bonus vs. oTarget
        nResistSpellCasterLevel += GetAssayResistanceBonus(oTarget, oCaster);

        if (SpellResistanceCheck(oTarget, oCaster, nSpellId, nResistSpellCasterLevel, nTargetSpellResistance))
        {
            OP_Debug("[DoResistSpell] SpellResistanceCheck: TRUE against target: " + GetName(oTarget));
            DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_MAGIC_RESISTANCE_USE), oTarget));
            return TRUE;
        }
    }

    return FALSE;
}

// Gets the assay resistance bonus to caster level for oCaster if it is affecting oTarget
int GetAssayResistanceBonus(object oTarget, object oCaster)
{
    if (GetHasSpellEffect(SPELL_ASSAY_RESISTANCE, oCaster))
    {
        // Find the tagged effect
        effect eCheck = GetFirstEffect(oCaster);
        while (GetIsEffectValid(eCheck))
        {
            if (GetEffectSpellId(eCheck) == SPELL_ASSAY_RESISTANCE)
            {
                if (GetEffectTag(eCheck) == ObjectToString(oTarget))
                {
                    return 10;
                }
                return 0;
            }
            eCheck = GetNextEffect(oCaster);
        }
    }
    return 0;
}

// Does a relevant touch attack. Some classes add bonuses to touch attacks, which can be added in here.
// Return values:
// * 0 - Miss
// * 1 - Hit
// * 2 - Critical Hit
int DoTouchAttack(object oTarget, object oVersus, int nType, int bDisplayFeedback = TRUE)
{
    // Note: For now we don't use oVersus but it's possible to do this with ExecuteScript/ExecuteScriptChunk.
    if (oVersus != OBJECT_SELF)
    {
        if (DEBUG_LEVEL >= LOG_LEVEL_ERROR) OP_Debug("[ERROR] DoTouchAttack used when oVersus isn't OBJECT_SELF");
    }

    if (nType == TOUCH_MELEE)
    {
        return TouchAttackMelee(oTarget, bDisplayFeedback);
    }
    // Else TOUCH_RANGED
    return TouchAttackRanged(oTarget, bDisplayFeedback);
}

// Applies Dispel Magic to the given target (Area of Effects are also handled, as are Summoned Creatures)
void DoDispelMagic(object oTarget, int nCasterLevel, effect eVis, float fDelay, int bAll, int bBreach = FALSE)
{
    // Similar to Biowares both for compatibility and it makes sense.

    // AOE check first
    if (GetObjectType(oTarget) == OBJECT_TYPE_AREA_OF_EFFECT)
    {
        // Custom dispel check on persistent ones only
        // We decide this just by the PER or MOB identifier. Meh.
        if (TestStringAgainstPattern("VFX_PER_**", GetTag(oTarget)))
        {
            // Dispel magic check
            int nOpposingCasterLevel = GetCasterLevel(oTarget);

            // Non-spell Persistent AOEs cannot be dispelled
            if (nOpposingCasterLevel == 0)
            {
                OP_Debug("Persistent AOE with no caster level, ignoring, this shouldn't happen.");
                return;
            }

            // Same as creatures, can be immune to dispel
            if (GetLocalInt(oTarget, "X1_L_IMMUNE_TO_DISPEL")) return;

            if (d20() + nCasterLevel >= 10 + nOpposingCasterLevel)
            {
                FloatingTextStrRefOnCreature(100929, oCaster);  // "AoE dispelled"
                if (GetIsObjectValid(GetAreaOfEffectCreator(oTarget)))
                    FloatingTextStrRefOnCreature(100929, GetAreaOfEffectCreator(oTarget));
                DelayCommand(fDelay, ApplySpellEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_NORMAL_10), GetLocation(oTarget)));
                DestroyObject(oTarget, fDelay);
            }
            else
            {
                FloatingTextStrRefOnCreature(100930, oCaster); // "AoE not dispelled"
            }
        }
    }

    // Don't dispel magic on petrified targets
    // this change is in to prevent weird things from happening with 'statue'
    // creatures. Also creature can be scripted to be immune to dispel
    // magic as well.
    if (GetHasEffect(oTarget, EFFECT_TYPE_PETRIFY) || GetLocalInt(oTarget, "X1_L_IMMUNE_TO_DISPEL") == 10)
    {
        return;
    }

    // Fire spell event
    if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
    {
        SignalSpellCastAt(oTarget, oCaster, TRUE);
    }
    else
    {
        SignalSpellCastAt(oTarget, oCaster, FALSE);
    }

    // If a summoned creature we first check if we're going to dispel them entirely
    if (GetObjectType(oTarget) == OBJECT_TYPE_CREATURE &&
        GetAssociateType(oTarget) == ASSOCIATE_TYPE_SUMMONED)
    {
        // To do this nicely we will remove the parent effect
        object oMaster = GetMaster(oTarget);

        effect eCheck = GetFirstEffect(oMaster);
        while (GetIsEffectValid(eCheck))
        {
            if (GetEffectType(eCheck, TRUE) == EFFECT_TYPE_SUMMON_CREATURE)
            {
                // See if it matches
                if (GetEffectObject(eCheck, 1) == oTarget)
                {
                    // We dispel using this effects caster level
                    if (d20() + nCasterLevel >= 11 + GetEffectCasterLevel(eCheck))
                    {
                        RemoveEffect(oMaster, eCheck);
                        return;
                    }
                }
            }
            eCheck = GetNextEffect(oMaster);
        }
    }

    effect eDispel;
    if (bAll)
    {
        eDispel = EffectDispelMagicAll(nCasterLevel);
        if (bBreach)
        {
            DoSpellBreach(oTarget, 6, 10);
        }
    }
    else
    {
        eDispel = EffectDispelMagicBest(nCasterLevel);
        if (bBreach)
        {
            DelayCommand(fDelay, DoSpellBreach(oTarget, 2, 10));
        }
    }

    DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
    DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDispel, oTarget));
}

// Performs a spell breach up to nTotal spell are removed and nSR spell resistance is lowered.
void DoSpellBreach(object oTarget, int nTotal, int nSR, int bVFX = TRUE)
{
    // We remove spells in a particular order, until we've removed nTotal number of spells
    json jArray = JsonArray();

    // Spells to remove. Could be moved to the 2da but frankly ordering it there is going to be a pain.
    jArray = JsonArrayInsert(jArray, JsonInt(SPELL_GREATER_SPELL_MANTLE));
    jArray = JsonArrayInsert(jArray, JsonInt(SPELL_PREMONITION));
    jArray = JsonArrayInsert(jArray, JsonInt(SPELL_SPELL_MANTLE));
    jArray = JsonArrayInsert(jArray, JsonInt(SPELL_SHADOW_SHIELD));
    jArray = JsonArrayInsert(jArray, JsonInt(SPELL_GREATER_STONESKIN));
    jArray = JsonArrayInsert(jArray, JsonInt(SPELL_ETHEREAL_VISAGE));
    jArray = JsonArrayInsert(jArray, JsonInt(SPELL_GLOBE_OF_INVULNERABILITY));
    jArray = JsonArrayInsert(jArray, JsonInt(SPELL_ENERGY_BUFFER));
    jArray = JsonArrayInsert(jArray, JsonInt(SPELL_ETHEREALNESS)); // Greater Sanctuary
    jArray = JsonArrayInsert(jArray, JsonInt(SPELL_MINOR_GLOBE_OF_INVULNERABILITY));
    jArray = JsonArrayInsert(jArray, JsonInt(SPELL_SPELL_RESISTANCE));
    jArray = JsonArrayInsert(jArray, JsonInt(SPELL_STONESKIN));
    jArray = JsonArrayInsert(jArray, JsonInt(SPELL_LESSER_SPELL_MANTLE));
    jArray = JsonArrayInsert(jArray, JsonInt(SPELL_MESTILS_ACID_SHEATH));
    jArray = JsonArrayInsert(jArray, JsonInt(SPELL_MIND_BLANK));
    jArray = JsonArrayInsert(jArray, JsonInt(SPELL_ELEMENTAL_SHIELD));
    jArray = JsonArrayInsert(jArray, JsonInt(SPELL_PROTECTION_FROM_SPELLS));
    jArray = JsonArrayInsert(jArray, JsonInt(SPELL_PROTECTION_FROM_ELEMENTS));
    jArray = JsonArrayInsert(jArray, JsonInt(SPELL_RESIST_ELEMENTS));
    jArray = JsonArrayInsert(jArray, JsonInt(SPELL_DEATH_ARMOR));
    jArray = JsonArrayInsert(jArray, JsonInt(SPELL_GHOSTLY_VISAGE));
    jArray = JsonArrayInsert(jArray, JsonInt(SPELL_ENDURE_ELEMENTS));
    jArray = JsonArrayInsert(jArray, JsonInt(SPELL_SHADOW_SHIELD));
    jArray = JsonArrayInsert(jArray, JsonInt(SPELL_SHADOW_CONJURATION_MAGE_ARMOR));
    jArray = JsonArrayInsert(jArray, JsonInt(SPELL_NEGATIVE_ENERGY_PROTECTION));
    jArray = JsonArrayInsert(jArray, JsonInt(SPELL_SANCTUARY));
    jArray = JsonArrayInsert(jArray, JsonInt(SPELL_MAGE_ARMOR));
    jArray = JsonArrayInsert(jArray, JsonInt(SPELL_STONE_BONES));
    jArray = JsonArrayInsert(jArray, JsonInt(SPELL_SHIELD));
    jArray = JsonArrayInsert(jArray, JsonInt(SPELL_SHIELD_OF_FAITH));
    jArray = JsonArrayInsert(jArray, JsonInt(SPELL_LESSER_MIND_BLANK));
    jArray = JsonArrayInsert(jArray, JsonInt(SPELL_IRONGUTS));
    jArray = JsonArrayInsert(jArray, JsonInt(SPELL_RESISTANCE));

    int nIndex, nRemoved = 0;
    for (nIndex = 0; nIndex < JsonGetLength(jArray) && nRemoved < nTotal; nIndex++)
    {
        json jObject = JsonArrayGet(jArray, nIndex);

        if (RemoveEffectsFromSpell(oTarget, JsonGetInt(jObject)))
        {
            nRemoved++;
        }
    }
    // This can not be dispelled
    effect eLink = ExtraordinaryEffect(EffectLinkEffects(EffectSpellResistanceDecrease(nSR), EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));
    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(10));

    if (bVFX)
    {
        ApplySpellEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_BREACH), oTarget);
    }
}

// Gets if the spell script is illusionary (script param SCRIPT_PARAMETER_ILLUSIONARY set to "1")
int GetSpellIsIllusionary()
{
    string sParam = GetScriptParam(SCRIPT_PARAMETER_ILLUSIONARY);
    if (sParam != "")
    {
        return TRUE;
    }
    return FALSE;
}

// Gets the illusionary strength of the current script call. Not relevant if not an
// illusion spell. 20 would be 20% strength if they save a will save.
int GetSpellIllusionaryStrength()
{
    string sStrength = GetScriptParam(SCRIPT_PARAMETER_ILLUSIONARY_STRENGTH);

    if (sStrength != "")
    {
        return StringToInt(sStrength);
    }
    // Error
    OP_Debug("[GetIllusionModifiedValue] No script parameter for illusionary strength", LOG_LEVEL_ERROR);
    return 0;
}

// Checks if oTarget failed the will save done in GetSpellTargetValid() when they
// were checked. Can affect GetDiceRoll/GetDuration.
int GetTargetIllusionarySave(object oTarget)
{
    if (bIllusionary)
    {
        return GetLocalInt(oTarget, "ILLUSIONARY_SAVING_THROW_STATE");
    }
    return FALSE;
}

// Does (and stores) the Will saving throw for illusion saves.
void DoIllusionSavingThrow(object oTarget, object oCaster)
{
    // This resets things for the next call if not illusionary
    int bSave = FALSE;

    if (bIllusionary)
    {
        // Maybe a mind spell? Not sure. For now we'll leave it as is.
        bSave = DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC);
    }
    SetLocalInt(oTarget, "ILLUSIONARY_SAVING_THROW_STATE", bSave);
}

// Gets a modified value for nValue (minimum 1)
int GetIllusionModifiedValue(int nValue)
{
    // Gets the illusion strength (eg "20" means 20% power)
    string sStrength = GetScriptParam(SCRIPT_PARAMETER_ILLUSIONARY_STRENGTH);

    if (sStrength != "")
    {
        // 10 * 20 = 200, / 100 =
        nValue = FloatToInt(IntToFloat(nValue) * (StringToFloat(sStrength) / 100.0));
    }
    else
    {
        OP_Debug("[GetIllusionModifiedValue] No script parameter for illusionary strength");

    }
    return nValue;
}

// Applies metamagic to the given dice roll
// eg GetDiceRoll(4, 6, 8) will roll 4d6 and add 8 to the final roll
// Metamagic is applied automatically (alter with the global nMetaMagic)
int GetDiceRoll(int nNumberOfDice, int nDiceSize, int nBonus = 0)
{
    int i, nDamage = 0;
    for (i = 1; i <= nNumberOfDice; i++)
    {
        nDamage += Random(nDiceSize) + 1;
    }
    // Resolve metamagic. Maximize and Empower don't stack.
    if (nMetaMagic & METAMAGIC_MAXIMIZE)
    {
        nDamage = nDiceSize * nNumberOfDice;
    }
    else if (nMetaMagic & METAMAGIC_EMPOWER)
    {
        nDamage += nDamage / 2;
    }
    // Add bonus if any
    nDamage += nBonus;

    // Illusion alteration
    if (GetTargetIllusionarySave(oTarget))
    {
        nDamage = GetIllusionModifiedValue(nDamage);
    }
    return nDamage;
}

// Applies metamagic to the given duration
// * nType - The conversion used, ROUNDS (6 seconds), MINUTES ("1 turn" in old NWN = 1 minute/10 rounds) or HOURS (module dependant)
// Metamagic is applied automatically
float GetDuration(int nDuration, int nDurationType)
{
    float fDuration = 0.0;
    // Resolve metamagic
    if (nMetaMagic & METAMAGIC_EXTEND)
    {
        nDuration *= 2;
    }
    // Return the right duration
    if (nDurationType == ROUNDS)
    {
        fDuration = RoundsToSeconds(nDuration);
    }
    else if (nDurationType == MINUTES)
    {
        fDuration = TurnsToSeconds(nDuration);
    }
    else if (nDurationType == HOURS)
    {
        fDuration = HoursToSeconds(nDuration);
    }
    else
    {
        OP_Debug("[ERROR] Spells GetDuration: Incorrect nDurationType.", LOG_LEVEL_ERROR);
    }
    return fDuration;
}

// Checks if the given target is valid to be targeted by oCaster
// This additionally, if the spell is illusionary, do a will saving throw for the illusion check
// if the target is valid.
int GetSpellTargetValid(object oTarget, object oCaster, int nTargetType)
{
    // If dead, not a valid target
    if (GetIsDead(oTarget))
    {
        return FALSE;
    }

    int bReturnValue = FALSE;

    switch (nTargetType)
    {
        // This kind of spell will affect all friendlies and anyone in my party/faction, even if we are upset with each other currently.
        case SPELL_TARGET_ALLALLIES:
        {
            OP_Debug("[INFO] GetSpellTargetValid: All allies oTarget: " + GetName(oTarget) + " GetIsFriend: " + IntToString(GetIsFriend(oTarget, oCaster)) + " GetFactionEqual: " + IntToString(GetFactionEqual(oTarget, oCaster)), LOG_LEVEL_INFO);
            if (GetIsFriend(oTarget, oCaster) || GetFactionEqual(oTarget, oCaster))
            {
                bReturnValue = TRUE;
            }
        }
        break;
        case SPELL_TARGET_STANDARDHOSTILE:
        {
            OP_Debug("[INFO] GetSpellTargetValid: Standard hostile oTarget: " + GetName(oTarget) + " GetIsReactionTypeFriendly: " + IntToString(GetIsReactionTypeFriendly(oTarget, oCaster)), LOG_LEVEL_INFO);
            // This has been rewritten. We do a simple check for the reaction type now.
            // Previously there was a lot of checks for henchmen, AOEs that PCs cast, etc.
            if (!GetIsReactionTypeFriendly(oTarget, oCaster))
            {
                bReturnValue = TRUE;
            }
        }
        break;
        // Only harms enemies, ever, such as Call Lightning
        case SPELL_TARGET_SELECTIVEHOSTILE:
        {
            OP_Debug("[INFO] GetSpellTargetValid: Selective hostile oTarget: " + GetName(oTarget) + " GetIsEnemy: " + IntToString(GetIsEnemy(oTarget, oCaster)), LOG_LEVEL_INFO);
            if (GetIsEnemy(oTarget, oCaster))
            {
                bReturnValue = TRUE;
            }
        }
        break;
        case SPELL_TARGET_ANYTHING:
        {
            bReturnValue = TRUE;
        }
        break;
        default:
        {
            OP_Debug("[ERROR] GetSpellTargetValid: Invalid input: " + IntToString(nTargetType), LOG_LEVEL_ERROR);
        }
        break;
    }

    // If valid we do a will save for illusion spells
    if (bReturnValue)
    {
        DoIllusionSavingThrow(oTarget, oCaster);
    }

    return bReturnValue;
}

// Converts a SAVING_THROW_TYPE_* to an IMMUNITY_TYPE_* where these are checked for in the saving throw functions
// else it will be IMMUNITY_TYPE_NONE (0)
int GetImmunityTypeFromSavingThrowType(int nSaveType)
{
    // Only certain saving throw types check immunities in WillSave, ReflexSave or FortitudeSave
    int nImmunityType = IMMUNITY_TYPE_NONE;
    switch (nSaveType)
    {
        case SAVING_THROW_TYPE_DEATH:
            nImmunityType = IMMUNITY_TYPE_DEATH;
            break;
        case SAVING_THROW_TYPE_DISEASE:
            nImmunityType = IMMUNITY_TYPE_DISEASE;
            break;
        case SAVING_THROW_TYPE_FEAR:
            nImmunityType = IMMUNITY_TYPE_FEAR;
            break;
        case SAVING_THROW_TYPE_MIND_SPELLS:
            nImmunityType = IMMUNITY_TYPE_MIND_SPELLS;
            break;
        case SAVING_THROW_TYPE_POISON:
            nImmunityType = IMMUNITY_TYPE_POISON;
            break;
        case SAVING_THROW_TYPE_TRAP:
            nImmunityType = IMMUNITY_TYPE_TRAP;
            break;
        case SAVING_THROW_TYPE_PARALYSIS:
            nImmunityType = IMMUNITY_TYPE_PARALYSIS;
            break;
    }
    return nImmunityType;
}

// Check and do immunity for the given immunity type.
// It also provides feedback to the given creatures if valid.
int GetIsImmuneWithFeedback(object oCreature, int nImmunityType, object oVersus = OBJECT_INVALID)
{
    if (GetIsImmune(oCreature, nImmunityType, oVersus))
    {
        // Send some feedback
        SendImmunityFeedback(oVersus, oCreature, nImmunityType);

        return TRUE;
    }
    return FALSE;
}

// Provide some feedback formatted to the games method of showing immunity feedback
void SendImmunityFeedback(object oCaster, object oTarget, int nImmunityType)
{
    // Format:
    // <CUSTOM0> : Immune to Mind Affecting Spells.
    int nStrRef = 0;
    string sMessage;
    // We'll use the string ref if possible, else make our own up.
    switch (nImmunityType)
    {
        case IMMUNITY_TYPE_ABILITY_DECREASE: sMessage = "Ability Decrease"; break;
        case IMMUNITY_TYPE_AC_DECREASE: sMessage = "AC Decrease"; break;
        case IMMUNITY_TYPE_ATTACK_DECREASE: sMessage = "Attack Decrease"; break;
        case IMMUNITY_TYPE_BLINDNESS: nStrRef = STRREF_IMMUNITY_BLINDNESS; break;
        case IMMUNITY_TYPE_CHARM: nStrRef = STRREF_IMMUNITY_CHARM; break;
        case IMMUNITY_TYPE_CONFUSED: nStrRef = STRREF_IMMUNITY_CONFUSION; break;
        case IMMUNITY_TYPE_CRITICAL_HIT: nStrRef = STRREF_IMMUNITY_CRITICAL_HITS; break;
        case IMMUNITY_TYPE_CURSED: nStrRef = STRREF_IMMUNITY_CURSE; break;
        case IMMUNITY_TYPE_DAMAGE_DECREASE: sMessage = "Damage Decrease"; break;
        case IMMUNITY_TYPE_DAMAGE_IMMUNITY_DECREASE: sMessage = "Damage Immunity Decrease"; break;
        case IMMUNITY_TYPE_DAZED: nStrRef = STRREF_IMMUNITY_DAZE; break;
        case IMMUNITY_TYPE_DEAFNESS: nStrRef = STRREF_IMMUNITY_DEAFNESS; break;
        case IMMUNITY_TYPE_DEATH: nStrRef = STRREF_IMMUNITY_DEATH_MAGIC; break;
        case IMMUNITY_TYPE_DISEASE: nStrRef = STRREF_IMMUNITY_DISEASE; break;
        case IMMUNITY_TYPE_DOMINATE: nStrRef = STRREF_IMMUNITY_DOMINATE; break;
        case IMMUNITY_TYPE_ENTANGLE: nStrRef = STRREF_IMMUNITY_ENTANGLE; break;
        case IMMUNITY_TYPE_FEAR: nStrRef = STRREF_IMMUNITY_FEAR; break;
        case IMMUNITY_TYPE_KNOCKDOWN: nStrRef = STRREF_IMMUNITY_KNOCKDOWN; break;
        case IMMUNITY_TYPE_MIND_SPELLS: nStrRef = STRREF_IMMUNITY_MIND_AFFECTING_SPELLS; break;
        case IMMUNITY_TYPE_MOVEMENT_SPEED_DECREASE: sMessage = "Movement Speed Decrease"; break;
        case IMMUNITY_TYPE_NEGATIVE_LEVEL: nStrRef = STRREF_IMMUNITY_NEGATIVE_LEVELS; break;
        case IMMUNITY_TYPE_PARALYSIS: nStrRef = STRREF_IMMUNITY_PARALYSIS; break;
        case IMMUNITY_TYPE_POISON: nStrRef = STRREF_IMMUNITY_POISON; break;
        case IMMUNITY_TYPE_SAVING_THROW_DECREASE: sMessage = "Saving Throw Decrease"; break;
        case IMMUNITY_TYPE_SILENCE: nStrRef = STRREF_IMMUNITY_SILENCE; break;
        case IMMUNITY_TYPE_SKILL_DECREASE: sMessage = "Skill Decrease"; break;
        case IMMUNITY_TYPE_SLEEP: nStrRef = STRREF_IMMUNITY_SLEEP; break;
        case IMMUNITY_TYPE_SLOW: nStrRef = STRREF_IMMUNITY_SLOW; break;
        case IMMUNITY_TYPE_SNEAK_ATTACK: nStrRef = STRREF_IMMUNITY_SNEAK_ATTACKS; break;
        case IMMUNITY_TYPE_SPELL_RESISTANCE_DECREASE: sMessage = "Spell Resistance Decrease"; break;
        case IMMUNITY_TYPE_STUN: nStrRef = STRREF_IMMUNITY_STUN; break;
        case IMMUNITY_TYPE_TRAP: sMessage = "Trap"; break;
        default:
        {
            // EG: IMMUNITY_TYPE_NONE (0) or other values we do no messages. This should not occur though.
            if (DEBUG_LEVEL >= LOG_LEVEL_ERROR) OP_Debug("[ERROR] SendImmunityFeedback: Invalid nImmunityType: " + IntToString(nImmunityType));
            return;
        }
        break;
    }

    // If oTarget is valid and oCaster knows of them use that name, else use "Someone" TLK string
    string sTarget;
    if (GetIsObjectValid(oTarget) && (GetObjectSeen(oCaster, oTarget) || GetObjectHeard(oCaster, oTarget)))
    {
        sTarget = GetName(oTarget);
    }
    else
    {
        sTarget = GetStringByStrRef(STRREF_SOMEONE);
    }

    // No string ref available for immunity feedback we  do our own; Bioware didn't provide feedback on several of them (besides in spell scripts a VFX).
    if (nStrRef == 0)
    {
        sMessage = sTarget + " : " + sMessage + ".";
    }
    else
    {
        // Replace <CUSTOM0> with the given named target
        sMessage = RegExpReplace("<CUSTOM0>", GetStringByStrRef(nStrRef), sTarget, REGEXP_BASIC);
    }

    // Send the feedback
    if (GetIsObjectValid(oCaster)) SendMessageToPC(oCaster, sMessage);
    if (GetIsObjectValid(oTarget)) SendMessageToPC(oCaster, sMessage);
}

// This allows the application of a random delay to effects based on time parameters passed in.
float GetRandomDelay(float fMinimumTime = 0.4, float MaximumTime = 1.1)
{
    float fRandom = MaximumTime - fMinimumTime;
    if (fRandom < 0.0)
    {
        return 0.0;
    }
    else
    {
        int nRandom;
        nRandom = FloatToInt(fRandom * 10.0);
        nRandom = Random(nRandom) + 1;
        fRandom = IntToFloat(nRandom);
        fRandom /= 10.0;
        return fRandom + fMinimumTime;
    }
}

// This gets the delay for the given programmed VFX (progfx) MIRV else a default of target distance / 20
float GetVisualEffectHitDelay(int nVFX, object oTarget, object oSource)
{
    // Check if the VFX has a programmed effect
    int nProgrammedVFX = StringToInt(Get2DAString("visualeffects", "ProgFX_Impact", nVFX));
    if (nProgrammedVFX)
    {
        // Get the programmed VFX type, and if it's right we get the value else do default
        int nType = StringToInt(Get2DAString("progfx", "Type", nProgrammedVFX));
        if (nType == 10)
        {
            string sDelayType = Get2DAString("progfx", "Param5", nProgrammedVFX);

            if (sDelayType == "log")
            {
                float fDist = GetDistanceBetween(oSource, oTarget);
                return fDist / (3.0 * log(fDist) + 2.0);
            }
            else if (sDelayType == "linear")
            {
                float fDist = GetDistanceBetween(oSource, oTarget);
                return fDist / 50.0;
            }
            else if (sDelayType == "linear2")
            {
                float fDist = GetDistanceBetween(oSource, oTarget);
                return fDist / 25.0;
            }
        }
        else if (nType == 11)
        {
            // Same as "log"
            float fDist = GetDistanceBetween(oSource, oTarget);
            return fDist / (3.0 * log(fDist) + 2.0);
        }
    }
    if (DEBUG_LEVEL >= LOG_LEVEL_ERROR) OP_Debug("[ERROR] GetVisualEffectHitDelay Called with no programmed FX: " + IntToString(nProgrammedVFX), LOG_LEVEL_ERROR);
    // Default is distance / 20
    return GetDistanceBetween(oSource, oTarget) / 20.0;
}

// Rewrites the effect stack to use the given properties (default values don't override the current ones)
effect EffectChangeProperties(effect eEffect, int nSpellId = SPELL_INVALID, int nCasterLevel = 0, object oCreator = OBJECT_SELF)
{
    if (nSpellId != SPELL_INVALID)
    {
        eEffect = SetEffectSpellId(eEffect, nSpellId);
    }
    if (nCasterLevel != 0)
    {
        eEffect = SetEffectCasterLevel(eEffect, nCasterLevel);
    }
    if (oCreator != OBJECT_SELF)
    {
        eEffect = SetEffectCreator(eEffect, oCreator);
    }
    return eEffect;
}

// Applies the given effect but merges in the right spell Id, caster Id and caster level.
void ApplySpellEffectToObject(int nDurationType, effect eEffect, object oTarget, float fDuration = 0.0)
{
    // Error checking
    if (nDurationType == DURATION_TYPE_TEMPORARY && fDuration <= 0.0)
        OP_Debug("[ApplySpellEffectToObject] Error: Temporary duration but fDuration is: " + FloatToString(fDuration), LOG_LEVEL_ERROR);
    else if (nDurationType != DURATION_TYPE_TEMPORARY && fDuration != 0.0)
        OP_Debug("[ApplySpellEffectToObject] Error: Non-Temporary duration but fDuration is: " + FloatToString(fDuration), LOG_LEVEL_ERROR);

    ApplyEffectToObject(nDurationType, EffectChangeProperties(eEffect, nSpellId, nCasterLevel, oCaster), oTarget, fDuration);
}

// Applies the given effect but merges in the right spell Id, caster Id and caster level.
void ApplySpellEffectAtLocation(int nDurationType, effect eEffect, location lTarget, float fDuration = 0.0)
{
    // Error checking
    if (nDurationType == DURATION_TYPE_TEMPORARY && fDuration <= 0.0)
        OP_Debug("[ApplySpellEffectToObject] Error: Temporary duration but fDuration is: " + FloatToString(fDuration), LOG_LEVEL_ERROR);
    else if (nDurationType != DURATION_TYPE_TEMPORARY && fDuration != 0.0)
        OP_Debug("[ApplySpellEffectToObject] Error: Non-Temporary duration but fDuration is: " + FloatToString(fDuration), LOG_LEVEL_ERROR);

    ApplyEffectAtLocation(nDurationType, EffectChangeProperties(eEffect, nSpellId, nCasterLevel, oCaster), lTarget, fDuration);
}

// Applies the given item property to the given item.
// All existing item properties with a tag matching the spell ID are removed.
void ApplySpellItemPropertyToItem(int nDurationType, itemproperty ipProperty, object oItem, float fDuration = 0.0)
{
    // Remove existing tagged
    RemoveItemPropertiesMatchingSpellId(oItem, nSpellId);

    // Apply tag to find it later
    ipProperty = ApplyItemPropertyTaggedInfo(ipProperty, nSpellId, oCaster, nCasterLevel, nSpellSaveDC, nMetaMagic);
    AddItemProperty(nDurationType, ipProperty, oItem, fDuration);
}

// Signals a spell cast event.
// By default if the default parameters are used then the global automatically
// generated values are used instead.
void SignalSpellCastAt(object oSignalTarget = OBJECT_INVALID, object oSignalCaster = OBJECT_INVALID, int bSignalHostile = -1, int nSignalSpellId = -1)
{
    if (oSignalTarget == OBJECT_INVALID) oSignalTarget = oTarget;
    if (oSignalCaster == OBJECT_INVALID) oSignalCaster = oCaster;
    if (nSignalSpellId == -1) nSignalSpellId = nSpellId;
    if (bSignalHostile == -1) bSignalHostile = bHostile;

    SignalEvent(oSignalTarget, EventSpellCastAt(oSignalCaster, nSignalSpellId, bSignalHostile));
}

// Returns TRUE if we are OK running our AOE scripts.
// Does a check for the AOE creator, and destroys ourself with no effect if they no longer exist.
// This might be removed later but for now will stop some bugs.
int AOECheck()
{
    object oAOECreator = GetAreaOfEffectCreator();

    if (!GetIsObjectValid(oAOECreator))
    {
        DestroyObject(OBJECT_SELF);
        return FALSE;
    }
    return TRUE;
}

// Sends fake damage messages as per the game format for oTarget and oSource
void FakeDamageMessage(object oTarget, object oSource, int nDamage, int nDamageType)
{
    // Similar to BroadcastDamageDataToParty
    // * Things in oTarget or oSource faction get info
    // * Limited to a particular range (30M) and visibility info
}

// Gets the scale of the VFX to apply to oCreature. If not a creature it returns 1.0.
float GetVFXScale(object oCreature)
{
    if (GetObjectType(oCreature) != OBJECT_TYPE_CREATURE) return 1.0;

    // This is experimental. The data in appearance.2da isn't great.

    // Max scale based off creature size
    float fMax = IntToFloat(GetCreatureSize(oCreature)) / 2.5;

    // PERSPACE     - Lowest number, their personal bump space (Half-Orc: 0.3)
    // CREPERSPACE  - Medium number, their "combat" personal space (Half-Orc: 0.5)
    // PREFATCKDIST - Highest number, some are wildly high compared to their size like Dire Badger at 2.6 (Half-Orc: 2.1)
    float fScale = (StringToFloat(Get2DAString("appearance", "PERSPACE", GetAppearanceType(oTarget))) +
                    StringToFloat(Get2DAString("appearance", "PREFATCKDIST", GetAppearanceType(oTarget)))) /
                   2.0;
    float fFinal = fmin(fScale, fMax);

    OP_Debug("[GetVFXScale] fScale: " + FloatToString(fScale, 10, 4) + " fMax: " + FloatToString(fMax, 10, 4) + " fFinal: " + FloatToString(fFinal, 10, 4));

    return fFinal;
}

// Gets the given spells name, returns "" on error.
string GetSpellName(int nSpellId)
{
    string sTLK = Get2DAString("spells", "Name", nSpellId);
    if (sTLK != "")
    {
        return GetStringByStrRef(StringToInt(sTLK));
    }
    return "";
}

// Gets the level the given spell is usually cast at, Eg Magic Missile is 1 for Wizards/Sorcerers
// If CLASS_TYPE_INVALID is used it gets the Innate level instead.
// If the given class cannot cast the given spell we return the innate level (let's assume this for domain spells etc.)
int GetSpellLevel(int nSpellId, int nClass = CLASS_TYPE_INVALID)
{
    if (nClass != CLASS_TYPE_INVALID)
    {
        string sColumn = Get2DAString("classes", "SpellTableColumn", nClass);

        if (sColumn != "")
        {
            string sLevel = Get2DAString("spells", sColumn, nSpellId);

            if (sLevel != "")
            {
                return StringToInt(sLevel);
            }
        }
    }
    // Else return the innate level
    return StringToInt(Get2DAString("spells", "Innate", nSpellId));
}

// Gets the spell school of the given spell ID. Of course those not assigned to a class
// spellbook is probably not a "real" spell school.
// Returns -1 on error.
int GetSpellSchool(int nSpellId)
{
    string sSchool = Get2DAString("spells", "School", nSpellId);

    // We could do another lookup into spellschools.2da but these are essentially hardcoded so
    // we're doing a quick lookup instead.
    switch (HashString(sSchool))
    {
        case "A": return SPELL_SCHOOL_ABJURATION; break;
        case "C": return SPELL_SCHOOL_CONJURATION; break;
        case "D": return SPELL_SCHOOL_DIVINATION; break;
        case "E": return SPELL_SCHOOL_ENCHANTMENT; break;
        case "V": return SPELL_SCHOOL_EVOCATION; break;
        case "G": return SPELL_SCHOOL_GENERAL; break;
        case "I": return SPELL_SCHOOL_ILLUSION; break;
        case "N": return SPELL_SCHOOL_NECROMANCY; break;
        case "T": return SPELL_SCHOOL_TRANSMUTATION; break;
    }
    // Error (Eg an invalid spell line)
    return -1;
}

// Returns TRUE if the spell has targeting defined in the column "TargetShape"
int GetSpellIsAreaOfEffect(int nSpellId)
{
    return (Get2DAString("spells", "TargetShape", nSpellId) != "");
}

// Returns a human readable name for the given effect (eg: "Fear" or "Negative Level").
string GetEffectName(effect eEffect)
{
    switch (GetEffectType(eEffect, TRUE))
    {
        case EFFECT_TYPE_DAMAGE_RESISTANCE: return "Damage Resistance"; break;
        case EFFECT_TYPE_REGENERATE: return "Regeneration"; break;
        case EFFECT_TYPE_DAMAGE_REDUCTION: return "Damge Reduction"; break;
        case EFFECT_TYPE_TEMPORARY_HITPOINTS: return "Temporary Hitpoints"; break;
        case EFFECT_TYPE_ENTANGLE: return "Entangle"; break;
        // case EFFECT_TYPE_INVULNERABLE           return "Invulnerable"; break;
        case EFFECT_TYPE_DEAF: return "Deafness"; break;
        case EFFECT_TYPE_RESURRECTION: return "Ressurection"; break;
        case EFFECT_TYPE_IMMUNITY: return "Immunity"; break;
        case EFFECT_TYPE_ENEMY_ATTACK_BONUS: return "Enemy Attack Bonus"; break;
        case EFFECT_TYPE_ARCANE_SPELL_FAILURE: return "Arcane Spell Failure"; break;
        case EFFECT_TYPE_AREA_OF_EFFECT: return "Area of Effect"; break;
        case EFFECT_TYPE_BEAM: return "Beam"; break;
        case EFFECT_TYPE_CHARMED: return "Charm"; break;
        case EFFECT_TYPE_CONFUSED: return "Confused"; break;
        case EFFECT_TYPE_FRIGHTENED: return "Fear"; break;
        case EFFECT_TYPE_DOMINATED: return "Dominate"; break;
        case EFFECT_TYPE_PARALYZE: return "Paralysis"; break;
        case EFFECT_TYPE_DAZED: return "Daze"; break;
        case EFFECT_TYPE_STUNNED: return "Stun"; break;
        case EFFECT_TYPE_SLEEP: return "Sleep"; break;
        case EFFECT_TYPE_POISON: return "Poison"; break;
        case EFFECT_TYPE_DISEASE: return "Disease"; break;
        case EFFECT_TYPE_CURSE: return "Curse"; break;
        case EFFECT_TYPE_SILENCE: return "Silence"; break;
        case EFFECT_TYPE_TURNED: return "Turned"; break;
        case EFFECT_TYPE_HASTE: return "Haste"; break;
        case EFFECT_TYPE_SLOW: return "Slow"; break;
        case EFFECT_TYPE_ABILITY_INCREASE: return "Ability Increase"; break;
        case EFFECT_TYPE_ABILITY_DECREASE: return "Ability Decrease"; break;
        case EFFECT_TYPE_ATTACK_INCREASE: return "Attack Increase"; break;
        case EFFECT_TYPE_ATTACK_DECREASE: return "Attack Decrease"; break;
        case EFFECT_TYPE_DAMAGE_INCREASE: return "Damage Increase"; break;
        case EFFECT_TYPE_DAMAGE_DECREASE: return "Damage Decrease"; break;
        case EFFECT_TYPE_DAMAGE_IMMUNITY_INCREASE: return "Damage Immunity Increase"; break;
        case EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE: return "Damge Immunity Decrease"; break;
        case EFFECT_TYPE_AC_INCREASE: return "AC Increase"; break;
        case EFFECT_TYPE_AC_DECREASE: return "AC Decrease"; break;
        case EFFECT_TYPE_MOVEMENT_SPEED_INCREASE: return "Movement Speed Increase"; break;
        case EFFECT_TYPE_MOVEMENT_SPEED_DECREASE: return "Movement Speed Decrease"; break;
        case EFFECT_TYPE_SAVING_THROW_INCREASE: return "Saving Throw Increase"; break;
        case EFFECT_TYPE_SAVING_THROW_DECREASE: return "Saving THrow Decrease"; break;
        case EFFECT_TYPE_SPELL_RESISTANCE_INCREASE: return "Spell Resistance Increase"; break;
        case EFFECT_TYPE_SPELL_RESISTANCE_DECREASE: return "Spell Resistance Decrease"; break;
        case EFFECT_TYPE_SKILL_INCREASE: return "Skill Increase"; break;
        case EFFECT_TYPE_SKILL_DECREASE: return "Skill Decrease"; break;
        case EFFECT_TYPE_INVISIBILITY: return "Invisibility"; break;
        // case EFFECT_TYPE_IMPROVEDINVISIBILITY: return "Improved Invisibility"; break;
        case EFFECT_TYPE_DARKNESS: return "Darkness"; break;
        case EFFECT_TYPE_DISPELMAGICALL: return "Dispell Magic All"; break;
        case EFFECT_TYPE_ELEMENTALSHIELD: return "Elemental Shield"; break;
        case EFFECT_TYPE_NEGATIVELEVEL: return "Negative Level"; break;
        case EFFECT_TYPE_POLYMORPH: return "Polymorph"; break;
        case EFFECT_TYPE_SANCTUARY: return "Sanctuary"; break;
        case EFFECT_TYPE_TRUESEEING: return "True Seeing"; break;
        case EFFECT_TYPE_SEEINVISIBLE: return "See Invisibility"; break;
        case EFFECT_TYPE_TIMESTOP: return "Timestop"; break;
        case EFFECT_TYPE_BLINDNESS: return "Blindness"; break;
        case EFFECT_TYPE_SPELLLEVELABSORPTION: return "Spell Level Absorption"; break;
        case EFFECT_TYPE_DISPELMAGICBEST: return "Dispel Magic Best"; break;
        case EFFECT_TYPE_ULTRAVISION: return "Ultravision"; break;
        case EFFECT_TYPE_MISS_CHANCE: return "Miss Chance"; break;
        case EFFECT_TYPE_CONCEALMENT: return "Concealment"; break;
        case EFFECT_TYPE_SPELL_IMMUNITY: return "Spell Immunity"; break;
        case EFFECT_TYPE_VISUALEFFECT: return "Visual Effect"; break;
        case EFFECT_TYPE_DISAPPEARAPPEAR: return "Disappear Appear"; break;
        case EFFECT_TYPE_SWARM: return "Swarm"; break;
        case EFFECT_TYPE_TURN_RESISTANCE_DECREASE: return "Turn Resistance Decrease"; break;
        case EFFECT_TYPE_TURN_RESISTANCE_INCREASE: return "Turn Resistance Increase"; break;
        case EFFECT_TYPE_PETRIFY: return "Petrify"; break;
        case EFFECT_TYPE_CUTSCENE_PARALYZE: return "Cutscene Paralyze"; break;
        case EFFECT_TYPE_ETHEREAL: return "Ethereal"; break;
        case EFFECT_TYPE_SPELL_FAILURE: return "Spell Failure"; break;
        case EFFECT_TYPE_CUTSCENEGHOST: return "Cutscene Ghost"; break;
        case EFFECT_TYPE_CUTSCENEIMMOBILIZE: return "Cutscene Immobilize"; break;
        case EFFECT_TYPE_RUNSCRIPT: return "Run Script"; break;
        case EFFECT_TYPE_ICON: return "Icon"; break;
        case EFFECT_TYPE_PACIFY: return "Pacify"; break;
        case EFFECT_TYPE_BONUS_FEAT: return "Bonus Feat"; break;
        case EFFECT_TYPE_TIMESTOP_IMMUNITY: return "Timestop Immunity"; break;
        case EFFECT_TYPE_FORCE_WALK: return "Force Walk"; break;
        case EFFECT_TYPE_APPEAR: return "Appear"; break;
        case EFFECT_TYPE_CUTSCENE_DOMINATED: return "Cutscene Dominated"; break;
        case EFFECT_TYPE_DAMAGE: return "Damage"; break;
        case EFFECT_TYPE_DEATH: return "Death"; break;
        case EFFECT_TYPE_DISAPPEAR: return "Disappear"; break;
        case EFFECT_TYPE_HEAL: return "Heal"; break;
        case EFFECT_TYPE_HITPOINTCHANGEWHENDYING: return "Hit Point Change When Dying"; break;
        case EFFECT_TYPE_KNOCKDOWN: return "Knockdown"; break;
        case EFFECT_TYPE_MODIFY_ATTACKS: return "Modify Attacks"; break;
        case EFFECT_TYPE_SUMMON_CREATURE: return "Summon Creature"; break;
        case EFFECT_TYPE_TAUNT: return "Taunt"; break;
        case EFFECT_TYPE_WOUNDING: return "Wounding"; break;
    }
    return "";
}

// Returns TRUE if the given creature is incorporeal (generally based off their appearance).
int GetIsIncorporeal(object oCreature)
{
    switch (GetAppearanceType(oCreature))
    {
        case APPEARANCE_TYPE_ALLIP:
        case APPEARANCE_TYPE_INVISIBLE_HUMAN_MALE:
        case APPEARANCE_TYPE_INVISIBLE_STALKER:
        case APPEARANCE_TYPE_LANTERN_ARCHON:
        case APPEARANCE_TYPE_WILL_O_WISP:
            return TRUE;
        break;
    }
    return FALSE;
}

// Returns TRUE if the given creature is made of metal (eg Iron Golem) based off appearance.
int GetIsMetalCreature(object oCreature)
{
    switch (GetAppearanceType(oCreature))
    {
        case APPEARANCE_TYPE_GOLEM_IRON:
        case APPEARANCE_TYPE_GOLEM_ADAMANTIUM:
        case APPEARANCE_TYPE_GOLEM_MITHRAL:
        case APPEARANCE_TYPE_HELMED_HORROR:
            return TRUE;
        break;
    }

    return FALSE;
}

// Returns TRUE if the given creature is humanoid (base races plus goblins etc.)
int GetIsHumanoidCreature(object oCreature)
{
    switch (GetRacialType(oCreature))
    {
        case RACIAL_TYPE_DWARF:
        case RACIAL_TYPE_ELF:
        case RACIAL_TYPE_HALFELF:
        case RACIAL_TYPE_HALFLING:
        case RACIAL_TYPE_HALFORC:
        case RACIAL_TYPE_HUMAN:
        case RACIAL_TYPE_HUMANOID_GOBLINOID:
        case RACIAL_TYPE_HUMANOID_MONSTROUS:
        case RACIAL_TYPE_HUMANOID_ORC:
        case RACIAL_TYPE_HUMANOID_REPTILIAN:
            return TRUE;
        break;
    }
    return FALSE;
}

// Returns TRUE if the given creature is mindless (elemental, undead, vermin, construct, ooze)
int GetIsMindless(object oCreature)
{
    switch(GetRacialType(oCreature))
    {
        case RACIAL_TYPE_ELEMENTAL:
        case RACIAL_TYPE_UNDEAD:
        case RACIAL_TYPE_VERMIN:
        case RACIAL_TYPE_CONSTRUCT:
        case RACIAL_TYPE_OOZE:
            return TRUE;
    }
    return FALSE;
}

// Gets if either domain matches the given domain on the given class
int GetClassHasDomain(object oCreature, int nClass, int nDomain)
{
    if (GetDomain(oCreature, 1, nClass) == nDomain ||
        GetDomain(oCreature, 2, nClass) == nDomain)
    {
        return TRUE;
    }
    return FALSE;
}

// Returns TRUE if oObject has at least one effect matching the parameters.
// * nEffectType - Can be EFFECT_TYPE_ALL to be ignored
// * sTag - Only checked if not blank
int GetHasEffect(object oObject, int nEffectType, string sTag = "")
{
    effect eCheck = GetFirstEffect(oObject);
    while (GetIsEffectValid(eCheck))
    {
        if (nEffectType == EFFECT_TYPE_ALL || GetEffectType(eCheck, TRUE) == nEffectType)
        {
            if (sTag == "" || GetEffectTag(eCheck) == sTag)
            {
                return TRUE;
            }
        }
        eCheck = GetNextEffect(oObject);
    }
    return FALSE;
}

// Removes effects from the given spell ID. Returns TRUE if one was removed.
// * nSpellId - If SPELL_ANY it will remove any spell Id. -1 or SPELL_INVALID is "Invalid spell ID" so technically still a subset of effects.
// * sTag - If set the tag must match
// * nEffectType - If set the effect type must match
int RemoveEffectsFromSpell(object oObject, int nSpellId, int nEffectType = EFFECT_TYPE_ALL, string sTag = "")
{
    int bRemoved = FALSE;
    effect eCheck = GetFirstEffect(oObject);
    while (GetIsEffectValid(eCheck))
    {
        if ( (nSpellId == SPELL_ANY || GetEffectSpellId(eCheck) == nSpellId) &&
             (nEffectType == EFFECT_TYPE_ALL || GetEffectType(eCheck, TRUE) == nEffectType) &&
             (sTag == "" || GetEffectTag(eCheck) == sTag) )
        {
            RemoveEffect(oObject, eCheck);
            bRemoved = TRUE;
        }
        eCheck = GetNextEffect(oObject);
    }
    return bRemoved;
}

// Finds the duration remaining of the given spell on oObject
float GetRemainingDurationOfSpell(object oObject, int nSpellId)
{
    effect eCheck = GetFirstEffect(oObject);
    while (GetIsEffectValid(eCheck))
    {
        if (GetEffectSpellId(eCheck) == nSpellId)
        {
            return IntToFloat(GetEffectDurationRemaining(eCheck));
        }
        eCheck = GetNextEffect(oObject);
    }
    return 0.0;
}

// Cures a JsonArray of integer effects with some caveats:
// - oTarget - Creature to cure
// - jArray - The array of EFFECT_TYPE_* integers to remove. Note:
//         EFFECT_TYPE_ABILITY_DECREASE - Only removes non-poison, non-disease based ones
//         EFFECT_TYPE_POISON / EFFECT_TYPE_DISEASE - Since these effects can eventually
//                     disappear but the ability score changes persist we sadly
//                     have to clear all ability scores from them generated by
//                     the engine
// - bSuperanturalRemoval - If FALSE it will not remove Supernatural effects.
void CureEffects(object oTarget, json jArray, int bSupernaturalRemoval = FALSE)
{
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        int nTypeToRemove = JsonGetInt(JsonArrayGet(jArray, nIndex));

        effect eCheck = GetFirstEffect(oTarget);
        while (GetIsEffectValid(eCheck))
        {
            SpeakString("effect type: " + IntToString(GetEffectType(eCheck, TRUE)));
            // Anything that is applied as Unyielding is not removed (native effects)
            // TODO: We also need a way to tag/get that it shouldn't be removed.
            if (GetEffectSubType(eCheck) != SUBTYPE_UNYIELDING &&
                (bSupernaturalRemoval || GetEffectSubType(eCheck) != SUBTYPE_SUPERNATURAL))
            {
                // For now if EFFECT_TYPE_POISON or DISEASE is included we assume ability score loss removal
                int nType = GetEffectType(eCheck, TRUE);
                if (nType == nTypeToRemove || (nType == EFFECT_TYPE_ABILITY_DECREASE && (nTypeToRemove == EFFECT_TYPE_POISON || nTypeToRemove == EFFECT_TYPE_DISEASE)))
                {
                    // Ability scores get special treatment (ie disease/poison)
                    if (nTypeToRemove == EFFECT_TYPE_ABILITY_DECREASE)
                    {
                        // How does EFFECT_TYPE_ABILITY_DECREASE get implemented in the engine?
                        // NOTE: Not included here are non-exposed effects (eg Entangle/Curse)
                        // Called shot:
                        //      -2 Dexterity, Temporary duration, subtype: SUBTYPE_ENGINE, no spell Id (also linked to a movement speed decrease)
                        // Crippling Strike:
                        //      -2 Strength, Permanent duration, subtype: SUBTYPE_ENGINE, no spell Id
                        // On (Monster) Hit: Ability Decrease:
                        //      -1/X of one ability score, Permanent duration, subtype: Supernatural if On Monster Hit, else Extraordinary, no spell Id.
                        // Poison + Disease effects:
                        //      As you'd expect from scripted effects.
                        // Disease On Hit item properties:
                        //      Permanent duration, subtype: supernatural, no spell Id
                        // Poison On Hit item properties:
                        //      Permanent duration, subtype: magical (this matches EffectPoison's deafult subtype but is annoying!), no spell Id
                        // Poison + Disease payloads:
                        //      -X of one ability score, copied from parent: Creator, Duration time, Duration Type, SubType, Spell Id

                        // From the above information we really can't identify cleanly "just ability score damage from poison"
                        // since On Hit: Ability Score Damage applies supernatural and extraordinary types as well
                        // Therefore FOR NOW we just remove it
                        RemoveEffect(oTarget, eCheck);
                        SendMessageToPC(oCaster, "Cured: " + GetEffectName(eCheck) + " on " + GetName(oTarget));
                    }
                    else
                    {
                        RemoveEffect(oTarget, eCheck);
                        SendMessageToPC(oCaster, "Cured: " + GetEffectName(eCheck) + " on " + GetName(oTarget));
                    }
                }
            }
            eCheck = GetNextEffect(oTarget);
        }
    }
}

// Removes effects matching the given tag. Returns TRUE if one was removed.
int RemoveEffectsMatchingTag(object oObject, string sTag)
{
    int bRemoved = FALSE;
    effect eCheck = GetFirstEffect(oObject);
    while (GetIsEffectValid(eCheck))
    {
        if (GetEffectTag(eCheck) == sTag)
        {
            RemoveEffect(oObject, eCheck);
            bRemoved = TRUE;
        }
        eCheck = GetNextEffect(oObject);
    }
    return bRemoved;
}

const string FIELD_OBJECTID = "objectid";
const string FIELD_METRIC = "metric";

// Loops through relevant shape to get all the targets in it. It then sorts them using nSortMethod.
// * nTargetType - The SPELL_TARGET_* type to check versus oCaster
// * nSortMethod - The sorting method to apply once all the creatures are added.
//                 SORT_METHOD_NONE      - No sorting (slightly faster)
//                 SORT_METHOD_LOWEST_HP - Sorts so first object is the lowest HP
//                 SORT_METHOD_LOWEST_HD - Sorts so first object is the lowest HD
//                 SORT_METHOD_DISTANCE  - Sorts so the first object is the lowest distance
// The other variables can be set, but if not then the current Spell Id will sort the shape and size.
json GetArrayOfTargets(int nTargetType, int nSortMethod = SORT_METHOD_DISTANCE, int nObjectFilter=OBJECT_TYPE_CREATURE, int nShape = -1, float fSize = -1.0, location lArrayTarget=LOCATION_INVALID, int bLineOfSight=TRUE, vector vOrigin=[0.0,0.0,0.0])
{
    float fSafeArea = -1.0;
    // Get some values if not set
    if (nShape == -1) nShape = GetSpellShape(nSpellId);

    if (nShape == SHAPE_HSPHERE)
    {
        // Special case...
        fSafeArea = GetSpellShapeSize(nSpellId);    // X
        fSize = GetSpellShapeSize(nSpellId, FALSE); // Y
        nShape = SHAPE_SPHERE;
    }

    if (fSize == -1.0) fSize = GetSpellShapeSize(nSpellId);
    if (!GetIsObjectValid(GetAreaFromLocation(lArrayTarget))) lArrayTarget = lTarget;

    json jArray = JsonArray();

    // Error checking - we log these might be mistakes in spell scripts
    if (nTargetType < 0 || nTargetType > 3) { OP_Debug("[GetArrayOfTargets] nTargetType invalid: " + IntToString(nTargetType), LOG_LEVEL_ERROR); return jArray; }
    if (nSortMethod < 0 || nSortMethod > 3) { OP_Debug("[GetArrayOfTargets] nSortMethod invalid: " + IntToString(nSortMethod), LOG_LEVEL_ERROR); return jArray; }
    if (nShape < 0 || nShape > 4) { OP_Debug("[GetArrayOfTargets] nShape invalid: " + IntToString(nShape), LOG_LEVEL_ERROR); return jArray; }
    if (fSize <= 0.0 || fSize >= 50.0) { OP_Debug("[GetArrayOfTargets] fSize invalid: " + FloatToString(fSize), LOG_LEVEL_ERROR); return jArray; }
    if (!GetIsObjectValid(GetAreaFromLocation(lTarget))) { OP_Debug("[GetArrayOfTargets] lTarget invalid. Area OID: " + ObjectToString(GetAreaFromLocation(lTarget)), LOG_LEVEL_ERROR); return jArray; }
    if (nObjectFilter < 0 || nObjectFilter > 32767) { OP_Debug("[GetArrayOfTargets] nObjectFilter invalid: " + IntToString(nObjectFilter), LOG_LEVEL_ERROR); return jArray; }

    // We can accidentially due to maths(TM) target ourselves in the case of cones and cylinders which start on us, so let's not do that.
    int bTargetSelf = TRUE;
    if (nShape == SHAPE_CONE || nShape == SHAPE_SPELLCONE || nShape == SHAPE_SPELLCYLINDER) bTargetSelf = FALSE;

    object oObject = GetFirstObjectInShape(nShape, fSize, lTarget, bLineOfSight, nObjectFilter, vOrigin);
    while (GetIsObjectValid(oObject))
    {
        // Safe area test
        if (fSafeArea < 0.0 || GetDistanceBetweenLocations(lTarget, GetLocation(oTarget)) > fSafeArea)
        {
            if (GetSpellTargetValid(oObject, oCaster, nTargetType) && (bTargetSelf == TRUE || oObject != oCaster))
            {
                json jObject = JsonObject();

                // Metric depends on what we are sorting
                switch (nSortMethod)
                {
                    //SORT_METHOD_NONE - No need to store anything extra
                    case SORT_METHOD_LOWEST_HP: jObject = JsonObjectSet(jObject, FIELD_METRIC, JsonInt(GetCurrentHitPoints(oObject))); break;
                    case SORT_METHOD_LOWEST_HD: jObject = JsonObjectSet(jObject, FIELD_METRIC, JsonInt(GetHitDice(oObject))); break;
                    case SORT_METHOD_DISTANCE:  jObject = JsonObjectSet(jObject, FIELD_METRIC, JsonFloat(GetDistanceBetweenLocations(lTarget, GetLocation(oObject)))); break;
                }

                // Add the value we sort with first and OID second so it's part of the sorting later
                jObject = JsonObjectSet(jObject, FIELD_OBJECTID, JsonString(ObjectToString(oObject)));

                jArray = JsonArrayInsert(jArray, jObject);
            }
        }
        oObject = GetNextObjectInShape(nShape, fSize, lTarget, bLineOfSight, nObjectFilter, vOrigin);
    }

    // Sort the array
    // SORT_METHOD_NONE doesn't need any sorting (no data to sort)
    if (nSortMethod == SORT_METHOD_LOWEST_HP ||
        nSortMethod == SORT_METHOD_LOWEST_HD ||
        nSortMethod == SORT_METHOD_DISTANCE)
    {
        jArray = JsonArrayTransform(jArray, JSON_ARRAY_SORT_ASCENDING);
    }

    return jArray;
}

// Gets the given Object stored as FIELD_OBJECTID in jArray at nIndex
object GetArrayObject(json jArray, int nIndex)
{
    json jObject = JsonArrayGet(jArray, nIndex);

    // Get the object ID
    string sOID = JsonGetString(JsonObjectGet(jObject, FIELD_OBJECTID));

    if (sOID != "")
    {
        object oObject = StringToObject(sOID);
        if (GetIsObjectValid(oObject))
        {
            return oObject;
        }
        else
        {
            OP_Debug("[ERROR] Spell script: " + GetScriptName() + " has target OID is invalid in sorted array loop " + sOID, LOG_LEVEL_ERROR);
        }
    }
    return OBJECT_INVALID;
}

// Returns a EffectRunScript that is automatically configured. Will NOT set an apply script since the given effect is invalid.
// The data field in the effect will be set with information that isn't set on the effect, and retrieved
// automatically, eg: nMetaMagic, nSpellSaveDC, nSpellLevel
// * sScript - If not set will use current script name + "rs" (eg: op_s_melfsacid -> op_s_melfsacidrs)
effect EffectRunScriptAutomatic(float fInterval = 6.0, string sScript = "")
{
    if (sScript == "")
    {
        sScript = GetScriptName() + "rs";

        if (GetStringLength(sScript) > 16)
        {
            // Oh no! Return an invalid effect
            OP_Debug("[EffectRunScriptAutomatic] Script name too long: " + sScript, LOG_LEVEL_ERROR);
            return EffectInvalidEffect();
        }

        if (ResManGetAliasFor(sScript, RESTYPE_NSS) == "")
        {
            OP_Debug("[EffectRunScriptAutomatic] Script not found: " + sScript, LOG_LEVEL_ERROR);
            return EffectInvalidEffect();
        }
    }

    // Gather some data for later retrieval
    // This is similar to the op_i_itemprops version but stores only what cannot be altered
    // on the effect.
    // We use a Json object dumped to string for this.
    json jObject = JsonObject();

    jObject = JsonObjectSet(jObject, JSON_FIELD_OVERHAUL, JsonInt(OVERHAUL_VERSION));
    //jObject = JsonObjectSet(jObject, JSON_FIELD_SPELLID, JsonInt(nSpellId));
    //jObject = JsonObjectSet(jObject, JSON_FIELD_CREATOR, JsonString(ObjectToString(oCaster)));
    //jObject = JsonObjectSet(jObject, JSON_FIELD_CASTERLEVEL, JsonInt(nCasterLevel));
    jObject = JsonObjectSet(jObject, JSON_FIELD_SPELLSAVEDC, JsonInt(nSpellSaveDC));
    jObject = JsonObjectSet(jObject, JSON_FIELD_METAMAGIC, JsonInt(nMetaMagic));
    jObject = JsonObjectSet(jObject, JSON_FIELD_CASTERCLASS, JsonInt(nCasterClass));
    jObject = JsonObjectSet(jObject, JSON_FIELD_SPELLLEVEL, JsonInt(nSpellLevel));
    jObject = JsonObjectSet(jObject, JSON_FIELD_SPONTANEOUS, JsonInt(bSpontaneous));

    // We intentionally do not set an applied script which is a little buggy (this effect isn't valid yet) and in any case
    // we can apply anything we want in that script inside the main script applying it.
    return EffectRunScript("", sScript, sScript, fInterval, JsonDump(jObject));
}

// This tags the given effect with JSON_FIELD_* information and returns it
effect EffectTagWithMetadata(effect eEffect)
{
    // Gather some data for later retrieval
    // This is similar to the op_i_itemprops version but stores only what cannot be altered
    // on the effect.
    // We use a Json object dumped to string for this.
    json jObject = JsonObject();

    jObject = JsonObjectSet(jObject, JSON_FIELD_OVERHAUL, JsonInt(OVERHAUL_VERSION));
    //jObject = JsonObjectSet(jObject, JSON_FIELD_SPELLID, JsonInt(nSpellId));
    //jObject = JsonObjectSet(jObject, JSON_FIELD_CREATOR, JsonString(ObjectToString(oCaster)));
    //jObject = JsonObjectSet(jObject, JSON_FIELD_CASTERLEVEL, JsonInt(nCasterLevel));
    jObject = JsonObjectSet(jObject, JSON_FIELD_SPELLSAVEDC, JsonInt(nSpellSaveDC));
    jObject = JsonObjectSet(jObject, JSON_FIELD_METAMAGIC, JsonInt(nMetaMagic));
    jObject = JsonObjectSet(jObject, JSON_FIELD_CASTERCLASS, JsonInt(nCasterClass));
    jObject = JsonObjectSet(jObject, JSON_FIELD_SPELLLEVEL, JsonInt(nSpellLevel));
    jObject = JsonObjectSet(jObject, JSON_FIELD_SPONTANEOUS, JsonInt(bSpontaneous));

    return TagEffect(eEffect, JsonDump(jObject));
}

// Retrieves the effects save DC (need to be set with EffectTagWithMetadata)
// Returns 0 if not found
int GetEffectTaggedSpellSaveDC(effect eEffect)
{
    return GetJsonMetadataIntField(GetEffectTag(eEffect), JSON_FIELD_SPELLSAVEDC, 0);
}

// Retrieves the effects metamagic (need to be set with EffectTagWithMetadata)
// Returns 0 if not found
int GetEffectTaggedMetaMagic(effect eEffect)
{
    return GetJsonMetadataIntField(GetEffectTag(eEffect), JSON_FIELD_METAMAGIC, 0);
}

// Retrieves the effects caster class (need to be set with EffectTagWithMetadata)
// Returns CLASS_TYPE_INVALID if not found
int GetEffectTaggedCasterClass(effect eEffect)
{
    return GetJsonMetadataIntField(GetEffectTag(eEffect), JSON_FIELD_CASTERCLASS, CLASS_TYPE_INVALID);
}

// Retrieves the effects spell level (need to be set with EffectTagWithMetadata)
// Returns -1 if not found
int GetEffectTaggedSpellLevel(effect eEffect)
{
    return GetJsonMetadataIntField(GetEffectTag(eEffect), JSON_FIELD_SPELLLEVEL, -1);
}

// Retrieves the effects spontaneous casting state (need to be set with EffectTagWithMetadata)
// Returns 0 if not found
int GetEffectTaggedSpontaneous(effect eEffect)
{
    return GetJsonMetadataIntField(GetEffectTag(eEffect), JSON_FIELD_SPONTANEOUS, 0);
}


// This retrieves the given JSON_FIELD_ from the given effect, if present. Else a default value is returned.

// Returns the effect used to track item properties and removes them when this effect is removed
// Uses the spell ID of this effect to track this.
// * jOIDs - OIDs of the items to track
// Apply the item properties with ApplySpellItemPropertyToItem()
effect EffectTrackItemProperties(json jOIDs, int nSpellIdToTrack = SPELL_INVALID)
{
    if (nSpellIdToTrack == SPELL_INVALID) nSpellIdToTrack = nSpellId;

    string sTag = JsonDump(jOIDs);

    if (sTag == "")
    {
        OP_Debug("[EffectTrackItemProperties] No OIDs set so can't remove item properties later.", LOG_LEVEL_ERROR);
        return EffectInvalidEffect();
    }

    return SetEffectSpellId(EffectRunScript("", "op_rs_cleanprops", "", 0.0, sTag), nSpellIdToTrack);
}

// Sets the tracking ID used in EffectTrackItemProperties(). This means only that one
// will be actioned (and any removed in the same script won't).
void SetItemTrackingID(effect eAppliedEffect, object oItemOwner = OBJECT_INVALID, int nSpellIdToUse = SPELL_INVALID)
{
    if (nSpellIdToUse == SPELL_INVALID) nSpellIdToUse = nSpellId;
    if (oItemOwner == OBJECT_INVALID) oItemOwner = oTarget;

    SetLocalString(oItemOwner, "OVERHAUL" + IntToString(nSpellId), GetEffectLinkId(eAppliedEffect));
}

// Returns TRUE if the given effect matches the stored tracking ID
int GetItemTrackingIDMatches(effect eRunScript, object oTrackingParent = OBJECT_SELF)
{
    return (GetLocalString(oTrackingParent, "OVERHAUL" + IntToString(GetEffectSpellId(eRunScript))) == GetEffectLinkId(eRunScript));
}

// Returns a garanteed invalid, and otherwise useless, effect.
effect EffectInvalidEffect()
{
    effect eReturn;
    return eReturn;
}

// Gets an appropriate effect based on the target (PC or master is PC) and difficulty
// Works around some issues when some effects are buggy applied to PCs as well.
// Used for: Fear, Paralysis, Stun, Confusion, Charm, Dominate.
effect GetScaledEffect(effect eEffect, object oTarget)
{
    object oMaster = GetMaster(oTarget);
    if(GetIsPC(oTarget) || (GetIsObjectValid(oMaster) && GetIsPC(oMaster)))
    {
        int nDiff = GetGameDifficulty();
        switch (GetEffectType(eEffect))
        {
            case EFFECT_TYPE_FRIGHTENED:
            {
                if (nDiff == GAME_DIFFICULTY_VERY_EASY) return EffectAttackDecrease(2);
                if (nDiff == GAME_DIFFICULTY_EASY) return EffectAttackDecrease(4);
            }
            break;
            // Only affects DM "very easy" difficulty so meh why bother?
            case EFFECT_TYPE_PARALYZE:
            case EFFECT_TYPE_STUNNED:
            case EFFECT_TYPE_CONFUSED:
            {
                if (nDiff == GAME_DIFFICULTY_VERY_EASY) return EffectDazed();
            }
            break;
            case EFFECT_TYPE_CHARMED:
            case EFFECT_TYPE_DOMINATED:
            {
                return EffectDazed();
            }
            break;
        }
    }
    return eEffect;
}

// Gets difficulty based scaling of duration if the target is a PC. Has to be manually applied.
// Should be used for: Paralysis, Stun, Daze, Sleep, Charm, Domination (although the latter 2 get converted to Daze)
// * nDuratoinType - ROUNDS, MINUTES, HOURS
float GetScaledDuration(object oTarget, int nDuration, int nDurationType)
{
    float fDuration = GetDuration(nDuration, nDurationType);
    float fReturn = fDuration;
    if (GetIsPC(oTarget))
    {
        int nDiff = GetGameDifficulty();
        if (nDiff == GAME_DIFFICULTY_VERY_EASY || nDiff == GAME_DIFFICULTY_EASY)
        {
            fReturn = fDuration / 4;
        }
        else if (nDiff == GAME_DIFFICULTY_NORMAL)
        {
            fReturn = fDuration / 2;
        }
        if (fReturn < 6.0)
        {
            fReturn = 6.0;
        }
    }
    return fReturn;
}

// Retrieves the SHAPE_* value from spells.2da. Returns -1 on error.
int GetSpellShape(int nSpellId)
{
    switch (HashString(Get2DAString("spells", "TargetShape", nSpellId)))
    {
        case "sphere": return SHAPE_SPHERE; break;
        case "hspere": return SHAPE_HSPHERE; break;
        case "rectangle":
        {
            // There are 2 options, CUBE (same on each side, a kind of "square fireball")
            // or SPELLCYLINDER (lighting bolt etc.)
            if (Get2DAString("spells", "TargetSizeX", nSpellId) == Get2DAString("spells", "TargetSizeY", nSpellId))
            {
                return SHAPE_CUBE;
            }
            return SHAPE_SPELLCYLINDER;
        }
        break;
        case "cone":
            // Yes we have SHAPE_CONE but it needs investigating and we should
            // use this
            return SHAPE_SPELLCONE;
        break;
    }
    return -1;
}

// Retrieves the size value of a spells shape from spells.2da. Returns -1.0 on error.
// bX if TRUE uses TargetSizeX since for Cube and Spell Cylinders it's the X value that is relevant.
// If bX is false gets the TargetSizeY value
float GetSpellShapeSize(int nSpellId, int bX = TRUE)
{
    string sColumn = bX ? "TargetSizeX" : "TargetSizeY";

    string sSize = Get2DAString("spells", sColumn, nSpellId);

    if (sSize != "")
    {
        return StringToFloat(sSize);
    }
    return -1.0;
}

// Checks if any creature of the given target type is present in the given AOE at lCheckTarget (if not set defaults to lTarget).
// CURRENTLY DOES NOT SUPPORT RETANGLES LIKE BLADE BARRIER OR WALL OF FIRE
int GetIsTargetInAOEAtLocation(int nAOE, int nTargetType = SPELL_TARGET_SELECTIVEHOSTILE, location lCheckTarget = LOCATION_INVALID)
{
    if (!GetIsObjectValid(GetAreaFromLocation(lCheckTarget))) lCheckTarget = lTarget;

    // If fired at somewhere that has a enemy in the trigger already, we...just explode. I mean why not?
    float fRadius = StringToFloat(Get2DAString("vfx_persistent", "RADIUS", nAOE));

    if (fRadius == 0.0)
    {
        OP_Debug("[GetTargetInAOEAtLocation] AOE ref: " + IntToString(nAOE) + " has no radius set and this function only supports spheres right now.", LOG_LEVEL_ERROR);
        return FALSE;
    }
    // Simplest way that also adheres to LOS checks
    json jArray = GetArrayOfTargets(nTargetType, SORT_METHOD_NONE, OBJECT_TYPE_CREATURE, SHAPE_SPHERE, fRadius, lCheckTarget);
    if (JsonGetLength(jArray) > 0)
    {
        return TRUE;
    }
    return FALSE;
}

