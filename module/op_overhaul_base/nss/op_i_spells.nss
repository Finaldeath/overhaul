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
    nFeatId - The FEAT_* cast (or -1 if no feat used)
    nSpellType - The SPELL_TYPE_* that nSpellId is
    nSpellSchool - The spell school of nSpellId, used in DoResistSpell and other locations
    nSpellSaveDC - the Spell Save DC (if a proper spell)
    nCasterClass - Caster class
    nCasterLevel - the Caster Level
    nCasterAbilityModifier - The casters ability modifier bonus (eg Clerics Wisdom of 20, this would be 5).
    nMetaMagic - Metamagic feat
    nSpellLevel - Spell level
    bSpontaneous - Spontaneously cast or not
    bHostile - Hostile or not (set in spells.2da but some spells can be both!)
    bIllusionary - If a Shadow spell see op_s_shadow.nss (GetSpellTargetValid will do the will save)
        nIllusionaryStrength - eg: 20 = 20% strength.

    If these are altered later they are used in the ApplySpellEffectToObject() and
    ApplySpellEffectAtLocation() functions.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_constants"
#include "op_i_debug"
#include "op_i_eosconstant"
#include "op_i_feats"
#include "op_i_feedback"
#include "op_i_itemprops"
#include "op_i_runscript"
#include "utl_i_item"
#include "utl_i_maths"
#include "utl_i_strings"
#include "utl_i_creature"
#include "nw_inc_gff"

// Parameters you can set before executing a spell script (eg if not really firing one, or some other cases like
// one spell script firing another
const string SCRIPT_PARAMETER_SPELL_ID             = "SCRIPT_PARAMETER_SPELL_ID";              // Spell Id
const string SCRIPT_PARAMETER_ILLUSIONARY          = "SCRIPT_PARAMETER_ILLUSIONARY";           // Boolean
const string SCRIPT_PARAMETER_ILLUSIONARY_STRENGTH = "SCRIPT_PARAMETER_ILLUSIONARY_STRENGTH";  // 20 = 20% strength
const string SCRIPT_PARAMETER_SKIP_SPELL_HOOK      = "SCRIPT_PARAMETER_SKIP_SPELL_HOOK";       // Boolean, skips spell script hook

const int ROUNDS  = 0;
const int MINUTES = 1;
const int HOURS   = 2;

const int TOUCH_NONE   = 0;
const int TOUCH_MELEE  = 1;
const int TOUCH_RANGED = 2;

const int TOUCH_RESULT_MISS         = 0;
const int TOUCH_RESULT_HIT          = 1;
const int TOUCH_RESULT_CRITICAL_HIT = 2;

// For GetSpellTargetValid similar to Bioware's
const int SPELL_TARGET_ANYTHING         = 0;  // Anything. Most useful for spells like Dispel Magic.
const int SPELL_TARGET_ALLALLIES        = 1;  // Allies only
const int SPELL_TARGET_STANDARDHOSTILE  = 2;  // Standard hostile - IE: Will hit allies in certain PvP
const int SPELL_TARGET_SELECTIVEHOSTILE = 3;  // Selective hostile - IE: Will not hit allies

// DoSavingThrow does nothing if this is passed.
const int SAVING_THROW_NONE = -1;

// DoDispelMagic will essentially remove all effects if this is nCasterLevel. It's just a really high number.
const int CASTER_LEVEL_ALWAYS_SUCCEEDS = 1000000;

const int SORT_METHOD_NONE               = 0;  // Just doesn't bother sorting
const int SORT_METHOD_LOWEST_HP          = 1;
const int SORT_METHOD_LOWEST_HD          = 2;
const int SORT_METHOD_DISTANCE           = 3;  // Distance to AOE target
const int SORT_METHOD_DISTANCE_TO_CASTER = 4;
const int SORT_METHOD_RANDOM             = 5;

// Spell types (UserType column) stored in nSpellType
const int SPELL_TYPE_INVALID        = 0;  // Invalid setting! Error!!!
const int SPELL_TYPE_SPELL          = 1;  // Standard spell.
const int SPELL_TYPE_CREATURE_POWER = 2;  // Or "Spell ability". Uses HD for resist spell. Checks spell immunity.
const int SPELL_TYPE_FEAT           = 3;  // No resist spell/absorption checks are valid. Checks spell immunity.
const int SPELL_TYPE_ITEM_POWER     = 4;  // No resist spell/absorption checks are valid. Checks spell immunity.

// Extra shape types - more may come later for complex spells. Will include links to spells.2da
const int SHAPE_HSPHERE = 100;

// Tag used for persistent effects applied by AOEs, eg movement speed decreases on enter
const string TAG_AOEEFFECT = "AOEEFFECT";

// Fired using FireItemPropertySpellScript
const string ITEM_PROPERTY_SPELL_SCRIPT = "op_s_itemprop";

// For SignalSpellCastAt
const int SIGNAL_HOSTILE_TRUE = TRUE;
const int SIGNAL_HOSTILE_FALSE = FALSE;
const int SIGNAL_HOSTILE_FALSE_BUT_REALLY_TRUE = 2;  // Special for things like Charm etc. for illusion saves

// Just standardised numbers for AOEs which save-on-enter and if you re-enter and have saved you're then immune.
const int SAVE_NOT_DONE_YET  = 0;
const int SAVE_RESULT_FAILED = 1;
const int SAVE_RESULT_PASSED = 2;

const int SPELLABILITY_DC_VERY_EASY   = 0;
const int SPELLABILITY_DC_EASY        = 1;
const int SPELLABILITY_DC_EASY_MEDIUM = 2;
const int SPELLABILITY_DC_NORMAL      = 3;
const int SPELLABILITY_DC_HARD        = 4;

// Debug the spell and variables
int DebugSpellVariables();

// Main Spell Hook fired at the top of any spell script.
// Returns TRUE if the hook did something important, meaning the script shouldn't continue, eg: Crafting, Tensers checks, etc.
// Returns FALSE if the hook did nothing and we can run the spell script.
int DoSpellHook();

// Returns TRUE if this is a state script running since we can't test GetCurrentlyRunningEvent
int GetIsStateScript();

// Gets the item used to cast the spell. This only works in main spell scripts or run scripts not Area of Effects for now.
object GetSpellCastItemCalculated();

// This gets the caster, usually OBJECT_SELF, or if an AOE it's GetAreaOfEffectCreator().
object GetSpellCaster();

// This gets the spell ID but overrides it if we are calling a spell with ExecuteScript
// or in the case a Master spell is called we subsitute a random subspell (AI casting weirdness)
int GetSpellIdCalculated();

// This gets the SPELL_TYPE_* the spell ID is classified as (UserType column)
int GetSpellType(int nSpellIdToCheck);

// This gets if nSpellId is hostile or not using spells.2da
// If left at -1 uses the global value
int GetSpellIsHostile(int nSpellIdToCheck);

// This calculates the spell save DC for the given spell adding in bonuses and penalties as required
// For a AOE it uses the stored DC.
int GetSpellSaveDCCalculated(object oCaster, int nSpellIdToCheck, int nFeatId, object oCastItem, int nSpellType);

// Gets the given classes ability modifier or 0 if not a spellcasting class
// If oCastItem is valid we'll use the default stat modifier, 16, used for items currently.
int GetClassSpellcasterAbilityModifier(object oCaster, int nClass, object oCastItem = OBJECT_INVALID);

// This calculates the spell caster level for any additional bonuses due to feats or similar.
// For a AOE pass in it as the oCaster, then it uses the stored caster level.
int GetCasterLevelCalculated(object oCaster, int nSpellIdToCheck, int nFeatIdToCheck, int nCasterClassToCheck);

// Retrieves the metamagic used, in a spell script, AOE script or run script
int GetMetaMagicFeatCalculated(int nSpellId, int bIllusion);

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
//   Returns: 2 if the target was immune to the save type specified (only checked for Disease, Fear, Mind Spells, Poison, Trap and Paralysis subtypes)
// Note: If used within an Area of Effect Object Script (On Enter, OnExit, OnHeartbeat), you MUST pass GetAreaOfEffectCreator() into oSaveVersus!
// * nSavingThrow - put in SAVING_THROW_NONE to get a 0 return result.
int DoSavingThrow(object oTarget, object oSaveVersus, int nSavingThrow, int nDC, int nSaveType = SAVING_THROW_TYPE_NONE, float fDelay = 0.0);

// Returns the modified amount of nDamage based on the saving throw being successful for half (or more if reflex save and feats are involved).
int DoDamageSavingThrow(int nDamage, object oTarget, object oSaveVersus, int nSavingThrow, int nDC, int nSaveType = SAVING_THROW_TYPE_NONE, float fDelay = 0.0);

// Does an ability check with feedback to oTarget and oSource (oSource being the thing doing the check).
// Returns TRUE if oTarget passes the nDC check.
// If you use the optional ability parameters the highest will be chosen (eg put in Strength and Dexterity highest of both will be used).
int DoAbilityCheck(object oTarget, object oSource, int nDC, int nAbilityCheck, int nOptionalAbilityCheck = -1);

// Returns the modified amount of nDamage based on bSaved (usually half) and the feats oTarget has (Evasion etc.)
// * nSavingThrowType - SAVING_THROW_REFLEX affects the feats, and other types may affect
//                      it in the future.
int GetDamageBasedOnFeats(int nDamage, object oTarget, int nSavingThrowType, int bSaved);

// Used to route the resist magic checks into this function to check for spell countering by SR, Immunity, Globes or Mantles.
// Now a simple TRUE if spell resisted/immune/absorbed, or FALSE otherwise.
// Can now be called in a "non-true spell" so be careful and don't use in monster ability scripts.
int DoResistSpell(object oTarget, object oCaster, float fDelay = 0.0, int bResistCheck = TRUE, int bImmunityCheck = TRUE, int bAbsorbCheck = TRUE);

// Gets the assay resistance bonus to caster level for oCaster if it is affecting oTarget
int GetAssayResistanceBonus(object oTarget, object oCaster);

// Does a relevant touch attack. Some classes add bonuses to touch attacks, which can be added in here.
// - nType can be TOUCH_MELEE or TOUCH_RANGED. If TOUCH_NONE it simply returns TOUCH_RESULT_HIT with no feedback.
// Return value: TOUCH_RESULT_* (HIT, MISS or CRITICAL_HIT).
int DoTouchAttack(object oTarget, object oVersus, int nType, int bDisplayFeedback = TRUE);

// Applies Dispel Magic to the given target (Area of Effects, Items on the ground and equipped and Summoned Monsters are also handled)
// If nCasterLevel is CASTER_LEVEL_ALWAYS_SUCCEEDS then it'll be a high number, that should pass all checks (use for Antimagic Ray etc.)
void DoDispelMagic(object oTarget, int nCasterLevel, int nVis = VFX_INVALID, float fDelay = 0.0, int bAll = TRUE, int bBreach = FALSE);

// Performs a spell breach up to nTotal spell are removed and nSR spell resistance is lowered.
void DoSpellBreach(object oTarget, int nTotal, int nSR, int bVFX = TRUE);

// Gets if the spell script is illusionary (script param SCRIPT_PARAMETER_ILLUSIONARY set to "1")
int GetSpellIsIllusionary();

// Gets the illusionary strength of the current script call. Not relevant if not an
// illusion spell. 20 would be 20% strength if they save a will save.
int GetSpellIllusionaryStrength(int bIllusionary);

// Checks if oTarget failed the will save done in GetSpellTargetValid() when they
// were checked. Can affect GetStaticValue/GetDiceRoll/GetDuration.
int GetTargetIllusionarySave(object oTarget);

// Does (and stores) the Will saving throw for illusion saves.
// For now only affects spells marked as Hostile.
void DoIllusionSavingThrow(object oTarget, object oCaster);

// Gets a modified value for nValue (minimum 1). Use if GetTargetIllusionarySave is TRUE.
int GetIllusionModifiedValue(int nValue);

// Checks if oTarget is affected by the current spell (if it's an illusion).
// If they save and it's 40% strong then 40% chance to be affected.
// Use those spells which have a single type of effect (Eg Death, or Web's per-round effect) to not apply at all.
// For spells with a variable duration or damage use GetDuration and GetDiceRoll/GetStaticValue instead.
int GetAffectedByIllusion(object oTarget);

// This gets a static numeric value, usually it just returns nValue but if it's an illusion spell it can return
// Run this AFTER GetArrayOfTargets/GetSpellTargetValid since that does the illusion save (if needed).
int GetStaticValue(int nValue);

// Applies metamagic to the given dice roll. Run this AFTER GetArrayOfTargets/GetSpellTargetValid since that does the illusion save (if needed).
// eg GetDiceRoll(4, 6, 8) will roll 4d6 and add 8 to the final roll
// Metamagic is applied automatically unless bApplyMetaMagic is FALSE.
// Illusion changes are applied if it is from an illusion spell and they passed a save.
int GetDiceRoll(int nNumberOfDice, int nDiceSize, int nBonus = 0, int bApplyMetaMagic = TRUE);

// Applies metamagic to the given duration
// * nType - The conversion used, ROUNDS (6 seconds), MINUTES ("1 turn" in old NWN = 1 minute/10 rounds) or HOURS (module dependant)
// * bApplyMetaMagic - Metamagic is applied automatically unless bApplyMetaMagic is FALSE.
// * bCheckIllusionSave - If TRUE Illusion changes are applied if it is from an illusion spell and they passed a save.
float GetDuration(int nDuration, int nDurationType, int bApplyMetaMagic = TRUE, int bCheckIllusionSave = TRUE);

// Checks if the given target is valid to be targeted by oCaster.
// - nTargetType:
//      SPELL_TARGET_ANYTHING - Any target is valid. Useful for spells needing to target allies with on effect and enemies with another.
//      SPELL_TARGET_ALLALLIES - Any allies (GetIsFriend / GetFactionEqual).
//      SPELL_TARGET_SELECTIVEHOSTILE - Only enemies (GetIsEnemy)
//      SPELL_TARGET_STANDARDHOSTILE - Enemies, and neutrals/allies based on PvP (!GetIsReactionTypeFriendly()).
// This additionally, if the spell is illusionary, do a will saving throw for the illusion check
// if the target is valid.
int GetSpellTargetValid(object oTarget, object oCaster, int nTargetType);

// Converts a SAVING_THROW_TYPE_* to an IMMUNITY_TYPE_* where these are checked for in the saving throw functions (Disease, Fear, Mind Spells, Poison, Trap and Paralysis subtypes)
// else it will be IMMUNITY_TYPE_NONE (0)
int GetImmunityTypeFromSavingThrowType(int nSaveType);

// Check and do immunity for the given immunity type.
// It also provides feedback to the given creatures if valid.
// If nImmunityType is IMMUNITY_TYPE_NONE this automatically fails (ie they're not immune).
// * bCheckMindImmunity - If TRUE then those effects that IMMUNITY_TYPE_MIND_SPELLS covers are also checked for IMMUNITY_TYPE_MIND_SPELLS (Fear, etc.)
int GetIsImmuneWithFeedback(object oCreature, object oVersus, int nImmunityType, int bCheckMindImmunity = TRUE);

// Returns TRUE if oCreature is immune to petrification and sends some feedback message to that effect.
int GetIsImmuneToPetrificationWithFeedback(object oCreature);

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

// Applies the given Beam/Ray effect to oTarget. Does it as an unyielding effect so even if they die it'll persist.
// - nBeam - visualeffects.2da line (is checked if it is a beam)
// - oTarget - Target of the beam
// - bMissEffect - Beam hits or not
// - nBodyPart - BODY_NODE_* the beam originates from (default: HAND)
// - fDuration - If 0.0 it isues the nSpellId's spells.2da CastTime value to look proper
// - oEffector - The source of the beam. Defaults to oCaster if invalid.
void ApplyBeamToObject(int nBeam, object oTarget, int bMissEffect = FALSE, int nBodyPart = BODY_NODE_HAND, float fDuration = 0.0, object oEffector = OBJECT_INVALID);

// Applies the given VFX effect to oTarget.
// - nVFX - visualeffects.2da line (cannot be a Beam type). Use VFX_NONE to have this function be ignored.
// - oTarget - Target of the VFX
// - bMissEffect - VFX hits or not
// - fDuration - If 0.0 it applies it instantly, or applies it for a given duration.
// Usual scale and translate values as well.
void ApplyVisualEffectToObject(int nVFX, object oTarget, int bMissEffect = FALSE, float fDuration = 0.0, float fScale = 1.0f, vector vTranslate = [ 0.0, 0.0, 0.0 ], vector vRotate = [ 0.0, 0.0, 0.0 ]);

// Applies the given VFX effect to oTarget.
// - nVFX - visualeffects.2da line. Must be not a DUR or BEAM type. Use VFX_NONE to have this function be ignored.
// - lTarget - Target of the VFX
// - bMissEffect - VFX hits or not
// Usual scale and translate values as well.
void ApplyVisualEffectAtLocation(int nVFX, location lTarget, int bMissEffect = FALSE, float fScale = 1.0f, vector vTranslate = [ 0.0, 0.0, 0.0 ], vector vRotate = [ 0.0, 0.0, 0.0 ]);

// Applies the given VFX effect at oTargets current location. Safer to use on CreateObject or in a DelayCommand if oTarget is moving.
// - nVFX - visualeffects.2da line. Must be not a DUR or BEAM type. Use VFX_NONE to have this function be ignored.
// - lTarget - Target of the VFX
// - bMissEffect - VFX hits or not
// Usual scale and translate values as well.
void ApplyVisualEffectAtObjectsLocation(int nVFX, object oTarget, int bMissEffect = FALSE, float fScale = 1.0f, vector vTranslate = [ 0.0, 0.0, 0.0 ], vector vRotate = [ 0.0, 0.0, 0.0 ]);

// Applies damage of the given type. This helps wrapper delayed damage so we can keep at 1 HP if necessary (Harm/Heal).
void ApplyDamageToObject(object oTarget, int nDamage, int nDamageType = DAMAGE_TYPE_MAGICAL, int nDamagePower = DAMAGE_POWER_NORMAL, int bKeepAt1HP = FALSE);

// Applies damage to the oTarget which is enough to kill them (HP + 10) plus VFX.
void ApplyDeathDamageToObject(object oTarget, int nVFX, int nDamageType = DAMAGE_TYPE_MAGICAL, int nDamagePower = DAMAGE_POWER_NORMAL);

// Applies damage of the given type, and heals up to the damage done to oCaster (after resistances/immunities).
// Must be a creature for it it work.
void ApplyDamageWithVFXToObjectAndDrain(object oTarget, object oCaster, int nVFX, int nDamage, int nDamageType = DAMAGE_TYPE_MAGICAL, int nDamagePower = DAMAGE_POWER_NORMAL);

// Applies damage of the given type, and adds temp HP up to the damage done to oCaster (after resistances/immunities).
// Must be a creature for it it work.
void ApplyDamageWithVFXToObjectAndTempHP(object oTarget, object oCaster, int nVFX, int nDamage, float fDuration, int nDamageType = DAMAGE_TYPE_MAGICAL, int nDamagePower = DAMAGE_POWER_NORMAL);

// Applies damage of the given type. This helps wrapper delayed damage so we can keep at 1 HP if necessary (Harm/Heal).
// * Also applies nVFX (no miss effect or anything special).
void ApplyDamageWithVFXToObject(object oTarget, int nVFX, int nDamage, int nDamageType = DAMAGE_TYPE_MAGICAL, int nDamagePower = DAMAGE_POWER_NORMAL, int bKeepAt1HP = FALSE);

// Applies eEffect to oTarget, if it hasn't got it from this spell ID AOE already
// If bApplyRunScript is set, it also attaches the RunScript to remove it later (if no more AOEs are affecting them).
// NOTE: Not necessarily perfect; eg if failing a save applies a movement speed effect in a given AOE, moving out of that one
// into the same AOE but one you've passed will retain the movement speed decrease. It will do for now though.
// - The run script "op_rs_aoecleanup" with a 6 second interval script attached that can be used to apply fair "per round" effects and check
//   if the AOE or creator of the AOE exists still
// - Attaches a negative cessate VFX
// The above and the eEffect:
// - Tags it with the OBJECT_SELF's OID if RunScript or AOEEFFECT if not
// - Makes it extraordinary
// - Applies it for a very long temporary duration
// Apply these effects only once (ie OnEnter). Don't tag an effect as AOEEFFECT, and it'll be left alone (eg temporary stuns/entangles).
void ApplyAOEPersistentEffect(object oTarget, effect eEffect, int bApplyRunScript = TRUE);

// Removes persistent RunScripts from oTarget that are applies to oTarget tagged with OBJECT_SELF's OID (ie the AOE's).
// Call in an AOE's OnExit event or op_r_aoecleanup.
// Returns the amount of persistent effects tagged. So if 1+ it is the last AOE they've exited of this type.
// * nOverrideSpellId - Leave as default usually, if set is special cases like Amplify and Silence interacting
int RemovePersistentAOEEffects(object oTarget, int nOverrideSpellId = -1);

// Returns TRUE if we are OK running our AOE scripts (or the EffectRunScript created by an AOE).
// Does a check for the AOE creator, and destroys ourself (or removes the EffectRunScript) if they no longer exist.
// Call in the OnEnter, OnHeartbeat of an AOE scripts or the Interval of the EffectRunScript created by the AOE.
// This might be removed later (D&D AOEs should probably persist past their creators death) but for now will stop some bugs and is tidier.
int AOECheck();

// Signals a spell cast event.
// By default if the default parameters are used then the global automatically
// generated values are used instead.
// * bSignalHostile - If not -1 use SIGNAL_HOSTILE_TRUE, SIGNAL_HOSTILE_FALSE and SIGNAL_HOSTILE_FALSE_BUT_REALLY_TRUE as values so that
//                    illusion saves are done correctly.
void SignalSpellCastAt(object oSignalTarget = OBJECT_INVALID, object oSignalCaster = OBJECT_INVALID, int bSignalHostile = -1, int nSignalSpellId = -1);

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
// It also does a check for "Supress with Target" and if that flag is on we are NOT an area of effect if oTarget is valid.
int GetSpellIsAreaOfEffect(int nSpellId);

// Returns a human readable name for the given effect (eg: "Fear" or "Negative Level").
string GetEffectName(effect eEffect);

// Check if oCreature is not silenced or deaf
int GetCanHear(object oCreature);

// Check if oCreature is silenced
int GetCanSpeak(object oCreature);

// Returns TRUE if oCreature is affected by polymorph
int GetIsPolymorphed(object oCreature);

// Returns TRUE if oCreature is of the given RACIAL_TYPE_
// Checks the given racial type, and if they're not polymorphed, the relevant class levels
int GetIsRacialType(object oCreature, int nRacialType);

// Returns TRUE if the given creature is incorporeal (generally based off their appearance).
int GetIsIncorporeal(object oCreature);

// Returns TRUE if the given creature is made of metal (eg Iron Golem) based off appearance.
int GetIsMetalCreature(object oCreature);

// Returns TRUE if the given creature is humanoid (base races plus humanoid races; goblinoid, monsterous, orc, reptilian)
int GetIsHumanoidCreature(object oCreature);

// Returns TRUE if the given creature is mindless (Elemental, Undead, Vermin, Construct, Ooze)
int GetIsMindless(object oCreature);

// Returns TRUE if the given creature is flying / floating
int GetIsFlying(object oCreature);

// Returns TRUE if the given creature is living (not undead, not construct)
int GetIsLiving(object oCreature);

// Returns TRUE if the given creature is a water elemental (Based on appearance)
int GetIsWaterElemental(object oCreature);

// Returns TRUE if the given creature is a vampire (Based on appearance, plus subrace string)
int GetIsVampire(object oCreature);

// Returns TRUE if the target has legs (ala Called Shot: Legs can target them)
int GetHasLegs(object oCreature);

// Returns TRUE if the target has arms (ala Called Shot: Arms can target them)
int GetHasArms(object oCreature);

// Returns TRUE if oObject has at least one effect matching the parameters.
// * nEffectType - Can be EFFECT_TYPE_ALL to be ignored
// * sTag - Only checked if not blank
int GetHasEffect(object oObject, int nEffectType, int nSpellId = SPELL_ANY, string sTag = "");

// Returns TRUE if oCreature has at least one effect matching the parameters.
int GetHasEffectOrItemProperty(object oCreature, int nEffectType, int nItemPropertyType);

// Removes effects from the given spell ID. Returns TRUE if one was removed.
// * nSpellId - If SPELL_ANY it will remove any spell Id. -1 or SPELL_INVALID is "Invalid spell ID" so technically still a subset of effects.
// * sTag - If set the tag must match
// * nEffectType - If set the effect type must match
int RemoveEffectsFromSpell(object oObject, int nSpellId, int nEffectType = EFFECT_TYPE_ALL, string sTag = "");

// Finds the duration remaining of the given spell on oObject
float GetRemainingDurationOfSpell(object oObject, int nSpellId);

// Finds the duration remaining of the given effects of nType on oObject
float GetRemainingDurationOfEffects(object oObject, int nType);

// Cures a JsonArray of integer effects with some caveats:
// - oTarget - Creature to cure
// - jArray - The array of EFFECT_TYPE_* integers to remove. Note:
//         EFFECT_TYPE_ABILITY_DECREASE - Only removes non-poison, non-disease based ones
//         EFFECT_TYPE_POISON / EFFECT_TYPE_DISEASE - We clean up any poison/disease ability score decreases as well
// - bSuperanturalRemoval - If FALSE it will not remove Supernatural effects.
// Returns TRUE if at least one effect was removed.
int CureEffects(object oTarget, json jArray, int bSupernaturalRemoval = FALSE);

// Cures nSpellId from oTarget with appropriate feedback
// Returns TRUE if at least one effect was removed.
int CureEffectsFromSpell(object oTarget, int nSpellId);

// If a single target spell checks for nTargetType against global oTarget and adds them to a single object array if so.
// Else if AOE loops through relevant shape to get all the targets in it. It then sorts them using nSortMethod.
// - nTargetType - The SPELL_TARGET_* type to check versus oCaster
// - nSortMethod - The sorting method to apply once all the creatures are added.
//                 SORT_METHOD_NONE      - No sorting (slightly faster)
//                 SORT_METHOD_LOWEST_HP - Sorts so first object is the lowest HP
//                 SORT_METHOD_LOWEST_HD - Sorts so first object is the lowest HD
//                 SORT_METHOD_DISTANCE  - Sorts so the first object is the lowest distance to AOE target location
//                 SORT_METHOD_DISTANCE_TO_CASTER - Sorts so first object is lowest distance to caster
//                 SORT_METHOD_RANDOM    - Intentionally randomises the targets (useful to make it look cooler for Chain Lighting etc.)
// The other variables can be set, but if not then the current Spell Id will sort the shape and size.
// NOTE: if oTargetToIgnore is set it'll be not returned by this array. Use it to
// apply one effect to the primary target, and a different one to secondary ones.
json GetArrayOfTargets(int nTargetType, int nSortMethod = SORT_METHOD_DISTANCE, int nObjectFilter = OBJECT_TYPE_CREATURE, object oTargetToIgnore = OBJECT_INVALID, int nShape = -1, float fSize = -1.0, location lArrayTarget = LOCATION_INVALID, int bLineOfSight = TRUE, vector vOrigin = [ 0.0, 0.0, 0.0 ]);

// Loops through the persistent AOE to get all the targets in it. It then sorts them using nSortMethod.
// - nTargetType - The SPELL_TARGET_* type to check versus oCaster
// - nSortMethod - The sorting method to apply once all the creatures are added.
//                 SORT_METHOD_NONE      - No sorting (slightly faster)
//                 SORT_METHOD_LOWEST_HP - Sorts so first object is the lowest HP
//                 SORT_METHOD_LOWEST_HD - Sorts so first object is the lowest HD
//                 SORT_METHOD_DISTANCE  - Sorts so the first object is the lowest distance to AOE target location
//                 SORT_METHOD_DISTANCE_TO_CASTER - Sorts so first object is lowest distance to caster
//                 SORT_METHOD_RANDOM    - Intentionally randomises the targets (useful to make it look cooler for Chain Lighting etc.)
// - bTargetSelf - If FALSE we won't ever get ourself into the array
// * NOTE: Returns just oTarget if the script running is the AOE's OnEnter.
json GetArrayOfAOETargets(int nTargetType, int nSortMethod = SORT_METHOD_DISTANCE, int nObjectFilter = OBJECT_TYPE_CREATURE, int bTargetSelf = TRUE);

// Gets the given Object stored as FIELD_OBJECTID in jArray at nIndex
object GetArrayObject(json jArray, int nIndex);

// Returns a EffectRunScript with extra data appended. Will NOT set an apply script since you can run things in the current script.
// The data field in the effect will be set with information that isn't set on the effect, and retrieved
// automatically, eg: nMetaMagic, nSpellSaveDC, nSpellLevel
// - bAutomatic - Will use current script name for both scripts and a 6.0 second interval
effect EffectRunScriptEnhanced(int bAutomatic = TRUE, string sRemovedScript = "", string sInteveralScript = "", float fInterval = 0.0);

// This tags the given effect with JSON_FIELD_* information and returns it
// * bCannotBeCured - If set to TRUE the effect won't be curable. eg: Barbarian Rage.
effect EffectTagWithMetadata(effect eEffect, int bCannotBeCured = FALSE);

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

// Retrieves the effects "Can it be removed by CureEffect"? EG to stop Barbarian Rage being "cured" (need to be set with EffectTagWithMetadata)
int GetEffectTaggedCannotBeCured(effect eEffect);

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

// Create a rising or falling pillar with a certain visual effect. Looks cool
// but quite expensive on the graphics engine, so don't get too mad with it
void TLVFXPillar(int nVFX, location lStart, int nIterations = 3, float fDelay = 0.1f, float fZOffset = 6.0f, float fStepSize = -2.0f);

// Gets the generated AOE. It is specifically one matching the tag, near the target location, that this creator did
// Then you can sort it with some additional local variables.
object GetGeneratedAOE(int nAOE);

// Fires the ITEM_PROPERTY_SPELL_SCRIPT file, after making sure the spell hook will be ignored using the SPELL_HOOK_IGNORE script parameter
void FireItemPropertySpellScript();

// Retrieves the correct DAMAGE_POWER_PLUS_* constant based on the input integer.
// Used for EffectDamageReduction and some item properties and other things.
// Returns DAMAGE_POWER_PLUS_ONE by default.
int GetDamagePowerPlusValue(int nPower);

// Retrieves the correct DAMAGE_BONUS_* constant based on the input integer.
// Used for EffectDamageIncrease and related item properites.
// Returns DAMAGE_BONUS_1 by default, and a maximum of DAMAGE_BONUS_20.
int GetDamageBonusValue(int nBonus);

// Gets the creature size modifier for grapple and bull rush
// If oCreature is invalid it uses nCreatureSize
int GetCreatureSizeModifier(object oCreature = OBJECT_INVALID, int nCreatureSize = CREATURE_SIZE_MEDIUM);

// Gets the creature size modifier for attack rolls
// If oCreature is invalid it uses nCreatureSize
int GetCreatureSizeAttackModifier(object oCreature = OBJECT_INVALID, int nCreatureSize = CREATURE_SIZE_MEDIUM);

// Does a grapple check based on the input characteristics along with feedback to the target/caster
// Grapple checks are made with an opposed roll;
//     oGrappler: 1d20 + bab + strength modifier + size modifier
// vs. oGrappled: 1d20 + base attack bonus + strength modifier + size modifier.
// Returns TRUE if oGrappler manages to grapple oGrappled (ties go to oTarget)
int DoGrappleCheck(object oGrappled, object oGrappler, int nGrapplerBAB, int nGrapplerStrengthModifier, int nGrapplerSize = CREATURE_SIZE_MEDIUM);

// Bull rush checks are made with an opposed roll;
//   oBullRusher: 1d20 + strength modifier + size modifier + charge bonus
// vs. oDefender: 1d20 + strength modifier + size modifier.
// Returns TRUE if oTarget is rushed by oBullRusher (ties defender wins)
int DoBullRushCheck(object oDefender, object oBullRusher, int nBullRusherStrengthModifier, int nBullRusherSize = CREATURE_SIZE_MEDIUM, int nBullRusherChargeBonus = 2);

// Attack checks are made with an opposed roll (with a critical only on a 20);
//   oAttacker: 1d20 + BAB (or caster level) + ability modifier (strength or if a spell can be int, etc.)
//              + misc modifier (eg: Bigby hand size modifier, attack bonuses, etc.) + size modifier
// vs. oTarget: AC
// Returns 0 on miss, 1 on hit or 2 on critical hit
int DoAttackRoll(object oTarget, object oAttacker, int nAttackerBAB, int nAttackerAbilityModifier, int nAttackerMiscModifier, int nAttackerSize = CREATURE_SIZE_MEDIUM);

// Used for the scaling DC of various monster abilities.
// If they are polymorphed it will check for shifter / druid levels.
// Parameters:
// oCaster       - The Shifter. If there are no shifter levels it will default to their HD.
// nDCConst      - SPELLABILITY_DC_VERY_EASY   = 10 + levels / 3
//                 SPELLABILITY_DC_EASY        = 10 + levels / 2
//                 SPELLABILITY_DC_EASY_MEDIUM = 12 + levels / 2
//                 SPELLABILITY_DC_NORMAL      = 15 + levels / 2
//                 SPELLABILITY_DC_HARD        = 10 + levels
// bAddDruidLevels - Take druid levels into account if a polymorphed ability
int GetSpellabilitySaveDC(object oCaster, int nDCConst = SPELLABILITY_DC_NORMAL, int bAddDruidLevels = FALSE);

// Clones oCreature and returns the resulting clone. It will also fix it so it isn't considered a PC, and clears the inventory.
// Equipped items are marked to not be droppable as well just in case.
// * fMaxHPPercent - The percentage of HP to have the clone set to
object CreateClone(object oCreature, location lSpawn, float fMaxHPPercent = 100.0);

// These global variables are used in most spell scripts and are initialised here to be consistent
// NB: You can't reuse these variables in the very functions in this list, so we pass them in.
int bIllusionary           = GetSpellIsIllusionary();
int nIllusionaryStrength   = GetSpellIllusionaryStrength(bIllusionary);
int bDoneSpellTargetValid  = FALSE; // If true we've done GetSpellTargetValid at least once. Debugs illusion functions.
object oCastItem           = GetSpellCastItemCalculated();
object oCaster             = GetSpellCaster();
object oTarget             = GetSpellTargetObjectCalculated();
location lTarget           = GetSpellTargetLocationCalculated(oTarget);
int nSpellId               = GetSpellIdCalculated();
int nFeatId                = GetSpellFeatId();
int nSpellType             = GetSpellType(nSpellId);
int nSpellSchool           = GetSpellSchool(nSpellId);
int nSpellSaveDC           = GetSpellSaveDCCalculated(oCaster, nSpellId, nFeatId, oCastItem, nSpellType);
int nCasterClass           = GetLastSpellCastClassCalculated();
int nCasterLevel           = GetCasterLevelCalculated(oCaster, nSpellId, nFeatId, nCasterClass);
int nCasterAbilityModifier = GetClassSpellcasterAbilityModifier(oCaster, nCasterClass, oCastItem);
int nMetaMagic             = GetMetaMagicFeatCalculated(nSpellId, bIllusionary);
int nSpellLevel            = GetLastSpellLevelCalculated();
int bSpontaneous           = GetSpellCastSpontaneouslyCalculated();
int bHostile               = GetSpellIsHostile(nSpellId);

// Debug the spell and variables
int DebugSpellVariables()
{
    if (DEBUG_LEVEL >= INFO)
    {
        Debug("[Spell Script] Script:" + GetStringColoredRGB("[" + GetScriptName() +
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
                                                                 "] nIllusionaryStrength: [" + IntToString(nIllusionaryStrength) + "]",
                                                             255, 255, 255));
        return TRUE;
    }
    return FALSE;
}

// Main Spell Hook fired at the top of any spell script.
// Returns TRUE if the hook did something important, meaning the script shouldn't continue, eg: Crafting, Tensers checks, etc.
// Returns FALSE if the hook did nothing and we can run the spell script.
int DoSpellHook()
{
    // We can skip this script (eg if fired from another spell that's already done it)
    string sParam = GetScriptParam(SCRIPT_PARAMETER_SKIP_SPELL_HOOK);
    if (sParam != "") return FALSE;

    // Debug spell if logging enabled
    DebugSpellVariables();

    // Do not do the hook if this is an illusion spell executing it's payload script
    if (bIllusionary)
    {
        // While we  don't do anything else we do validate the metamagic we have versus what we are allowed when nMetaMagic is calculated.
        return FALSE;
    }

    // We do not do the spell if it is a true spell and Tensers Transformation is
    // on the caster (ie user of the item)
    if (nSpellType == SPELL_TYPE_SPELL)
    {
        if (GetHasSpellEffect(SPELL_TENSERS_TRANSFORMATION, oCaster))
        {
            FloatingTextStringOnCreature("*Spell casting failed*", oCaster, FALSE);
            SendMessageToPC(oCaster, "*You cannot cast spells or use spells on items when under the effects of Tensers Transformation*");
            ApplyVisualEffectToObject(VFX_FNF_SPELL_FAIL_HAND, oCaster);
            return TRUE;
        }
    }

    // We do not allow potions under the effect of Iron Body
    if (GetIsObjectValid(oCastItem))
    {
        switch (GetBaseItemType(oCastItem))
        {
            case BASE_ITEM_BLANK_POTION:
            case BASE_ITEM_ENCHANTED_POTION:
            case BASE_ITEM_POTIONS:
            {
                if (GetHasSpellEffect(SPELL_IRON_BODY, oCaster))
                {
                    FloatingTextStringOnCreature("*Potion quaffing failed*", oCaster, FALSE);
                    SendMessageToPC(oCaster, "*You cannot quaff potions when under the effects of Iron Body*");
                    // Using potions on other just in case catch statement
                    if (oCaster != oTarget) SendMessageToPC(oTarget, "*You cannot quaff potions when under the effects of Iron Body*");
                    ApplyVisualEffectToObject(VFX_FNF_SPELL_FAIL_HAND, oCaster);
                    return TRUE;
                }
            }
        }
    }

    // TODO Need to have:
    // * Item crafting (scrolls/potions)
    // * Cases spells shouldn't be able to be cast (null magic areas)
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
            Debug("[GetSpellCaster] Invalid cast item for run script effect.", ERROR);
        }
        return GetEffectCreator(GetLastRunScriptEffect());  // TODO
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
            Debug("[GetSpellCaster] Invalid caster for run script. Applied script?", ERROR);
        }
        return GetEffectCreator(GetLastRunScriptEffect());
    }
    return OBJECT_SELF;
}

// This gets the spell ID but overrides it if we are calling a spell with ExecuteScript
// or in the case a Master spell is called we subsitute a random subspell (AI casting weirdness)
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
        if (GetEffectType(GetLastRunScriptEffect()) != EFFECT_TYPE_RUNSCRIPT)
        {
            Debug("[GetSpellIdCalculated] Invalid effect for run script.", ERROR);
        }
        return GetEffectSpellId(GetLastRunScriptEffect());
    }

    // Get the main spell Id from spell script/AOE script
    // TODO: Maybe add some error checks here (shouldn't be anything other than
    // a spell script or a AOE script at this point!)
    int nReturn = GetSpellId();

    // If it is a master spell we need to randomly get a subspell
    string sSubSpell = Get2DAString("spells", "SubRadSpell1", nReturn);

    if (sSubSpell != "")
    {
        // Randomise depending on the highest one
        int nSubSpell, nHighestSubSpell = 1;
        for (nSubSpell = 8; nSubSpell >= 1; nSubSpell--)
        {
            if (Get2DAString("spells", "SubRadSpell" + IntToString(nSubSpell), nReturn) != "")
            {
                nHighestSubSpell = nSubSpell;
                break;
            }
        }
        // Randomise choice
        int nChoice = Random(nHighestSubSpell) + 1;
        sSubSpell = Get2DAString("spells", "SubRadSpell" + IntToString(nChoice), nReturn);

        if (sSubSpell == "")
        {
            Debug("[GetSpellIdCalculated] Error: Found random subspell to be invalid? Column: SubRadSpell" + IntToString(nChoice), ERROR);
        }
        else
        {
            Debug("[GetSpellIdCalculated] Info: Replaced master spell with subspell: " + sSubSpell);
            nReturn = StringToInt(sSubSpell);
        }
    }
    return nReturn;
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
    Debug("[GetSpellType] Invalid UserType column!", ERROR);
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
// For a AOE it uses the stored DC.
int GetSpellSaveDCCalculated(object oCaster, int nSpellId, int nFeatId, object oCastItem, int nSpellType)
{
    if (nSpellId == SPELL_INVALID) return 0;

    if (GetIsObjectValid(oCastItem) && nSpellType == SPELL_TYPE_ITEM_POWER)
    {
        // Find the On Hit: Cast Spell property if available
        itemproperty ipCheck = GetFirstItemProperty(oCastItem);
        while (GetIsItemPropertyValid(ipCheck))
        {
            if (GetItemPropertyType(ipCheck) == ITEM_PROPERTY_ONHITCASTSPELL)
            {
                int nSaveDC = GetItemPropertySpellSaveDC(ipCheck);

                if (nSaveDC > 0) return nSaveDC;
            }
            ipCheck = GetNextItemProperty(oCastItem);
        }

        // Default back to base spell save DC if for some reason not found
        return GetSpellSaveDC();
    }
    // Run script stores the save DC
    else if (GetLastRunScriptEffectScriptType() != 0)
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
    else if (GetSpellLevel(nSpellId) == 10)
    {
        // Epic Spells get a special calculation;
        // * 20 (10 + level 10 spell) + ability score of the caster + evocation feats
        // For now we just get the highest spellcasting class. Can make it more constrained or
        // accurate (checking feat lists with Json, ie who took the feat) later
        int nClassPosition, nHighestCasterClass = CLASS_TYPE_INVALID, nHighestCasterClassLevel = 0;
        for (nClassPosition = 1; nClassPosition <= 8; nClassPosition++)
        {
            int nClass = GetClassByPosition(nClassPosition, oCaster);
            if (nClass != -1)
            {
                if (Get2DAString("classes", "SpellCaster", nClass) == "1")
                {
                    if (GetLevelByClass(nClass, oCaster) > nHighestCasterClassLevel)
                    {
                        nHighestCasterClass = nClass;
                        nHighestCasterClassLevel = GetLevelByClass(nClass, oCaster);
                    }
                }
            }
        }
        // Dummy fallback (eg DM casting/cheat cast, use first class slot)
        if (nHighestCasterClass == CLASS_TYPE_INVALID)
        {
            nHighestCasterClass = GetClassByPosition(0, oCaster);
        }
        // Now use the class to get the data
        // Not a spellcaster? oh well!
        int nAbilityModifier = GetClassSpellcasterAbilityModifier(oCaster, nHighestCasterClass);
        int nSpellSchool = GetSpellSchool(nSpellId);
        int nFeatBonus = GetSpellFocusBonus(oCaster, nSpellSchool);

        return 20 + nAbilityModifier + nFeatBonus;
    }

    // Default fallback is a spell script which can have altered values for the save DC
    int nSpellSaveDC = GetSpellSaveDC();

    // Modifications due to casters feats etc. would go here

    // Need to save it back to AOE's...somehow

    return nSpellSaveDC;
}

// Gets the given classes ability modifier or 0 if not a spellcasting class
// If oCastItem is valid we'll use the default stat modifier, 16, used for items currently.
int GetClassSpellcasterAbilityModifier(object oCaster, int nClass, object oCastItem = OBJECT_INVALID)
{
    // Use a stat modifier of 3 (for a base 16 stat) if casting from an item, or cheat casting
    if (GetIsObjectValid(oCastItem) ||
        nClass == CLASS_TYPE_INVALID) return 3;

    // Not a spellcaster? oh well!
    int nAbilityModifier = 0;
    switch (HashString(Get2DAString("classes", "SpellcastingAbil", nClass)))
    {
        case "STR": nAbilityModifier = GetAbilityModifier(ABILITY_STRENGTH, oCaster); break;
        case "DEX": nAbilityModifier = GetAbilityModifier(ABILITY_DEXTERITY, oCaster); break;
        case "CON": nAbilityModifier = GetAbilityModifier(ABILITY_CONSTITUTION, oCaster); break;
        case "WIS": nAbilityModifier = GetAbilityModifier(ABILITY_WISDOM, oCaster); break;
        case "INT": nAbilityModifier = GetAbilityModifier(ABILITY_INTELLIGENCE, oCaster); break;
        case "CHA": nAbilityModifier = GetAbilityModifier(ABILITY_CHARISMA, oCaster); break;
    }
    return nAbilityModifier;
}

// Checks if the given nClass has arcane spell casting (is a spellcaster and that spellcasting is arcane).
int GetClassIsArcaneCaster(int nClass)
{
    if (Get2DAString("classes", "SpellCaster", nClass) == "1" &&
        Get2DAString("classes", "Arcane", nClass) == "1")
    {
        return TRUE;
    }
    return FALSE;
}

// Checks if the given nClass has divine spell casting (is a spellcaster and that spellcasting is divine).
int GetClassIsDivineCaster(int nClass)
{
    if (Get2DAString("classes", "SpellCaster", nClass) == "1" &&
        Get2DAString("classes", "Arcane", nClass) == "0")
    {
        return TRUE;
    }
    return FALSE;
}

// This calculates the spell caster level for any additional bonuses due to feats or similar.
// For a AOE pass in it as the oCaster, then it uses the stored caster level.
int GetCasterLevelCalculated(object oCasterToCheck, int nSpellIdToCheck, int nFeatIdToCheck, int nCasterClassToCheck)
{
    if (nSpellIdToCheck == SPELL_INVALID) return 0;

    // Run script stores the caster level
    if (GetLastRunScriptEffectScriptType() != 0)
    {
        if (GetEffectType(GetLastRunScriptEffect()) != EFFECT_TYPE_RUNSCRIPT)
        {
            Debug("[GetCasterLevelCalculated] Run Script Effect has invalid type.", ERROR);
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

    int nReturn = GetCasterLevel(oCasterToCheck);

    // Modifications due to casters feats etc.

    // Main change to base caster level is having a class that applies bonuses like Pale Master
    // We might have more than one. We check for each one if we are the highest Divine or
    // Arcane caster. Only bother to do this if we have more than 1 class of course.
    if (nCasterClassToCheck != CLASS_TYPE_INVALID &&
        nFeatIdToCheck == -1 &&
        GetClassByPosition(2, oCasterToCheck) != CLASS_TYPE_INVALID)
    {
        // Arcane?
        if (GetClassIsArcaneCaster(nCasterClassToCheck))
        {
            // Check we are the highest arcane spell casting class, base on class order
            int nClassSlot, nHighestArcaneClass = -1, nHighestArcaneClassLevel = 0, nArcSpellLvlModTotal = 0;
            for (nClassSlot = 1; nClassSlot <= 8; nClassSlot++)
            {
                int nClass = GetClassByPosition(nClassSlot, oCasterToCheck);
                if (nClass != CLASS_TYPE_INVALID)
                {
                    // If it's arcane caster
                    if (GetClassIsArcaneCaster(nClass))
                    {
                        if (GetLevelByClass(nClass, oCasterToCheck) > nHighestArcaneClassLevel)
                        {
                            nHighestArcaneClass      = nClass;
                            nHighestArcaneClassLevel = GetLevelByClass(nClass, oCasterToCheck);
                        }
                    }
                    else
                    {
                        // Check for ArcSpellLvlMod
                        string sArcSpellLvlMod = Get2DAString("classes", "ArcSpellLvlMod", nClass);
                        int nArcSpellLvlMod    = StringToInt(sArcSpellLvlMod);
                        if (sArcSpellLvlMod != "" && nArcSpellLvlMod > 0)
                        {
                            // Get the bonus. EG: 1 is 1 per level, 2 is 1 at level 2, then 2 at level 3, etc.
                            int nLevelBonus = (GetLevelByClass(nClass, oCasterToCheck) + nArcSpellLvlMod - 1) / nArcSpellLvlMod;
                            nArcSpellLvlModTotal += nLevelBonus;
                        }
                    }
                }
            }
            // Add prestige class levels if it's the highest
            if (nCasterClassToCheck == nHighestArcaneClass)
            {
                nReturn += nArcSpellLvlModTotal;
            }
        }
        // Divine?
        if (GetClassIsDivineCaster(nCasterClassToCheck))
        {
            // Check we are the highest arcane spell casting class, base on class order
            int nClassSlot, nHighestDivineClass = -1, nHighestDivineClassLevel = 0, nDivSpellLvlModTotal = 0;
            for (nClassSlot = 1; nClassSlot <= 8; nClassSlot++)
            {
                int nClass = GetClassByPosition(nClassSlot, oCasterToCheck);
                if (nClass != CLASS_TYPE_INVALID)
                {
                    // If it's arcane caster
                    if (GetClassIsDivineCaster(nClass))
                    {
                        if (GetLevelByClass(nClass, oCasterToCheck) > nHighestDivineClassLevel)
                        {
                            nHighestDivineClass      = nClass;
                            nHighestDivineClassLevel = GetLevelByClass(nClass, oCasterToCheck);
                        }
                    }
                    else
                    {
                        // Check for ArcSpellLvlMod
                        string sDivSpellLvlMod = Get2DAString("classes", "DivSpellLvlMod", nClass);
                        int nDivSpellLvlMod    = StringToInt(sDivSpellLvlMod);
                        if (sDivSpellLvlMod != "" && nDivSpellLvlMod > 0)
                        {
                            // Get the bonus. EG: 1 is 1 per level, 2 is 1 at level 2, then 2 at level 3, etc.
                            int nLevelBonus = (GetLevelByClass(nClass, oCasterToCheck) + nDivSpellLvlMod - 1) / nDivSpellLvlMod;
                            nDivSpellLvlModTotal += nLevelBonus;
                        }
                    }
                }
            }
            // Add prestige class levels if it's the highest
            if (nCasterClassToCheck == nHighestDivineClass)
            {
                nReturn += nDivSpellLvlModTotal;
            }
        }
    }

    return nReturn;
}

// Retrieves the metamagic used, in a spell script, AOE script or run script
int GetMetaMagicFeatCalculated(int nSpellId, int bIllusion)
{
    if (GetIsStateScript()) return METAMAGIC_NONE;

    int nMetaMagic;

    if (GetLastRunScriptEffectScriptType() != 0)
    {
        // Stored properly
        return GetRunScriptMetaMagic(GetLastRunScriptEffect());
    }
    // If we are an Area of Effect we can get it from ourselves now
    else if (GetObjectType(OBJECT_SELF) == OBJECT_TYPE_AREA_OF_EFFECT)
    {
        // This hasn't got an override yet. Won't matter until it does.
        nMetaMagic = GetMetaMagicFeat();
    }
    else
    {
        // Normal spell etc.
        nMetaMagic = GetMetaMagicFeat();
    }

    // Apply any automatic metamagic or changes to metamagic here

    // For illusion spells we alter the metamagic to match at most what the parent spell has.
    if (bIllusion)
    {
        int nCurrentMetaMagic = HexStringToInt(Get2DAString("spells", "MetaMagic", nSpellId));

        // Just & bitwise it
        int nTest = nMetaMagic;
        nMetaMagic = nMetaMagic & nCurrentMetaMagic;

        // Debug
        if (nMetaMagic != nTest) Debug("[GetMetaMagicFeatCalculated] Illusion MetaMagic altered.");
    }

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
    else if (nScript == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_ENTER)
    {
        return GetEnteringObject();
    }
    else if (nScript == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_EXIT)
    {
        return GetExitingObject();
    }

    // Potions can only ever be used on self, notable when using some potions on enemies (a bug in the engine)
    if (GetIsObjectValid(GetSpellCastItem()))
    {
        if (GetBaseItemType(GetSpellCastItem()) == BASE_ITEM_POTIONS ||
            GetBaseItemType(GetSpellCastItem()) == BASE_ITEM_ENCHANTED_POTION)
        {
            // Can be used on associates by dragging to their party bar entry
            if (!GetIsFriend(oTarget, oCaster) ||
                 GetAssociateType(oTarget) == ASSOCIATE_TYPE_NONE)
            {
                return OBJECT_SELF;
            }
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
//   Returns: 2 if the target was immune to the save type specified (only checked for Disease, Fear, Mind Spells, Poison, Trap and Paralysis subtypes)
// Note: If used within an Area of Effect Object Script (On Enter, OnExit, OnHeartbeat), you MUST pass GetAreaOfEffectCreator() into oSaveVersus!
// * nSavingThrow - put in SAVING_THROW_NONE to get a 0 return result.
int DoSavingThrow(object oTarget, object oSaveVersus, int nSavingThrow, int nDC, int nSaveType = SAVING_THROW_TYPE_NONE, float fDelay = 0.0)
{
    if (nSavingThrow == SAVING_THROW_NONE) return 0;

    // Sanity check
    nDC = clamp(nDC, 1, 255);

    if (nSaveType < 0 || nSaveType > SAVING_THROW_TYPE_PARALYSIS)
    {
        Debug("[ERROR] DoSavingThrow: Invalid saving throw type specified: " + IntToString(nSavingThrow), ERROR);
    }

    int nVis    = VFX_INVALID;
    int nResult = 0;
    if (nSavingThrow == SAVING_THROW_FORT)
    {
        nResult = FortitudeSave(oTarget, nDC, nSaveType, oSaveVersus);
        if (nResult == 1)
            nVis = VFX_IMP_FORTITUDE_SAVING_THROW_USE;
    }
    else if (nSavingThrow == SAVING_THROW_REFLEX)
    {
        nResult = ReflexSave(oTarget, nDC, nSaveType, oSaveVersus);
        if (nResult == 1)
            nVis = VFX_IMP_REFLEX_SAVE_THROW_USE;
    }
    else if (nSavingThrow == SAVING_THROW_WILL)
    {
        nResult = WillSave(oTarget, nDC, nSaveType, oSaveVersus);
        if (nResult == 1)
            nVis = VFX_IMP_WILL_SAVING_THROW_USE;
    }
    else
    {
        Debug("[ERROR] DoSavingThrow: Invalid saving throw specified: " + IntToString(nSavingThrow) + " Auto failure.", ERROR);
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
            nVis = VFX_IMP_MAGIC_RESISTANCE_USE;
            // Provide some feedback formatted to the games method of showing immunity feedback
            // But we don't just fire the effect off - return 2 still that they're immune.
            int nImmunityType = GetImmunityTypeFromSavingThrowType(nSaveType);

            if (nImmunityType != IMMUNITY_TYPE_NONE)
            {
                SendImmunityFeedback(oSaveVersus, oTarget, nImmunityType);
            }
        }
        if (nVis != VFX_INVALID) DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));
    }
    return nResult;
}

// Returns the modified amount of nDamage based on the saving throw being successful for half (or more if reflex save and feats are involved).
int DoDamageSavingThrow(int nDamage, object oTarget, object oSaveVersus, int nSavingThrow, int nDC, int nSaveType = SAVING_THROW_TYPE_NONE, float fDelay = 0.0)
{
    int bSaved = DoSavingThrow(oTarget, oSaveVersus, nSavingThrow, nDC, nSaveType, fDelay);

    return GetDamageBasedOnFeats(nDamage, oTarget, nSavingThrow, bSaved);
}

// Does an ability check with feedback to oTarget and oSource (oSource being the thing doing the check).
// Returns TRUE if oTarget passes the nDC check. nDC is usually d20 + ability modifier.
// If you use the optional ability parameters the highest will be chosen.
int DoAbilityCheck(object oTarget, object oSource, int nDC, int nAbilityCheck, int nOptionalAbilityCheck = -1)
{
    // Get best ability modifier
    int nAbilityScore = GetAbilityModifier(nAbilityCheck, oTarget);
    int nAbilityUsed  = nAbilityCheck;
    if (nOptionalAbilityCheck != -1)
    {
        if (GetAbilityModifier(nOptionalAbilityCheck, oTarget) > nAbilityScore)
        {
            nAbilityScore = GetAbilityModifier(nOptionalAbilityCheck, oTarget);
            nAbilityUsed  = nOptionalAbilityCheck;
        }
    }

    // Do check
    int nRoll   = d20();
    int bResult = (nRoll + nAbilityScore >= nDC);

    // Report result
    SendAbilityCheckFeedbackMessage(oTarget, oSource, nAbilityUsed, bResult, nRoll, nAbilityScore, nDC);

    return bResult;
}

// Returns the modified amount of nDamage based on bSaved (usually half) and the feats oTarget has (Evasion etc.)
// * nSavingThrowType - SAVING_THROW_REFLEX affects the feats, and other types may affect
//                      it in the future.
int GetDamageBasedOnFeats(int nDamage, object oTarget, int nSavingThrowType, int bSaved)
{
    if (nSavingThrowType == SAVING_THROW_REFLEX)
    {
        if (!bSaved)
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
    else if (bSaved)
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
        Debug("[DoResistSpell] Error, caster or target is invalid. Caster: " + GetName(oCaster) + " Target: " + GetName(oTarget), ERROR);
        return FALSE;
    }

    // Epic spells do not get spell resistance or immunity
    if (GetSpellLevel(nSpellId) == 10) return FALSE;

    // Checks are done based on the nSpellType;
    // - SPELL_TYPE_SPELL           - Standard spell
    // - SPELL_TYPE_CREATURE_POWER  - Or "Spell ability". Uses HD for resist spell. Checks spell immunity.
    // - SPELL_TYPE_FEAT            - No resist spell/absorption checks are valid. Checks spell immunity.
    // - SPELL_TYPE_ITEM_POWER      - No resist spell/absorption checks are valid. Checks spell immunity.

    // We test the 3 resist spell functions in the ResistSpell order for now:
    // Spell Absorption (Limited), Spell Absorption (Unlimited), Spell Immunity, Spell Resistance

    if (bAbsorbCheck && nSpellType == SPELL_TYPE_SPELL)
    {
        // Spell Absorption (Limited) ie mantles
        if (SpellAbsorptionLimitedCheck(oTarget, oCaster, nSpellId, nSpellSchool, nSpellLevel))
        {
            Debug("[DoResistSpell] SpellAbsorptionLimitedCheck: TRUE against target: " + GetName(oTarget));
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
            Debug("[DoResistSpell] SpellAbsorptionUnlimitedCheck: TRUE against target: " + GetName(oTarget));
            DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_GLOBE_USE), oTarget));
            return TRUE;
        }
    }

    // Spell Immunity
    if (bImmunityCheck && SpellImmunityCheck(oTarget, oCaster, nSpellId))
    {
        Debug("[DoResistSpell] SpellImmunityCheck: TRUE against target: " + GetName(oTarget));
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_GLOBE_USE), oTarget));
        return TRUE;
    }

    if (bResistCheck && (nSpellType == SPELL_TYPE_SPELL || nSpellType == SPELL_TYPE_CREATURE_POWER))
    {
        // Spell Resistance
        int nTargetSpellResistance  = GetSpellResistance(oTarget);
        int nResistSpellCasterLevel = nCasterLevel;

        // Creature powers use the casters HD
        // Should move this to the spell hook TBH
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
            Debug("[DoResistSpell] SpellResistanceCheck: TRUE against target: " + GetName(oTarget));
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
// - nType can be TOUCH_MELEE or TOUCH_RANGED. If TOUCH_NONE it simply returns TOUCH_RESULT_HIT with no feedback.
// Return value: TOUCH_RESULT_* (HIT, MISS or CRITICAL_HIT).
int DoTouchAttack(object oTarget, object oVersus, int nType, int bDisplayFeedback = TRUE)
{
    // We just "hit" if TOUCH_NONE.
    if (nType == TOUCH_NONE) return TOUCH_RESULT_HIT;

    // Note: For now we don't use oVersus but it's possible to do this with ExecuteScript/ExecuteScriptChunk.
    if (oVersus != OBJECT_SELF)
    {
        if (DEBUG_LEVEL >= ERROR) Debug("[ERROR] DoTouchAttack used when oVersus isn't OBJECT_SELF");
    }

    int nResult = TOUCH_RESULT_MISS;
    if (nType == TOUCH_MELEE)
    {
        nResult = TouchAttackMelee(oTarget, bDisplayFeedback, oVersus);
    }
    else
    {
        nResult = TouchAttackRanged(oTarget, bDisplayFeedback, oVersus);
    }
    // We now apply critical hit immunity detection (bug with the functions not doing it for us)
    if (nResult == TOUCH_RESULT_CRITICAL_HIT)
    {
        if (GetIsImmuneWithFeedback(oTarget, oVersus, IMMUNITY_TYPE_CRITICAL_HIT, FALSE))
        {
            nResult = TOUCH_RESULT_HIT;
        }
    }
    return nResult;
}

// Applies Dispel Magic to the given target (Area of Effects, Items on the ground and equipped and Summoned Monsters are also handled)
// If nCasterLevel is CASTER_LEVEL_ALWAYS_SUCCEEDS then it'll be a high number, that should pass all checks (use for Antimagic Ray etc.)
void DoDispelMagic(object oTarget, int nCasterLevel, int nVis = VFX_INVALID, float fDelay = 0.0, int bAll = TRUE, int bBreach = FALSE)
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
                // This should happen in cases of, eg, Caltrops...!
                //if (DEBUG_LEVEL >= ERROR) Debug("Persistent AOE with no caster level, ignoring, this shouldn't happen.", ERROR);
                return;
            }

            // Same as creatures, can be immune to dispel
            if (GetLocalInt(oTarget, "X1_L_IMMUNE_TO_DISPEL")) return;

            if (d20() + nCasterLevel >= 10 + nOpposingCasterLevel)
            {
                FloatingTextStrRefOnCreature(STRREF_AREA_OF_EFFECT_DISPELLED, oCaster, FALSE);  // * Area of effect dispelled  *
                if (GetIsObjectValid(GetAreaOfEffectCreator(oTarget)))
                    FloatingTextStrRefOnCreature(STRREF_AREA_OF_EFFECT_DISPELLED, GetAreaOfEffectCreator(oTarget));
                DelayCommand(fDelay, ApplyVisualEffectAtLocation(VFX_FNF_LOS_NORMAL_10, GetLocation(oTarget)));
                DestroyObject(oTarget, fDelay);
            }
            else
            {
                FloatingTextStrRefOnCreature(STRREF_AREA_OF_EFFECT_NOT_DISPELLED, oCaster, FALSE);  // * Area of effect not dispelled *
            }
        }
    }
    else if (GetObjectType(oTarget) == OBJECT_TYPE_ITEM)
    {
        // Items get dispelled on the ground
        DispelMagicalItemProperties(oTarget, oCaster, nCasterLevel);
        return;
    }

    // Don't dispel magic on petrified targets - this change is in to prevent
    // weird things from happening with 'statue' creatures.
    // Also creature can be scripted to be immune to dispel magic as well.
    // We'll also ignore DMs and plot creatures
    if (GetHasEffect(oTarget, EFFECT_TYPE_PETRIFY) ||
       (GetLocalInt(oTarget, "X1_L_IMMUNE_TO_DISPEL") == 10) ||
        GetIsDM(oTarget) ||
        GetPlotFlag(oTarget))
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
                    // Spell Id should not be from an Epic spell (undispellable)
                    // -1 is fine (unknown spell level)
                    if (GetEffectTaggedSpellLevel(eCheck) <= 9)
                    {
                        // We dispel using this effects caster level
                        if (d20() + nCasterLevel >= 11 + GetEffectCasterLevel(eCheck))
                        {
                            RemoveEffect(oMaster, eCheck);
                            // Return since this should not remove the summoned creature itself (or swarm if appropriate)
                            // For now keeping this simple.
                            return;
                        }
                    }
                }
            }
            eCheck = GetNextEffect(oMaster);
        }
    }

    effect eDispel;
    if (bAll)
    {
        if (GetObjectType(oTarget) == OBJECT_TYPE_CREATURE)
        {
            // We should dispel magical effects from items possessed by the target creature.
            // Let's assume that, for now at least, only the equipped items matter
            // and creature items are "linked" (removed from one are removed from
            // the others).
            int nSlot, bDoneCreatureWeapons = FALSE;
            for (nSlot = 0; nSlot < NUM_INVENTORY_SLOTS; nSlot++)
            {
                object oItem = GetItemInSlot(nSlot, oTarget);
                if (GetIsObjectValid(oItem))
                {
                    // Creature item slot L/R/B pass first valid one in
                    if (nSlot == INVENTORY_SLOT_CWEAPON_L ||
                        nSlot == INVENTORY_SLOT_CWEAPON_R ||
                        nSlot == INVENTORY_SLOT_CWEAPON_B)
                    {
                        if (!bDoneCreatureWeapons)
                        {
                            DispelMagicalItemProperties(oItem, oCaster, nCasterLevel, TRUE);
                            bDoneCreatureWeapons = TRUE;
                        }
                    }
                    else
                    {
                        DispelMagicalItemProperties(oItem, oCaster, nCasterLevel);
                    }
                }
            }
        }
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

    if (nVis != VFX_INVALID) DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(nVis), oTarget));
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
    jArray = JsonArrayInsert(jArray, JsonInt(SPELL_ETHEREALNESS));  // Greater Sanctuary
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
        if (RemoveEffectsFromSpell(oTarget, JsonGetInt(JsonArrayGet(jArray, nIndex))))
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
    if (GetIsStateScript()) return FALSE;

    if (GetLastRunScriptEffectScriptType() != 0)
    {
        return GetRunScriptIllusionary(GetLastRunScriptEffect());
    }
    string sParam = GetScriptParam(SCRIPT_PARAMETER_ILLUSIONARY);
    if (sParam != "")
    {
        return TRUE;
    }
    return FALSE;
}

// Gets the illusionary strength of the current script call. Not relevant if not an
// illusion spell. 20 would be 20% strength if they save a will save.
int GetSpellIllusionaryStrength(int bIllusionary)
{
    if (GetIsStateScript()) return 0;

    if (bIllusionary)
    {
        if (GetLastRunScriptEffectScriptType() != 0)
        {
            return GetRunScriptIllusionaryStrength(GetLastRunScriptEffect());
        }
        string sStrength = GetScriptParam(SCRIPT_PARAMETER_ILLUSIONARY_STRENGTH);
        if (sStrength != "")
        {
            return StringToInt(sStrength);
        }
    }
    return 0;
}

// Checks if oTarget failed the will save done in GetSpellTargetValid() when they
// were checked. Can affect GetDiceRoll/GetDuration.
int GetTargetIllusionarySave(object oTarget)
{
    if (GetIsStateScript()) return FALSE;

    if (!bDoneSpellTargetValid)
    {
        Debug("[GetTargetIllusionarySave] Called before we've tested anyone for illusion saves.", ERROR);
    }

    if (bIllusionary)
    {
        return GetLocalInt(oTarget, "ILLUSIONARY_SAVING_THROW_STATE");
    }
    return FALSE;
}

// Does (and stores) the Will saving throw for illusion saves.
// For now only affects spells marked as Hostile.
void DoIllusionSavingThrow(object oTarget, object oCaster)
{
    if (GetIsStateScript()) return;

    // This resets things for the next call if not illusionary
    int bSave = FALSE;

    if (bIllusionary && GetSpellIsHostile(nSpellId))
    {
        // Maybe a mind spell? Not sure. For now we'll leave it as is.
        bSave = DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC);
    }
    SetLocalInt(oTarget, "ILLUSIONARY_SAVING_THROW_STATE", bSave);
}

// Gets a modified value for nValue (minimum 1). Use if GetTargetIllusionarySave is TRUE.
int GetIllusionModifiedValue(int nValue)
{
    if (GetIsStateScript()) return nValue;

    if (nIllusionaryStrength != 0)
    {
        // 10 * 20 = 200, / 100 =
        nValue = FloatToInt(IntToFloat(nValue) * (IntToFloat(nIllusionaryStrength) / 100.0));
    }
    else
    {
        Debug("[GetIllusionModifiedValue] No script parameter for illusionary strength");
    }
    return nValue;
}

// Checks if oTarget is affected by the current spell (if it's an illusion).
// If they save and it's 40% strong then 40% chance to be affected.
// Use those spells which have a single type of effect (Eg Death, or Web's per-round effect) to not apply at all.
// For spells with a variable duration or damage use GetDuration and GetDiceRoll/GetStaticValue instead.
int GetAffectedByIllusion(object oTarget)
{
    if (GetTargetIllusionarySave(oTarget))
    {
        // If nStrength is 40, we need to roll 41 or higher to not be affected.
        if (d100() > nIllusionaryStrength)
        {
            // Some feedback to the player making the save
            SendMessageToPC(oTarget, "*You manage to see " + GetSpellName(nSpellId) + " as a mere illusion and are unaffected by some or all of its effects.*");
            return FALSE;
        }
    }
    return TRUE;
}

// This gets a static numeric value, usually it just returns nValue but if it's an illusion spell it can return
// Run this AFTER GetArrayOfTargets/GetSpellTargetValid since that does the illusion save (if needed).
int GetStaticValue(int nValue)
{
    // Illusion alteration
    if (GetTargetIllusionarySave(oTarget))
    {
        nValue = GetIllusionModifiedValue(nValue);
    }
    return nValue;
}

// Applies metamagic to the given dice roll. Run this AFTER GetArrayOfTargets/GetSpellTargetValid since that does the illusion save (if needed).
// eg GetDiceRoll(4, 6, 8) will roll 4d6 and add 8 to the final roll
// Metamagic is applied automatically unless bApplyMetaMagic is FALSE.
// Illusion changes are applied if it is from an illusion spell and they passed a save.
int GetDiceRoll(int nNumberOfDice, int nDiceSize, int nBonus = 0, int bApplyMetaMagic = TRUE)
{
    // If we have 0 dice, it is still "valid" but we should consider using GetStaticValue.
    if (nNumberOfDice <= 0)
    {
        Debug("[GetDiceRoll] nNumberOfDice is 0 or less. Consider using GetStaticValue() instead.");
    }

    int i, nDamage = 0;
    if (nNumberOfDice > 0 && nDiceSize > 0)
    {
        for (i = 1; i <= nNumberOfDice; i++)
        {
            nDamage += Random(nDiceSize) + 1;
        }
    }
    if (bApplyMetaMagic && nDamage > 0)
    {
        // Resolve metamagic. Maximize and Empower don't stack.
        if (nMetaMagic & METAMAGIC_MAXIMIZE)
        {
            nDamage = nDiceSize * nNumberOfDice;
        }
        else if (nMetaMagic & METAMAGIC_EMPOWER)
        {
            nDamage += nDamage / 2;
        }
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
// * bApplyMetaMagic - Metamagic is applied automatically unless bApplyMetaMagic is FALSE.
// * bCheckIllusionSave - If TRUE Illusion changes are applied if it is from an illusion spell and they passed a save.
float GetDuration(int nDuration, int nDurationType, int bApplyMetaMagic = TRUE, int bCheckIllusionSave = TRUE)
{
    // We sometimes put in say, nCasterLevel/2 as nDuration. We log this and change it to 1.
    if (nDuration <= 0)
    {
        nDuration = 1;
        Debug("[GetDuration] nDuration is too low: " + IntToString(nDuration), ERROR);
    }

    float fDuration = 0.0;

    if (bApplyMetaMagic)
    {
        // Resolve metamagic
        if (nMetaMagic & METAMAGIC_EXTEND)
        {
            nDuration *= 2;
        }
    }

    // Illusion alteration
    if (GetTargetIllusionarySave(oTarget))
    {
        nDuration = GetIllusionModifiedValue(nDuration);
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
        Debug("[ERROR] Spells GetDuration: Incorrect nDurationType: " + IntToString(nDurationType), ERROR);
    }
    return fDuration;
}

// Checks if the given target is valid to be targeted by oCaster.
// - nTargetType:
//      SPELL_TARGET_ANYTHING - Any target is valid. Useful for spells needing to target allies with on effect and enemies with another.
//      SPELL_TARGET_ALLALLIES - Any allies (GetIsFriend / GetFactionEqual).
//      SPELL_TARGET_SELECTIVEHOSTILE - Only enemies (GetIsEnemy)
//      SPELL_TARGET_STANDARDHOSTILE - Enemies, and neutrals/allies based on PvP (!GetIsReactionTypeFriendly()).
// This additionally, if the spell is illusionary, do a will saving throw for the illusion check
// if the target is valid.
int GetSpellTargetValid(object oTarget, object oCaster, int nTargetType)
{
    // Set global saying we've done this
    bDoneSpellTargetValid = TRUE;

    // If dead, not a valid target
    if (GetIsDead(oTarget))
    {
        return FALSE;
    }

    int bReturnValue = FALSE;

    // Check what can be actually tested / has saving throws to do
    int nObjectType = GetObjectType(oTarget);
    if (nObjectType == OBJECT_TYPE_CREATURE ||
        nObjectType == OBJECT_TYPE_DOOR ||
        nObjectType == OBJECT_TYPE_PLACEABLE)
    {
        switch (nTargetType)
        {
            // This kind of spell will affect all friendlies and anyone in my party/faction, even if we are upset with each other currently.
            case SPELL_TARGET_ALLALLIES:
            {
                Debug("[INFO] GetSpellTargetValid: All allies oTarget: " + GetName(oTarget) + " GetIsFriend: " + IntToString(GetIsFriend(oTarget, oCaster)) + " GetFactionEqual: " + IntToString(GetFactionEqual(oTarget, oCaster)), INFO);
                if (GetIsFriend(oTarget, oCaster) || GetFactionEqual(oTarget, oCaster))
                {
                    bReturnValue = TRUE;
                }
            }
            break;
            case SPELL_TARGET_STANDARDHOSTILE:
            {
                Debug("[INFO] GetSpellTargetValid: Standard hostile oTarget: " + GetName(oTarget) + " GetIsReactionTypeFriendly: " + IntToString(GetIsReactionTypeFriendly(oTarget, oCaster)), INFO);
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
                Debug("[INFO] GetSpellTargetValid: Selective hostile oTarget: " + GetName(oTarget) + " GetIsEnemy: " + IntToString(GetIsEnemy(oTarget, oCaster)), INFO);
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
                Debug("[ERROR] GetSpellTargetValid: Invalid input: " + IntToString(nTargetType), ERROR);
            }
            break;
        }
    }
    else
    {
        // Likely AOE or Item, which can be affected by certain AOE scripts or whatnot
        // We always assume these are valid targets (note cannot do illusion saving throw)
        bReturnValue = TRUE;
    }
    return bReturnValue;
}

// Converts a SAVING_THROW_TYPE_* to an IMMUNITY_TYPE_* where these are checked for in the saving throw functions (Disease, Fear, Mind Spells, Poison, Trap and Paralysis subtypes)
// else it will be IMMUNITY_TYPE_NONE (0)
int GetImmunityTypeFromSavingThrowType(int nSaveType)
{
    // Only certain saving throw types check immunities in WillSave, ReflexSave or FortitudeSave
    int nImmunityType = IMMUNITY_TYPE_NONE;
    switch (nSaveType)
    {
        // NOTE: Death used to be in this list but the game engine is bugged
        // so we're replicating this (and anyway using GetIsImmune properly, normally!)
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
// If nImmunityType is IMMUNITY_TYPE_NONE this automatically fails (ie they're not immune).
// * bCheckMindImmunity - If TRUE then those effects that IMMUNITY_TYPE_MIND_SPELLS covers are also checked for IMMUNITY_TYPE_MIND_SPELLS (Fear, etc.)
int GetIsImmuneWithFeedback(object oCreature, object oVersus, int nImmunityType, int bCheckMindImmunity = TRUE)
{
    if (nImmunityType == IMMUNITY_TYPE_NONE) return FALSE;

    if (GetIsImmune(oCreature, nImmunityType, oVersus))
    {
        SendImmunityFeedback(oVersus, oCreature, nImmunityType);
        return TRUE;
    }
    else if (nImmunityType == IMMUNITY_TYPE_ENTANGLE)
    {
        // Add in Entangle immunity here
        if(GetIsIncorporeal(oCreature) || GetHasFeat(FEAT_WOODLAND_STRIDE, oCreature))
        {
            SendImmunityFeedback(oVersus, oCreature, nImmunityType);
            return TRUE;
        }
    }

    if (bCheckMindImmunity)
    {
        switch (nImmunityType)
        {
            case IMMUNITY_TYPE_CHARM:
            case IMMUNITY_TYPE_CONFUSED:
            case IMMUNITY_TYPE_DAZED:
            case IMMUNITY_TYPE_DOMINATE:
            case IMMUNITY_TYPE_FEAR:
            case IMMUNITY_TYPE_PARALYSIS: // Stupid but it's here. Gah.
            case IMMUNITY_TYPE_STUN:
            {
                if (GetIsImmune(oCreature, IMMUNITY_TYPE_MIND_SPELLS, oVersus))
                {
                    SendImmunityFeedback(oVersus, oCreature, IMMUNITY_TYPE_MIND_SPELLS);
                    return TRUE;
                }
            }
        }
    }

    return FALSE;
}

// Returns TRUE if oCreature is immune to petrification and sends some feedback message to that effect.
int GetIsImmuneToPetrificationWithFeedback(object oCreature)
{
    int bImmune = FALSE;
    // Prevent people from petrifying DM, resulting in GUI even when effect is not successful.
    if (GetPlotFlag(oCreature) || GetIsDM(oCreature) || GetObjectType(oCreature) != OBJECT_TYPE_CREATURE)
    {
        bImmune = TRUE;
    }

    // Appearance check
    switch (GetAppearanceType(oCreature))
    {
        case APPEARANCE_TYPE_BASILISK:
        case APPEARANCE_TYPE_COCKATRICE:
        case APPEARANCE_TYPE_MEDUSA:
        case APPEARANCE_TYPE_ALLIP:
        case APPEARANCE_TYPE_ELEMENTAL_AIR:
        case APPEARANCE_TYPE_ELEMENTAL_AIR_ELDER:
        case APPEARANCE_TYPE_ELEMENTAL_EARTH:
        case APPEARANCE_TYPE_ELEMENTAL_EARTH_ELDER:
        case APPEARANCE_TYPE_ELEMENTAL_FIRE:
        case APPEARANCE_TYPE_ELEMENTAL_FIRE_ELDER:
        case APPEARANCE_TYPE_ELEMENTAL_WATER:
        case APPEARANCE_TYPE_ELEMENTAL_WATER_ELDER:
        case APPEARANCE_TYPE_GOLEM_STONE:
        case APPEARANCE_TYPE_GOLEM_IRON:
        case APPEARANCE_TYPE_GOLEM_CLAY:
        case APPEARANCE_TYPE_GOLEM_BONE:
        case APPEARANCE_TYPE_GORGON:
        case APPEARANCE_TYPE_HEURODIS_LICH:
        case APPEARANCE_TYPE_LANTERN_ARCHON:
        case APPEARANCE_TYPE_SHADOW:
        case APPEARANCE_TYPE_SHADOW_FIEND:
        case APPEARANCE_TYPE_SHIELD_GUARDIAN:
        case APPEARANCE_TYPE_SKELETAL_DEVOURER:
        case APPEARANCE_TYPE_SKELETON_CHIEFTAIN:
        case APPEARANCE_TYPE_SKELETON_COMMON:
        case APPEARANCE_TYPE_SKELETON_MAGE:
        case APPEARANCE_TYPE_SKELETON_PRIEST:
        case APPEARANCE_TYPE_SKELETON_WARRIOR:
        case APPEARANCE_TYPE_SKELETON_WARRIOR_1:
        case APPEARANCE_TYPE_SPECTRE:
        case APPEARANCE_TYPE_WILL_O_WISP:
        case APPEARANCE_TYPE_WRAITH:
        case APPEARANCE_TYPE_BAT_HORROR:
        case APPEARANCE_TYPE_DRACOLICH:
        case APPEARANCE_TYPE_MINDFLAYER_ALHOON:
        case APPEARANCE_TYPE_DRAGON_SHADOW:
        case APPEARANCE_TYPE_GOLEM_MITHRAL:
        case APPEARANCE_TYPE_GOLEM_ADAMANTIUM:
        case APPEARANCE_TYPE_DEMI_LICH:
        case APPEARANCE_TYPE_ANIMATED_CHEST:
        case APPEARANCE_TYPE_DWARF_GOLEM:
        case APPEARANCE_TYPE_DWARF_HALFORC: // Golem
        {
            bImmune = TRUE;
        }
        break;
    }

    // Makes sure to check for spell immunity only, no feedback.
    if (SpellImmunityCheck(oCreature, oCaster, -1, FALSE))
    {
        bImmune = TRUE;
    }

    // Feedback
    if (bImmune)
    {
        SendImmunityFeedback(oCaster, oCreature, IMMUNITY_TYPE_PETRIFICATION);
    }
    return bImmune;
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
    if (DEBUG_LEVEL >= ERROR) Debug("[ERROR] GetVisualEffectHitDelay Called with no programmed FX: " + IntToString(nProgrammedVFX), ERROR);
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
        Debug("[ApplySpellEffectToObject] Error: Temporary duration but fDuration is: " + FloatToString(fDuration), ERROR);
    else if (nDurationType != DURATION_TYPE_TEMPORARY && fDuration != 0.0)
        Debug("[ApplySpellEffectToObject] Error: Non-Temporary duration but fDuration is: " + FloatToString(fDuration), ERROR);

    ApplyEffectToObject(nDurationType, EffectChangeProperties(eEffect, nSpellId, nCasterLevel, oCaster), oTarget, fDuration);
}

// Applies the given effect but merges in the right spell Id, caster Id and caster level.
void ApplySpellEffectAtLocation(int nDurationType, effect eEffect, location lTarget, float fDuration = 0.0)
{
    // Error checking
    if (nDurationType == DURATION_TYPE_TEMPORARY && fDuration <= 0.0)
        Debug("[ApplySpellEffectToObject] Error: Temporary duration but fDuration is: " + FloatToString(fDuration), ERROR);
    else if (nDurationType != DURATION_TYPE_TEMPORARY && fDuration != 0.0)
        Debug("[ApplySpellEffectToObject] Error: Non-Temporary duration but fDuration is: " + FloatToString(fDuration), ERROR);

    ApplyEffectAtLocation(nDurationType, EffectChangeProperties(eEffect, nSpellId, nCasterLevel, oCaster), lTarget, fDuration);
}

// Applies the given Beam/Ray effect to oTarget. Does it as an unyielding effect so even if they die it'll persist.
// - nBeam - visualeffects.2da line (is checked if it is a beam). Use VFX_NONE if you don't want this to do anything.
// - oTarget - Target of the beam
// - bMissEffect - Beam hits or not
// - nBodyPart - BODY_NODE_* the beam originates from (default: HAND)
// - fDuration - If 0.0 it isues the nSpellId's spells.2da CastTime value to look proper
// - oEffector - The source of the beam. Defaults to oCaster if invalid.
void ApplyBeamToObject(int nBeam, object oTarget, int bMissEffect = FALSE, int nBodyPart = BODY_NODE_HAND, float fDuration = 0.0, object oEffector = OBJECT_INVALID)
{
    if (nBeam == VFX_NONE) return;
    // Validate nBeam value can be a beam
    if (Get2DAString("visualeffects", "Type_FD", nBeam) != "B")
    {
        Debug("[ApplyBeamToObject] VFX is not Beam type: " + IntToString(nBeam), ERROR);
        return;
    }
    // Technically nBodyPart can be invalid (and thus default to ground/root of the target) but we'll try and keep it sane enough for now
    if (nBodyPart < 0 || nBodyPart > 11)
    {
        Debug("[ApplyBeamToObject] Target nBodyPart is invalid: " + IntToString(nBodyPart), ERROR);
        return;
    }

    // Get duration from spells.2da
    if (fDuration == 0.0)
    {
        // Cast time is in miliseconds
        string sCastTime = Get2DAString("spells", "CastTime", nSpellId);

        if (sCastTime != "")
        {
            fDuration = StringToFloat(sCastTime) / 1000.0;
        }
        else
        {
            Debug("[ApplyBeamToObject] Cannot find valid CastTime for the duration for nSpellId: " + IntToString(nSpellId), ERROR);
            return;
        }
    }
    if (!GetIsObjectValid(oEffector)) oEffector = oCaster;

    effect eBeam = UnyieldingEffect(EffectBeam(nBeam, oEffector, nBodyPart, bMissEffect));

    // We never apply this permanently
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam, oTarget, fDuration);
}

// Applies the given VFX effect to oTarget.
// - nVFX - visualeffects.2da line (cannot be a Beam type). Use VFX_NONE to have this function be ignored.
// - oTarget - Target of the VFX
// - bMissEffect - VFX hits or not
// - fDuration - If 0.0 it applies it instantly, or applies it for a given duration.
// Usual scale and translate values as well.
void ApplyVisualEffectToObject(int nVFX, object oTarget, int bMissEffect = FALSE, float fDuration = 0.0, float fScale = 1.0f, vector vTranslate = [ 0.0, 0.0, 0.0 ], vector vRotate = [ 0.0, 0.0, 0.0 ])
{
    if (nVFX == VFX_NONE) return;

    // Validate VFX
    string sType = Get2DAString("visualeffects", "Type_FD", nVFX);
    if (sType == "" || sType == "B")
    {
        Debug("[ApplyVisualEffectToObject] VFX invalid or a Beam type: " + IntToString(nVFX), ERROR);
        return;
    }

    effect eVFX = EffectVisualEffect(nVFX, bMissEffect, fScale, vTranslate, vRotate);

    // Apply VFX
    if (fDuration <= 0.0)
    {
        ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVFX, oTarget);
    }
    else
    {
        ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eVFX, oTarget, fDuration);
    }
}

// Applies the given VFX effect to oTarget.
// - nVFX - visualeffects.2da line. Must be not a DUR or BEAM type. Use VFX_NONE to have this function be ignored.
// - lTarget - Target of the VFX
// - bMissEffect - VFX hits or not
// Usual scale and translate values as well.
void ApplyVisualEffectAtLocation(int nVFX, location lTarget, int bMissEffect = FALSE, float fScale = 1.0f, vector vTranslate = [ 0.0, 0.0, 0.0 ], vector vRotate = [ 0.0, 0.0, 0.0 ])
{
    if (nVFX == VFX_NONE) return;

    // Validate VFX
    string sType = Get2DAString("visualeffects", "Type_FD", nVFX);
    if (sType == "" || sType == "D" || sType == "B")
    {
        Debug("[ApplyVisualEffectToObject] VFX invalid or a Beam/Duration type: " + IntToString(nVFX), ERROR);
    }

    effect eVFX = EffectVisualEffect(nVFX, bMissEffect, fScale, vTranslate, vRotate);

    // Apply VFX
    ApplySpellEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, lTarget);
}

// Applies the given VFX effect at oTargets current location. Safer to use on CreateObject or in a DelayCommand if oTarget is moving.
// - nVFX - visualeffects.2da line. Must be not a DUR or BEAM type. Use VFX_NONE to have this function be ignored.
// - lTarget - Target of the VFX
// - bMissEffect - VFX hits or not
// Usual scale and translate values as well.
void ApplyVisualEffectAtObjectsLocation(int nVFX, object oTarget, int bMissEffect = FALSE, float fScale = 1.0f, vector vTranslate = [ 0.0, 0.0, 0.0 ], vector vRotate = [ 0.0, 0.0, 0.0 ])
{
    ApplyVisualEffectAtLocation(nVFX, GetLocation(oTarget), bMissEffect, fScale, vTranslate, vRotate);
}

// Applies damage of the given type. This helps wrapper delayed damage so we can keep at 1 HP if necessary (Harm/Heal).
void ApplyDamageToObject(object oTarget, int nDamage, int nDamageType = DAMAGE_TYPE_MAGICAL, int nDamagePower = DAMAGE_POWER_NORMAL, int bKeepAt1HP = FALSE)
{
    if (bKeepAt1HP)
    {
        if (GetCurrentHitPoints(oTarget) - nDamage < 1) nDamage = GetCurrentHitPoints(oTarget) - 1;
    }
    if (nDamage > 0)
    {
        effect eDamage = EffectDamage(nDamage, nDamageType, nDamagePower);

        // We always delay damage by 0.0 seconds to stop any script loops
        DelayCommand(0.0, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget));
    }
}

// Applies damage to the oTarget which is enough to kill them (HP + 10) plus VFX.
void ApplyDeathDamageToObject(object oTarget, int nVFX, int nDamageType = DAMAGE_TYPE_MAGICAL, int nDamagePower = DAMAGE_POWER_NORMAL)
{
    int nDamage = GetCurrentHitPoints(oTarget) + 10;
    effect eDamage = EffectDamage(nDamage, nDamageType, nDamagePower);

    // We always delay damage by 0.0 seconds to stop any script loops
    ApplyVisualEffectToObject(nVFX, oTarget);
    DelayCommand(0.0, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget));
}

// Private function for the below to work in a DelayCommand
void DamageAndDrain(object oTarget, object oCaster, int nDamage, int nDamageType = DAMAGE_TYPE_MAGICAL, int nDamagePower = DAMAGE_POWER_NORMAL)
{
    int nOriginalHP = GetCurrentHitPoints(oTarget);
    ApplySpellEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDamage, nDamageType, nDamagePower), oTarget);

    // Amount to heal. If dead we use 0 HP since NPCs have to magically go to -10 when they die.
    int nCurrentHP = GetIsDead(oTarget) ? 0 : GetCurrentHitPoints(oTarget);

    int nAmountToHeal = nOriginalHP - nCurrentHP;

    // Don't heal if the target isn't a creature to drain
    if (GetObjectType(oTarget) == OBJECT_TYPE_CREATURE && nAmountToHeal > 0)
    {
        ApplyVisualEffectToObject(VFX_IMP_HEALING_M, oCaster);
        ApplySpellEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nAmountToHeal), oCaster);
    }
}

// Applies damage of the given type, and adds temp HP up to the damage done to oCaster (after resistances/immunities).
// Must be a creature for it it work.
void ApplyDamageWithVFXToObjectAndTempHP(object oTarget, object oCaster, int nVFX, int nDamage, float fDuration, int nDamageType = DAMAGE_TYPE_MAGICAL, int nDamagePower = DAMAGE_POWER_NORMAL)
{
    int nOriginalHP = GetCurrentHitPoints(oTarget);
    ApplySpellEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDamage, nDamageType, nDamagePower), oTarget);

    // Amount to heal. If dead we use 0 HP since NPCs have to magically go to -10 when they die.
    int nCurrentHP = GetIsDead(oTarget) ? 0 : GetCurrentHitPoints(oTarget);

    int nAmountTempHP = nOriginalHP - nCurrentHP;

    // Don't heal if the target isn't a creature to drain
    if (GetObjectType(oTarget) == OBJECT_TYPE_CREATURE && nAmountTempHP > 0)
    {
        ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, EffectTemporaryHitpoints(nAmountTempHP), oCaster, fDuration);
    }
}

// Applies damage of the given type, and heals up to the damage done to oCaster (after resistances/immunities).
// Must be a creature for it it work.
void ApplyDamageWithVFXToObjectAndDrain(object oTarget, object oCaster, int nVFX, int nDamage, int nDamageType = DAMAGE_TYPE_MAGICAL, int nDamagePower = DAMAGE_POWER_NORMAL)
{
    ApplyVisualEffectToObject(nVFX, oTarget);
    DelayCommand(0.0, DamageAndDrain(oTarget, oCaster, nDamage, nDamageType, nDamagePower));
}

// Applies damage of the given type. This helps wrapper delayed damage so we can keep at 1 HP if necessary (Harm/Heal).
// * Also applies nVFX (no miss effect or anything special).
void ApplyDamageWithVFXToObject(object oTarget, int nVFX, int nDamage, int nDamageType = DAMAGE_TYPE_MAGICAL, int nDamagePower = DAMAGE_POWER_NORMAL, int bKeepAt1HP = FALSE)
{
    ApplyVisualEffectToObject(nVFX, oTarget);

    if (bKeepAt1HP)
    {
        if (GetCurrentHitPoints(oTarget) - nDamage < 1) nDamage = GetCurrentHitPoints(oTarget) - 1;
    }
    if (nDamage > 0)
    {
        effect eDamage = EffectDamage(nDamage, nDamageType, nDamagePower);

        // We always delay damage by 0.0 seconds to stop any script loops
        DelayCommand(0.0, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget));
    }
}

// Applies eEffect to oTarget, if it hasn't got it from this spell ID AOE already
// If bApplyRunScript is set, it also attaches the RunScript to remove it later (if no more AOEs are affecting them).
// NOTE: Not necessarily perfect; eg if failing a save applies a movement speed effect in a given AOE, moving out of that one
// into the same AOE but one you've passed will retain the movement speed decrease. It will do for now though.
// - The run script "op_rs_aoecleanup" with a 6 second interval script attached that can be used to apply fair "per round" effects and check
//   if the AOE or creator of the AOE exists still
// - Attaches a negative cessate VFX
// The above and the eEffect:
// - Tags it with the OBJECT_SELF's OID if RunScript or AOEEFFECT if not
// - Makes it extraordinary
// - Applies it for a very long temporary duration
// Apply these effects only once (ie OnEnter). Don't tag an effect as AOEEFFECT, and it'll be left alone (eg temporary stuns/entangles).
void ApplyAOEPersistentEffect(object oTarget, effect eEffect, int bApplyRunScript = TRUE)
{
    if (bApplyRunScript)
    {
        if (!GetHasEffect(oTarget, EFFECT_TYPE_RUNSCRIPT, SPELL_ANY, ObjectToString(OBJECT_SELF)))
        {
            // Apply run script which when removed (or AOE dies) it clears all tagged AOE effects if no
            // other run scripts from the same spell Id exist
            effect eLink = EffectLinkEffects(EffectRunScriptEnhanced(FALSE, "op_rs_aoecleanup", "op_rs_aoecleanup", 6.0),
                                             EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));
            eLink        = ExtraordinaryEffect(eLink);
            eLink        = TagEffect(eLink, ObjectToString(OBJECT_SELF));
            ApplySpellEffectToObject(DURATION_TYPE_PERMANENT, eLink, oTarget);
        }
    }

    // Don't apply duplicates, eg lots of -50% movement speeds
    if (!GetHasEffect(oTarget, EFFECT_TYPE_ALL, nSpellId, TAG_AOEEFFECT))
    {
        eEffect = ExtraordinaryEffect(eEffect);
        eEffect = TagEffect(eEffect, TAG_AOEEFFECT);
        // We apply things "for a long time" since no AOE should be permanent. This helps with state scripts like Paralysis
        ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eEffect, oTarget, 10000.0);
    }
}

// Removes persistent RunScripts from oTarget that are applies to oTarget tagged with OBJECT_SELF's OID (ie the AOE's).
// Call in an AOE's OnExit event or op_r_aoecleanup.
// Returns the amount of persistent effects tagged. So if 1+ it is the last AOE they've exited of this type.
// * nOverrideSpellId - Leave as default usually, if set is special cases like Amplify and Silence interacting
int RemovePersistentAOEEffects(object oTarget, int nOverrideSpellId = -1)
{
    int nSpellIdToCheck = nOverrideSpellId > 0 ? nOverrideSpellId : nSpellId;

    string sTag;
    // Carefully clear effects if last RunScript using this spell Id.
    if (GetObjectType(OBJECT_SELF) == OBJECT_TYPE_AREA_OF_EFFECT)
    {
        sTag = ObjectToString(OBJECT_SELF);
        RemoveEffectsFromSpell(oTarget, nSpellId, EFFECT_TYPE_RUNSCRIPT);
    }
    else
    {
        // Assume RunScript
        sTag = GetEffectTag(GetLastRunScriptEffect());
    }

    effect eCheck = GetFirstEffect(oTarget);
    while (GetIsEffectValid(eCheck))
    {
        if (GetEffectType(eCheck) == EFFECT_TYPE_RUNSCRIPT &&
            GetEffectSpellId(eCheck) == nSpellIdToCheck &&
            GetEffectTag(eCheck) != sTag)
        {
            // Don't remove any effects if other RunScript from the same spell exist still
            return 0;
        }
        eCheck = GetNextEffect(oTarget);
    }
    // Get to this point remove all AOEEFFECT effects of nSpellId
    return RemoveEffectsFromSpell(oTarget, nSpellId, EFFECT_TYPE_ALL, TAG_AOEEFFECT);
}

// Returns TRUE if we are OK running our AOE scripts (or the EffectRunScript created by an AOE).
// Does a check for the AOE creator, and destroys ourself (or removes the EffectRunScript) if they no longer exist.
// Call in the OnEnter, OnHeartbeat of an AOE scripts or the Interval of the EffectRunScript created by the AOE.
// This might be removed later (D&D AOEs should probably persist past their creators death) but for now will stop some bugs and is tidier.
int AOECheck()
{
    // If a run script check the effect creator
    object oAOECreator;
    if (GetLastRunScriptEffectScriptType() != 0)
    {
        effect eRunScript = GetLastRunScriptEffect();
        if (GetEffectType(eRunScript) != EFFECT_TYPE_RUNSCRIPT)
            Debug("[AOECheck] Run Script Effect has invalid type.", ERROR);

        if (!GetIsObjectValid(GetEffectCreator(eRunScript)) ||
            !GetIsObjectValid(StringToObject(GetEffectTag(eRunScript))))
        {
            // Remove any RunScript effects which are there to track AOE overlaps etc.
            // This also clears the effects if no other AOEs exist
            RemoveEffectsFromSpell(OBJECT_SELF, GetEffectSpellId(eRunScript), EFFECT_TYPE_RUNSCRIPT, GetEffectTag(eRunScript));
            return FALSE;
        }
    }
    else
    {
        int nEvent = GetCurrentlyRunningEvent();
        if (nEvent == EVENT_SCRIPT_AREAOFEFFECT_ON_HEARTBEAT ||
            nEvent == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_ENTER ||
            nEvent == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_EXIT)
        {
            if (!GetIsObjectValid(GetAreaOfEffectCreator()))
            {
                DestroyObject(OBJECT_SELF);
                return FALSE;
            }
        }
        else
        {
            Debug("[AOECheck] Called outside of run script or AOE event?", ERROR);
        }
    }
    return TRUE;
}

// Signals a spell cast event.
// By default if the default parameters are used then the global automatically
// generated values are used instead.
// * bSignalHostile - If not -1 use SIGNAL_HOSTILE_TRUE, SIGNAL_HOSTILE_FALSE and SIGNAL_HOSTILE_FALSE_BUT_REALLY_TRUE as values so that
//                    illusion saves are done correctly.
void SignalSpellCastAt(object oSignalTarget = OBJECT_INVALID, object oSignalCaster = OBJECT_INVALID, int bSignalHostile = -1, int nSignalSpellId = -1)
{
    int bIllusionSaveForced = FALSE;
    if (oSignalTarget == OBJECT_INVALID) oSignalTarget = oTarget;
    if (oSignalCaster == OBJECT_INVALID) oSignalCaster = oCaster;
    if (nSignalSpellId == -1) nSignalSpellId = nSpellId;
    if (bSignalHostile == -1)
    {
        bSignalHostile = bHostile;
    }
    else if (bSignalHostile == SIGNAL_HOSTILE_TRUE ||
             bSignalHostile == SIGNAL_HOSTILE_FALSE)
    {
        // Ignored, value is correct (TRUE or FALSE)
    }
    else if (bSignalHostile == SIGNAL_HOSTILE_FALSE_BUT_REALLY_TRUE)
    {
        bSignalHostile = FALSE;
        bIllusionSaveForced = TRUE;
    }

    // Do a illusion saving throw now, before any effects are triggered.
    // Doors and placeables automatically fail this. Sorry dudes you just don't have a mind.
    // Done here since we know oSignalTarget is being affected by a hostile spell in context of the script
    if (bSignalHostile || bIllusionSaveForced && GetObjectType(oSignalTarget) == OBJECT_TYPE_CREATURE)
    {
        DoIllusionSavingThrow(oSignalTarget, oSignalCaster);
    }

    SignalEvent(oSignalTarget, EventSpellCastAt(oSignalCaster, nSignalSpellId, bSignalHostile));
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

    Debug("[GetVFXScale] fScale: " + FloatToString(fScale, 10, 4) + " fMax: " + FloatToString(fMax, 10, 4) + " fFinal: " + FloatToString(fFinal, 10, 4));

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
// It also does a check for "Supress with Target" and if that flag is on we are NOT an area of effect if oTarget is valid.
int GetSpellIsAreaOfEffect(int nSpellId)
{
    // If we are "supress with target" flag we don't want to be an AOE
    if (GetIsObjectValid(oTarget))
    {
        string sTargetFlags = Get2DAString("spells", "TargetFlags", nSpellId);
        if (sTargetFlags != "")
        {
            if (StringToInt(sTargetFlags) & SPELL_TARGETING_FLAGS_SUPPRESS_WITH_TARGET)
            {
                return FALSE;
            }
        }
    }
    // Test is more comprehensive to catch errors (ie has to have X or Y set)
    if (Get2DAString("spells", "TargetShape", nSpellId) != "")
    {
        if (Get2DAString("spells", "TargetSizeX", nSpellId) == "" && Get2DAString("spells", "TargetSizeX", nSpellId) == "")
        {
            Debug("[GetSpellIsAreaOfEffect] Spell " + GetSpellName(nSpellId) + " is set with a TargetShape but no valid X or Y size.", ERROR);
            return FALSE;
        }

        return TRUE;
    }
    return FALSE;
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
        case EFFECT_TYPE_ICON:
        {
            // Icons can be many effect types so we use the icon ID to identify them
            // Add more here if you want clearer feedback for things
            switch (GetEffectInteger(eEffect, 0))
            {
                case EFFECT_ICON_CURSE:  return "Curse"; break;
                case EFFECT_ICON_DISEASE:  return "Disease"; break;
                case EFFECT_ICON_POISON:  return "Poison"; break;
            }
        }
        break;
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

// Check if oCreature is not silenced or deaf
int GetCanHear(object oCreature)
{
    if (GetHasEffect(oCreature, EFFECT_TYPE_SILENCE) ||
        GetHasEffect(oCreature, EFFECT_TYPE_DEAF))
    {
        return FALSE;
    }
    return TRUE;
}

// Check if oCreature is silenced
int GetCanSpeak(object oCreature)
{
    if (GetHasEffect(oCreature, EFFECT_TYPE_SILENCE))
    {
        return FALSE;
    }
    return TRUE;
}

// Returns TRUE if oCreature is affected by polymorph
int GetIsPolymorphed(object oCreature)
{
    if (GetHasEffect(oCreature, EFFECT_TYPE_POLYMORPH))
    {
        return TRUE;
    }
    return FALSE;
}

// Returns TRUE if oCreature is of the given RACIAL_TYPE_
// Checks the given racial type, and if they're not polymorphed, the relevant class levels
int GetIsRacialType(object oCreature, int nRacialType)
{
    if (GetRacialType(oCreature) == nRacialType)
        return TRUE;

    if (!GetIsPolymorphed(oCreature))
    {
        int nClass = CLASS_TYPE_INVALID;
        switch (nRacialType)
        {
            case RACIAL_TYPE_ABERRATION:        nClass = CLASS_TYPE_ABERRATION; break;
            case RACIAL_TYPE_ANIMAL:            nClass = CLASS_TYPE_ANIMAL; break;
            case RACIAL_TYPE_BEAST:             nClass = CLASS_TYPE_BEAST; break;
            case RACIAL_TYPE_CONSTRUCT:         nClass = CLASS_TYPE_CONSTRUCT; break;
            case RACIAL_TYPE_DRAGON:            nClass = CLASS_TYPE_DRAGON; break;
            //case RACIAL_TYPE_DWARF:
            case RACIAL_TYPE_ELEMENTAL:         nClass = CLASS_TYPE_ELEMENTAL; break;
            //case RACIAL_TYPE_ELF:
            case RACIAL_TYPE_FEY:
            case RACIAL_TYPE_GIANT:             nClass = CLASS_TYPE_GIANT; break;
            //case RACIAL_TYPE_GNOME:
            //case RACIAL_TYPE_HALFELF:
            //case RACIAL_TYPE_HALFLING:
            //case RACIAL_TYPE_HALFORC:
            //case RACIAL_TYPE_HUMAN:
            case RACIAL_TYPE_HUMANOID_GOBLINOID:
            case RACIAL_TYPE_HUMANOID_MONSTROUS:
            case RACIAL_TYPE_HUMANOID_ORC:
            case RACIAL_TYPE_HUMANOID_REPTILIAN: nClass = CLASS_TYPE_HUMANOID; break;
            case RACIAL_TYPE_MAGICAL_BEAST:      nClass = CLASS_TYPE_MAGICAL_BEAST; break;
            case RACIAL_TYPE_OOZE:               nClass = CLASS_TYPE_OOZE; break;
            case RACIAL_TYPE_OUTSIDER:           nClass = CLASS_TYPE_OUTSIDER; break;
            case RACIAL_TYPE_SHAPECHANGER:       nClass = CLASS_TYPE_SHAPECHANGER; break;
            case RACIAL_TYPE_UNDEAD:             nClass = CLASS_TYPE_UNDEAD; break;
            case RACIAL_TYPE_VERMIN:             nClass = CLASS_TYPE_VERMIN; break;
        }
        if (nClass != CLASS_TYPE_INVALID &&
            GetLevelByClass(nClass, oCreature) > 0)
        {
            return TRUE;
        }
    }

    return FALSE;
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

// Returns TRUE if the given creature is humanoid (base races plus humanoid races; goblinoid, monsterous, orc, reptilian)
int GetIsHumanoidCreature(object oCreature)
{
    if (GetIsRacialType(oCreature, RACIAL_TYPE_DWARF) ||
        GetIsRacialType(oCreature, RACIAL_TYPE_ELF) ||
        GetIsRacialType(oCreature, RACIAL_TYPE_HALFELF) ||
        GetIsRacialType(oCreature, RACIAL_TYPE_HALFLING) ||
        GetIsRacialType(oCreature, RACIAL_TYPE_HALFORC) ||
        GetIsRacialType(oCreature, RACIAL_TYPE_HUMAN) ||
        GetIsRacialType(oCreature, RACIAL_TYPE_HUMANOID_GOBLINOID) ||
        GetIsRacialType(oCreature, RACIAL_TYPE_HUMANOID_MONSTROUS) ||
        GetIsRacialType(oCreature, RACIAL_TYPE_HUMANOID_ORC) ||
        GetIsRacialType(oCreature, RACIAL_TYPE_HUMANOID_REPTILIAN))
    {
        return TRUE;
    }
    return FALSE;
}

// Returns TRUE if the given creature is mindless (Elemental, Undead, Vermin, Construct, Ooze)
int GetIsMindless(object oCreature)
{
    if (GetIsRacialType(oCreature, RACIAL_TYPE_ELEMENTAL) ||
        GetIsRacialType(oCreature, RACIAL_TYPE_UNDEAD) ||
        GetIsRacialType(oCreature, RACIAL_TYPE_VERMIN) ||
        GetIsRacialType(oCreature, RACIAL_TYPE_CONSTRUCT) ||
        GetIsRacialType(oCreature, RACIAL_TYPE_OOZE))
    {
        return TRUE;
    }
    return FALSE;
}

// Returns TRUE if the given creature is flying / floating
int GetIsFlying(object oCreature)
{
    switch (GetAppearanceType(oCreature))
    {
        case APPEARANCE_TYPE_ALLIP:
        case APPEARANCE_TYPE_BAT:
        case APPEARANCE_TYPE_BAT_HORROR:
        case APPEARANCE_TYPE_ELEMENTAL_AIR:
        case APPEARANCE_TYPE_ELEMENTAL_AIR_ELDER:
        case APPEARANCE_TYPE_FAERIE_DRAGON:
        case APPEARANCE_TYPE_FALCON:
        case APPEARANCE_TYPE_FAIRY:
        case APPEARANCE_TYPE_HELMED_HORROR:
        case APPEARANCE_TYPE_IMP:
        case APPEARANCE_TYPE_LANTERN_ARCHON:
        case APPEARANCE_TYPE_MEPHIT_AIR:
        case APPEARANCE_TYPE_MEPHIT_DUST:
        case APPEARANCE_TYPE_MEPHIT_EARTH:
        case APPEARANCE_TYPE_MEPHIT_FIRE:
        case APPEARANCE_TYPE_MEPHIT_ICE:
        case APPEARANCE_TYPE_MEPHIT_MAGMA:
        case APPEARANCE_TYPE_MEPHIT_OOZE:
        case APPEARANCE_TYPE_MEPHIT_SALT:
        case APPEARANCE_TYPE_MEPHIT_STEAM:
        case APPEARANCE_TYPE_MEPHIT_WATER:
        case APPEARANCE_TYPE_QUASIT:
        case APPEARANCE_TYPE_RAVEN:
        case APPEARANCE_TYPE_SHADOW:
        case APPEARANCE_TYPE_SHADOW_FIEND:
        case APPEARANCE_TYPE_SPECTRE:
        case APPEARANCE_TYPE_WILL_O_WISP:
        case APPEARANCE_TYPE_WRAITH:
        case APPEARANCE_TYPE_WYRMLING_BLACK:
        case APPEARANCE_TYPE_WYRMLING_BLUE:
        case APPEARANCE_TYPE_WYRMLING_BRASS:
        case APPEARANCE_TYPE_WYRMLING_BRONZE:
        case APPEARANCE_TYPE_WYRMLING_COPPER:
        case APPEARANCE_TYPE_WYRMLING_GOLD:
        case APPEARANCE_TYPE_WYRMLING_GREEN:
        case APPEARANCE_TYPE_WYRMLING_RED:
        case APPEARANCE_TYPE_WYRMLING_SILVER:
        case APPEARANCE_TYPE_WYRMLING_WHITE:
        case APPEARANCE_TYPE_ELEMENTAL_WATER:
        case APPEARANCE_TYPE_ELEMENTAL_WATER_ELDER:
        case APPEARANCE_TYPE_BEHOLDER:
        case APPEARANCE_TYPE_BEHOLDER_EYEBALL:
        case APPEARANCE_TYPE_BEHOLDER_MAGE:
        case APPEARANCE_TYPE_BEHOLDER_MOTHER:
        case APPEARANCE_TYPE_HARPY:
        case APPEARANCE_TYPE_DEMI_LICH:
            return TRUE;
            break;
    }
    return FALSE;
}

// Returns TRUE if the given creature is living (not undead, not construct)
int GetIsLiving(object oCreature)
{
    if (GetIsRacialType(oCreature, RACIAL_TYPE_CONSTRUCT) ||
        GetIsRacialType(oCreature, RACIAL_TYPE_UNDEAD))
    {
        return FALSE;
    }
    return TRUE;
}

// Returns TRUE if the given creature is a water elemental (Based on appearance)
int GetIsWaterElemental(object oCreature)
{
    switch (GetAppearanceType(oCreature))
    {
        case APPEARANCE_TYPE_ELEMENTAL_WATER:
        case APPEARANCE_TYPE_ELEMENTAL_WATER_ELDER:
            return TRUE;
        break;
    }
    return FALSE;
}

// Returns TRUE if the given creature is a vampire (Based on appearance, plus subrace string)
int GetIsVampire(object oCreature)
{
    switch (GetAppearanceType(oCreature))
    {
        case APPEARANCE_TYPE_VAMPIRE_FEMALE:
        case APPEARANCE_TYPE_VAMPIRE_MALE:
            return TRUE;
        break;
    }
    if (GetStringLowerCase(GetSubRace(oTarget)) == "vampire")
    {
        return TRUE;
    }
    return FALSE;
}

// Returns TRUE if the target has legs (ala Called Shot: Legs can target them)
int GetHasLegs(object oCreature)
{
    int nAppearance = GetAppearanceType(oCreature);

    if (nAppearance != APPEARANCE_TYPE_INVALID)
    {
        return StringToInt(Get2DAString("appearance", "HASLEGS", nAppearance));
    }
    return FALSE;
}

// Returns TRUE if the target has arms (ala Called Shot: Arms can target them)
int GetHasArms(object oCreature)
{
    int nAppearance = GetAppearanceType(oCreature);

    if (nAppearance != APPEARANCE_TYPE_INVALID)
    {
        return StringToInt(Get2DAString("appearance", "HASARMS", nAppearance));
    }
    return FALSE;
}

// Returns TRUE if oObject has at least one effect matching the parameters.
// * nEffectType - Can be EFFECT_TYPE_ALL to be ignored
// * sTag - Only checked if not blank
int GetHasEffect(object oObject, int nEffectType, int nSpellId = SPELL_ANY, string sTag = "")
{
    effect eCheck = GetFirstEffect(oObject);
    while (GetIsEffectValid(eCheck))
    {
        if (nEffectType == EFFECT_TYPE_ALL || GetEffectType(eCheck, TRUE) == nEffectType)
        {
            if (nSpellId == SPELL_ANY || GetEffectSpellId(eCheck) == nSpellId)
            {
                if (sTag == "" || GetEffectTag(eCheck) == sTag)
                {
                    return TRUE;
                }
            }
        }
        eCheck = GetNextEffect(oObject);
    }
    return FALSE;
}

// Returns TRUE if oCreature has at least one effect matching the parameters.
int GetHasEffectOrItemProperty(object oCreature, int nEffectType, int nItemPropertyType)
{
    effect eCheck = GetFirstEffect(oCreature);
    while (GetIsEffectValid(eCheck))
    {
        if (GetEffectType(eCheck, TRUE) == nEffectType)
        {
            return TRUE;
        }
        eCheck = GetNextEffect(oCreature);
    }
    int nSlot;
    for (nSlot = 0; nSlot < NUM_INVENTORY_SLOTS; nSlot++)
    {
        if (GetItemHasItemProperty(GetItemInSlot(nSlot, oCreature), nItemPropertyType))
        {
            return TRUE;
        }
    }
    return FALSE;
}

// Removes effects from the given spell ID. Returns TRUE if one was removed.
// * nSpellId - If SPELL_ANY it will remove any spell Id. -1 or SPELL_INVALID is "Invalid spell ID" so technically still a subset of effects.
// * sTag - If set the tag must match
// * nEffectType - If set the effect type must match
int RemoveEffectsFromSpell(object oObject, int nSpellId, int nEffectType = EFFECT_TYPE_ALL, string sTag = "")
{
    int bRemoved  = FALSE;
    effect eCheck = GetFirstEffect(oObject);
    while (GetIsEffectValid(eCheck))
    {
        if ((nSpellId == SPELL_ANY || GetEffectSpellId(eCheck) == nSpellId) &&
            (nEffectType == EFFECT_TYPE_ALL || GetEffectType(eCheck, TRUE) == nEffectType) &&
            (sTag == "" || GetEffectTag(eCheck) == sTag))
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

// Finds the duration remaining of the given effects of nType on oObject
float GetRemainingDurationOfEffects(object oObject, int nType)
{
    float fReturn = 0.0;
    effect eCheck = GetFirstEffect(oObject);
    while (GetIsEffectValid(eCheck))
    {
        if (GetEffectType(eCheck, TRUE) == nType)
        {
            fReturn += IntToFloat(GetEffectDurationRemaining(eCheck));
        }
        eCheck = GetNextEffect(oObject);
    }
    return fReturn;
}

// Cures a JsonArray of integer effects with some caveats:
// - oTarget - Creature to cure
// - jArray - The array of EFFECT_TYPE_* integers to remove. Note:
//         EFFECT_TYPE_ABILITY_DECREASE - Only removes non-poison, non-disease based ones
//         EFFECT_TYPE_POISON / EFFECT_TYPE_DISEASE - We clean up any poison/disease ability score decreases as well
// - bSuperanturalRemoval - If FALSE it will not remove Supernatural effects.
// Returns TRUE if at least one effect was removed.
int CureEffects(object oTarget, json jArray, int bSupernaturalRemoval = FALSE)
{
    // This could be made more optimal by one effect loop, but it'll do for now
    int bReturn = FALSE;
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        int nTypeToRemove = JsonGetInt(JsonArrayGet(jArray, nIndex));

        effect eCheck = GetFirstEffect(oTarget);
        while (GetIsEffectValid(eCheck))
        {
            // Anything that is applied as Unyielding is not removed (native effects)
            if (!GetEffectTaggedCannotBeCured(eCheck) &&
                GetEffectSubType(eCheck) != SUBTYPE_UNYIELDING &&
                (bSupernaturalRemoval || GetEffectSubType(eCheck) != SUBTYPE_SUPERNATURAL))
            {
                // For now if EFFECT_TYPE_POISON or DISEASE is included we assume ability score loss removal
                int nType = GetEffectType(eCheck, TRUE);
                if (nType == nTypeToRemove ||
                   // Curses can be defined by their icon now
                   (nTypeToRemove == EFFECT_TYPE_CURSE && nType == EFFECT_TYPE_ICON && GetEffectInteger(eCheck, 0) == EFFECT_ICON_CURSE) ||
                   // Poison and Disease cause ability decreases
                   (nType == EFFECT_TYPE_ABILITY_DECREASE && (nTypeToRemove == EFFECT_TYPE_POISON || nTypeToRemove == EFFECT_TYPE_DISEASE)))
                {
                    // Ability scores get special treatment (ie disease/poison)
                    if (nTypeToRemove == EFFECT_TYPE_ABILITY_DECREASE)
                    {
                        // We only want to remove from this non-poison and non-disease values unless it is Poison or Disease
                        int nAbilityDecreaseType = GetEffectInteger(eCheck, 2);

                        //    0 = general direct EffectAbilityDecrease
                        //    1 = poison payload
                        //    2 = disease payload
                        //    3 = called shot
                        //    4 = crippling strike
                        //    5 = On Hit: Ability Drain item property
                        if ((nAbilityDecreaseType == 1 && nTypeToRemove == EFFECT_TYPE_POISON) ||
                            (nAbilityDecreaseType == 2 && nTypeToRemove == EFFECT_TYPE_DISEASE) ||
                            (nAbilityDecreaseType != 1 && nAbilityDecreaseType != 2))
                        {
                            RemoveEffect(oTarget, eCheck);
                            SendCureFeedback(oCaster, oTarget, GetEffectName(eCheck));
                            bReturn = TRUE;
                        }
                        else if (nAbilityDecreaseType == 1)
                        {
                            FloatingTextStringOnCreature("*Poison ability damage cannot be removed by this spell*", oTarget, TRUE, TRUE);
                        }
                        else if (nAbilityDecreaseType == 2)
                        {
                            FloatingTextStringOnCreature("*Disease ability damage cannot be removed by this spell*", oTarget, TRUE, TRUE);
                        }
                        // Old notes we might still use:
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
                    }
                    else
                    {
                        RemoveEffect(oTarget, eCheck);
                        SendCureFeedback(oCaster, oTarget, GetEffectName(eCheck));
                        bReturn = TRUE;
                    }
                }
            }
            eCheck = GetNextEffect(oTarget);
        }
    }
    return bReturn;
}

// Cures nSpellId from oTarget with appropriate feedback
// Returns TRUE if at least one effect was removed.
int CureEffectsFromSpell(object oTarget, int nSpellId)
{
    if (RemoveEffectsFromSpell(oTarget, nSpellId))
    {
        SendCureFeedback(oCaster, oTarget, GetSpellName(nSpellId));
        return TRUE;
    }
    return FALSE;
}

// Removes effects matching the given tag. Returns TRUE if one was removed.
int RemoveEffectsMatchingTag(object oObject, string sTag)
{
    int bRemoved  = FALSE;
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
const string FIELD_METRIC   = "metric";

// If a single target spell checks for nTargetType against global oTarget and adds them to a single object array if so.
// Else if AOE loops through relevant shape to get all the targets in it. It then sorts them using nSortMethod.
// - nTargetType - The SPELL_TARGET_* type to check versus oCaster
// - nSortMethod - The sorting method to apply once all the creatures are added.
//                 SORT_METHOD_NONE      - No sorting (slightly faster)
//                 SORT_METHOD_LOWEST_HP - Sorts so first object is the lowest HP
//                 SORT_METHOD_LOWEST_HD - Sorts so first object is the lowest HD
//                 SORT_METHOD_DISTANCE  - Sorts so the first object is the lowest distance to AOE target location
//                 SORT_METHOD_DISTANCE_TO_CASTER - Sorts so first object is lowest distance to caster
//                 SORT_METHOD_RANDOM    - Intentionally randomises the targets (useful to make it look cooler for Chain Lighting etc.)
// The other variables can be set, but if not then the current Spell Id will sort the shape and size.
// NOTE: if oTargetToIgnore is set it'll be not returned by this array. Use it to
// apply one effect to the primary target, and a different one to secondary ones.
json GetArrayOfTargets(int nTargetType, int nSortMethod = SORT_METHOD_DISTANCE, int nObjectFilter = OBJECT_TYPE_CREATURE, object oTargetToIgnore = OBJECT_INVALID, int nShape = -1, float fSize = -1.0, location lArrayTarget = LOCATION_INVALID, int bLineOfSight = TRUE, vector vOrigin = [ 0.0, 0.0, 0.0 ])
{
    json jArray = JsonArray();

    // If single target we just check and return oTarget
    if (!GetSpellIsAreaOfEffect(nSpellId))
    {
        if (GetSpellTargetValid(oTarget, oCaster, nTargetType))
        {
            json jObject = JsonObject();

            // Just OID no need to sort
            jObject = JsonObjectSet(jObject, FIELD_OBJECTID, JsonString(ObjectToString(oTarget)));

            jArray = JsonArrayInsert(jArray, jObject);
        }
        return jArray;
    }

    float fSafeArea = -1.0;
    // Get some values if not set
    if (nShape == -1) nShape = GetSpellShape(nSpellId);

    if (nShape == SHAPE_HSPHERE)
    {
        // Special case...
        fSafeArea = GetSpellShapeSize(nSpellId, TRUE);   // X
        fSize     = GetSpellShapeSize(nSpellId, FALSE);  // Y
        nShape    = SHAPE_SPHERE;
    }

    if (fSize == -1.0) fSize = GetSpellShapeSize(nSpellId);
    if (!GetIsObjectValid(GetAreaFromLocation(lArrayTarget))) lArrayTarget = lTarget;
    if (nShape == SHAPE_CONE || nShape == SHAPE_SPELLCONE || nShape == SHAPE_SPELLCYLINDER)
    {
        if (vOrigin.x == 0.0 && vOrigin.y == 0.0 && vOrigin.z == 0.0)
        {
            vOrigin = GetPosition(oCaster);
        }
        // Cones etc. can be odd if we target "ourselves" so we move it a little
        // This fix is from the x2_s1_wyrmbreath script
        if (lTarget == GetLocation(oCaster))
        {
            Debug("[GetArrayOfTargets] Redirecting target position due to targeting self for cone/cylinder.", INFO);
            // Since the target and origin are the same, we have to determine the
            // direction of the spell from the facing of OBJECT_SELF (which is more
            // intuitive than defaulting to East everytime).

            // In order to use the direction that OBJECT_SELF is facing, we have to
            // instead we pick a point slightly in front of OBJECT_SELF as the target.
            vector vFinalPosition;
            vector lTargetPosition = GetPositionFromLocation(lTarget);
            vFinalPosition.x = lTargetPosition.x +  cos(GetFacing(oCaster));
            vFinalPosition.y = lTargetPosition.y +  sin(GetFacing(oCaster));
            lTarget = Location(GetAreaFromLocation(lTarget), vFinalPosition, GetFacingFromLocation(lTarget));
        }
    }

    // Error checking - we log these might be mistakes in spell scripts
    if (nTargetType < 0 || nTargetType > 3)
    {
        Debug("[GetArrayOfTargets] nTargetType invalid: " + IntToString(nTargetType), ERROR);
        return jArray;
    }
    if (nSortMethod < 0 || nSortMethod > 5)
    {
        Debug("[GetArrayOfTargets] nSortMethod invalid: " + IntToString(nSortMethod), ERROR);
        return jArray;
    }
    if (nShape < 0 || nShape > 4)
    {
        Debug("[GetArrayOfTargets] nShape invalid: " + IntToString(nShape), ERROR);
        return jArray;
    }
    if (fSize <= 0.0 || fSize >= 50.0)
    {
        Debug("[GetArrayOfTargets] fSize invalid: " + FloatToString(fSize), ERROR);
        return jArray;
    }
    if (!GetIsObjectValid(GetAreaFromLocation(lTarget)))
    {
        Debug("[GetArrayOfTargets] lTarget invalid. Area OID: " + ObjectToString(GetAreaFromLocation(lTarget)), ERROR);
        return jArray;
    }
    if (nObjectFilter < 0 || nObjectFilter > 32767)
    {
        Debug("[GetArrayOfTargets] nObjectFilter invalid: " + IntToString(nObjectFilter), ERROR);
        return jArray;
    }

    // We can accidentially due to maths(TM) target ourselves in the case of cones and cylinders which start on us, so let's not do that.
    int bTargetSelf = TRUE;
    if (nShape == SHAPE_CONE || nShape == SHAPE_SPELLCONE || nShape == SHAPE_SPELLCYLINDER)
    {
        bTargetSelf = FALSE;
    }
    else
    {
        // Target Flags - some spells (eg Wail of the Banshees) can make you be always ignored
        string sTargetFlags = Get2DAString("spells", "TargetFlags", nSpellId);

        if (sTargetFlags != "")
        {
            if (StringToInt(sTargetFlags) & SPELL_TARGETING_FLAGS_IGNORES_SELF)
            {
                bTargetSelf = FALSE;
            }
        }
    }

    object oObject = GetFirstObjectInShape(nShape, fSize, lTarget, bLineOfSight, nObjectFilter, vOrigin);
    while (GetIsObjectValid(oObject))
    {
        if (fSafeArea < 0.0 || GetDistanceBetweenLocations(lTarget, GetLocation(oObject)) > fSafeArea)
        {
            if (GetSpellTargetValid(oObject, oCaster, nTargetType) &&
                oObject != oTargetToIgnore &&
               (bTargetSelf == TRUE || oObject != oCaster))
            {
                json jObject = JsonObject();

                // Metric depends on what we are sorting
                switch (nSortMethod)
                {
                    // SORT_METHOD_NONE or RANDOM - No need to store anything extra
                    case SORT_METHOD_LOWEST_HP: jObject = JsonObjectSet(jObject, FIELD_METRIC, JsonInt(GetCurrentHitPoints(oObject))); break;
                    case SORT_METHOD_LOWEST_HD: jObject = JsonObjectSet(jObject, FIELD_METRIC, JsonInt(GetHitDice(oObject))); break;
                    case SORT_METHOD_DISTANCE: jObject = JsonObjectSet(jObject, FIELD_METRIC, JsonFloat(GetDistanceBetweenLocations(lTarget, GetLocation(oObject)))); break;
                    case SORT_METHOD_DISTANCE_TO_CASTER: jObject = JsonObjectSet(jObject, FIELD_METRIC, JsonFloat(GetDistanceBetween(oCaster, oObject))); break;
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
        nSortMethod == SORT_METHOD_DISTANCE ||
        nSortMethod == SORT_METHOD_DISTANCE_TO_CASTER)
    {
        jArray = JsonArrayTransform(jArray, JSON_ARRAY_SORT_ASCENDING);
    }
    else if (nSortMethod == SORT_METHOD_RANDOM)
    {
        jArray = JsonArrayTransform(jArray, JSON_ARRAY_SHUFFLE);
    }

    return jArray;
}

// Loops through the persistent AOE to get all the targets in it. It then sorts them using nSortMethod.
// - nTargetType - The SPELL_TARGET_* type to check versus oCaster
// - nSortMethod - The sorting method to apply once all the creatures are added.
//                 SORT_METHOD_NONE      - No sorting (slightly faster)
//                 SORT_METHOD_LOWEST_HP - Sorts so first object is the lowest HP
//                 SORT_METHOD_LOWEST_HD - Sorts so first object is the lowest HD
//                 SORT_METHOD_DISTANCE  - Sorts so the first object is the lowest distance to AOE target location
//                 SORT_METHOD_DISTANCE_TO_CASTER - Sorts so first object is lowest distance to caster
//                 SORT_METHOD_RANDOM    - Intentionally randomises the targets (useful to make it look cooler for Chain Lighting etc.)
// - bTargetSelf - If FALSE we won't ever get ourself into the array
// * NOTE: Returns just oTarget if the script running is the AOE's OnEnter.
json GetArrayOfAOETargets(int nTargetType, int nSortMethod = SORT_METHOD_DISTANCE, int nObjectFilter = OBJECT_TYPE_CREATURE, int bTargetSelf = TRUE)
{
    json jArray = JsonArray();

    // If it is the OnEnter script we will return only the entering object. Simplfies some scripts.
    if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_ENTER)
    {
        if (GetSpellTargetValid(oTarget, oCaster, nTargetType))
        {
            json jObject = JsonObject();

            // Just OID no need to sort
            jObject = JsonObjectSet(jObject, FIELD_OBJECTID, JsonString(ObjectToString(oTarget)));

            jArray = JsonArrayInsert(jArray, jObject);
        }
        return jArray;
    }

    // Error checking - we log these might be mistakes in spell scripts
    if (nTargetType < 0 || nTargetType > 3)
    {
        Debug("[GetArrayOfAOETargets] nTargetType invalid: " + IntToString(nTargetType), ERROR);
        return jArray;
    }
    if (nSortMethod < 0 || nSortMethod > 5)
    {
        Debug("[GetArrayOfAOETargets] nSortMethod invalid: " + IntToString(nSortMethod), ERROR);
        return jArray;
    }
    if (nObjectFilter < 0 || nObjectFilter > 32767)
    {
        Debug("[GetArrayOfAOETargets] nObjectFilter invalid: " + IntToString(nObjectFilter), ERROR);
        return jArray;
    }
    if (bTargetSelf != FALSE && bTargetSelf != TRUE)
    {
        Debug("[GetArrayOfAOETargets] bTargetSelf invalid: " + IntToString(bTargetSelf), ERROR);
        return jArray;
    }

    // For an AOE we just do GetFirst/NextInPersistentShape on OBJECT_SELF.
    object oObject = GetFirstInPersistentObject(OBJECT_SELF);
    while (GetIsObjectValid(oObject))
    {
        if (GetSpellTargetValid(oObject, oCaster, nTargetType) && (bTargetSelf == TRUE || oObject != oCaster))
        {
            json jObject = JsonObject();

            // Metric depends on what we are sorting
            switch (nSortMethod)
            {
                // SORT_METHOD_NONE - No need to store anything extra
                case SORT_METHOD_LOWEST_HP: jObject = JsonObjectSet(jObject, FIELD_METRIC, JsonInt(GetCurrentHitPoints(oObject))); break;
                case SORT_METHOD_LOWEST_HD: jObject = JsonObjectSet(jObject, FIELD_METRIC, JsonInt(GetHitDice(oObject))); break;
                case SORT_METHOD_DISTANCE: jObject = JsonObjectSet(jObject, FIELD_METRIC, JsonFloat(GetDistanceBetweenLocations(lTarget, GetLocation(oObject)))); break;
                case SORT_METHOD_DISTANCE_TO_CASTER: jObject = JsonObjectSet(jObject, FIELD_METRIC, JsonFloat(GetDistanceBetween(oCaster, oObject))); break;
            }

            // Add the value we sort with first and OID second so it's part of the sorting later
            jObject = JsonObjectSet(jObject, FIELD_OBJECTID, JsonString(ObjectToString(oObject)));

            jArray = JsonArrayInsert(jArray, jObject);
        }
        oObject = GetNextInPersistentObject(OBJECT_SELF);
    }

    // Sort the array
    // SORT_METHOD_NONE doesn't need any sorting (no data to sort)
    if (nSortMethod == SORT_METHOD_LOWEST_HP ||
        nSortMethod == SORT_METHOD_LOWEST_HD ||
        nSortMethod == SORT_METHOD_DISTANCE ||
        nSortMethod == SORT_METHOD_DISTANCE_TO_CASTER)
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
            Debug("[ERROR] Spell script: " + GetScriptName() + " has target OID is invalid in sorted array loop " + sOID, ERROR);
        }
    }
    return OBJECT_INVALID;
}

// Returns a EffectRunScript with extra data appended. Will NOT set an apply script since you can run things in the current script.
// The data field in the effect will be set with information that isn't set on the effect, and retrieved
// automatically, eg: nMetaMagic, nSpellSaveDC, nSpellLevel
// - bAutomatic - Will use current script name for both scripts and a 6.0 second interval
effect EffectRunScriptEnhanced(int bAutomatic = TRUE, string sRemovedScript = "", string sInteveralScript = "", float fInterval = 0.0)
{
    if (bAutomatic)
    {
        sInteveralScript = GetScriptName();
        sRemovedScript   = GetScriptName();
        fInterval        = 6.0;
    }

    // These are a bit redundant now but just in case we input bad script names...
    if (GetStringLength(sInteveralScript) > 16 ||
        GetStringLength(sRemovedScript) > 16)
    {
        Debug("[EffectRunScriptEnhanced] Script name too long: " + sInteveralScript, ERROR);
        return EffectInvalidEffect();
    }
    if (ResManGetAliasFor(sRemovedScript, RESTYPE_NSS) == "" &&
        ResManGetAliasFor(sInteveralScript, RESTYPE_NSS) == "")
    {
        Debug("[EffectRunScriptEnhanced] Script not found: " + sInteveralScript, ERROR);
        return EffectInvalidEffect();
    }

    // Gather some data for later retrieval
    // This is similar to the op_i_itemprops version but stores only what cannot be altered
    // on the effect.
    // We use a Json object dumped to string for this.
    json jObject = JsonObject();

    jObject = JsonObjectSet(jObject, JSON_FIELD_OVERHAUL, JsonInt(OVERHAUL_VERSION));
    jObject = JsonObjectSet(jObject, JSON_FIELD_SPELLSAVEDC, JsonInt(nSpellSaveDC));
    jObject = JsonObjectSet(jObject, JSON_FIELD_METAMAGIC, JsonInt(nMetaMagic));
    jObject = JsonObjectSet(jObject, JSON_FIELD_CASTERCLASS, JsonInt(nCasterClass));
    jObject = JsonObjectSet(jObject, JSON_FIELD_SPELLLEVEL, JsonInt(nSpellLevel));
    jObject = JsonObjectSet(jObject, JSON_FIELD_SPONTANEOUS, JsonInt(bSpontaneous));
    jObject = JsonObjectSet(jObject, JSON_FIELD_ILLUSIONARY, JsonInt(bIllusionary));
    jObject = JsonObjectSet(jObject, JSON_FIELD_ILLUSIONARYSTRENGTH, JsonInt(nIllusionaryStrength));

    // We intentionally do not set an applied script which is a little buggy (this effect isn't valid yet) and in any case
    // we can apply anything we want in that script inside the main script applying it.
    return EffectRunScript("", sRemovedScript, sInteveralScript, fInterval, JsonDump(jObject));
}

// This tags the given effect with JSON_FIELD_* information and returns it
// * bCannotBeCured - If set to TRUE the effect won't be curable. eg: Barbarian Rage.
effect EffectTagWithMetadata(effect eEffect, int bCannotBeCured = FALSE)
{
    // Gather some data for later retrieval
    // This is similar to the op_i_itemprops version but stores only what cannot be altered
    // on the effect.
    // We use a Json object dumped to string for this.
    json jObject = JsonObject();

    jObject = JsonObjectSet(jObject, JSON_FIELD_OVERHAUL, JsonInt(OVERHAUL_VERSION));
    jObject = JsonObjectSet(jObject, JSON_FIELD_SPELLSAVEDC, JsonInt(nSpellSaveDC));
    jObject = JsonObjectSet(jObject, JSON_FIELD_METAMAGIC, JsonInt(nMetaMagic));
    jObject = JsonObjectSet(jObject, JSON_FIELD_CASTERCLASS, JsonInt(nCasterClass));
    jObject = JsonObjectSet(jObject, JSON_FIELD_SPELLLEVEL, JsonInt(nSpellLevel));
    jObject = JsonObjectSet(jObject, JSON_FIELD_SPONTANEOUS, JsonInt(bSpontaneous));
    jObject = JsonObjectSet(jObject, JSON_FIELD_CANNOT_BE_CURED, JsonInt(bCannotBeCured));

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

// Retrieves the effects "Can it be removed by CureEffect"? EG to stop Barbarian Rage being "cured" (need to be set with EffectTagWithMetadata)
int GetEffectTaggedCannotBeCured(effect eEffect)
{
    return GetJsonMetadataIntField(GetEffectTag(eEffect), JSON_FIELD_CANNOT_BE_CURED, 0);
}

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
        Debug("[EffectTrackItemProperties] No OIDs set so can't remove item properties later.", ERROR);
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
    if (GetIsPC(oTarget) || (GetIsObjectValid(oMaster) && GetIsPC(oMaster)))
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
    float fReturn   = fDuration;
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
        case "hsphere": return SHAPE_HSPHERE; break;
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
    string sColumn = bX == TRUE ? "TargetSizeX" : "TargetSizeY";

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
        Debug("[GetTargetInAOEAtLocation] AOE ref: " + IntToString(nAOE) + " has no radius set and this function only supports spheres right now.", ERROR);
        return FALSE;
    }
    // Simplest way that also adheres to LOS checks
    json jArray = GetArrayOfTargets(nTargetType, SORT_METHOD_NONE, OBJECT_TYPE_CREATURE, OBJECT_INVALID, SHAPE_SPHERE, fRadius, lCheckTarget);
    if (JsonGetLength(jArray) > 0)
    {
        return TRUE;
    }
    return FALSE;
}

// Create a rising or falling pillar with a certain visual effect. Looks cool
// but quite expensive on the graphics engine, so don't get too mad with it
void TLVFXPillar(int nVFX, location lStart, int nIterations = 3, float fDelay = 0.1f, float fZOffset = 6.0f, float fStepSize = -2.0f)
{
    vector vLoc = GetPositionFromLocation(lStart);
    vector vNew = vLoc;
    vNew.z += fZOffset;
    location lNew;
    int nCount;

    for (nCount = 0; nCount < nIterations; nCount++)
    {
        lNew = Location(GetAreaFromLocation(lStart), vNew, 0.0f);
        if (fDelay > 0.0f)
        {
            DelayCommand(fDelay * nCount, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(nVFX), lNew));
        }
        else
        {
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(nVFX), lNew);
        }
        vNew.z += fStepSize;
    }
}

// Gets the generated AOE ground object matching the tag of nAOE. We simply cycle all
// the objects with the same tag until we meet one without a variable stating we've
// returned it already, thus this can only work once!
object GetGeneratedAOE(int nAOE)
{
    string sTag = Get2DAString("vfx_persistent", "LABEL", nAOE);

    if (sTag == "") Debug("[GetGeneratedAOE] nAOE has no Label: " + IntToString(nAOE), ERROR);

    int nNth       = 0;
    object oTagged = GetObjectByTag(sTag, nNth);
    while (GetIsObjectValid(oTagged))
    {
        if (GetObjectType(oTagged) == OBJECT_TYPE_AREA_OF_EFFECT &&
            GetAreaOfEffectCreator(oTagged) == oCaster &&
            !GetLocalInt(oTagged, "RETURNED_BY_GetGeneratedAOE"))
        {
            SetLocalInt(oTagged, "RETURNED_BY_GetGeneratedAOE", TRUE);
            return oTagged;
        }
        oTagged = GetObjectByTag(sTag, ++nNth);
    }
    return OBJECT_INVALID;
}

// Fires the ITEM_PROPERTY_SPELL_SCRIPT file, after making sure the spell hook will be ignored using the SPELL_HOOK_IGNORE script parameter
void FireItemPropertySpellScript()
{
    SetScriptParam(SCRIPT_PARAMETER_SKIP_SPELL_HOOK, "1");
    ExecuteScript(ITEM_PROPERTY_SPELL_SCRIPT);
}

// Retrieves the correct DAMAGE_POWER_PLUS_* constant based on the input integer.
// Used for EffectDamageReduction and some item properties and other things.
// Returns DAMAGE_POWER_PLUS_ONE by default.
int GetDamagePowerPlusValue(int nPower)
{
    switch (nPower)
    {
        case 1: return DAMAGE_POWER_PLUS_ONE; break;
        case 2: return DAMAGE_POWER_PLUS_TWO; break;
        case 3: return DAMAGE_POWER_PLUS_THREE; break;
        case 4: return DAMAGE_POWER_PLUS_FOUR; break;
        case 5: return DAMAGE_POWER_PLUS_FIVE; break;
        case 6: return DAMAGE_POWER_PLUS_SIX; break;
        case 7: return DAMAGE_POWER_PLUS_SEVEN; break;
        case 8: return DAMAGE_POWER_PLUS_EIGHT; break;
        case 9: return DAMAGE_POWER_PLUS_NINE; break;
        case 10: return DAMAGE_POWER_PLUS_TEN; break;
        case 11: return DAMAGE_POWER_PLUS_ELEVEN; break;
        case 12: return DAMAGE_POWER_PLUS_TWELVE; break;
        case 13: return DAMAGE_POWER_PLUS_THIRTEEN; break;
        case 14: return DAMAGE_POWER_PLUS_FOURTEEN; break;
        case 15: return DAMAGE_POWER_PLUS_FIFTEEN; break;
        case 16: return DAMAGE_POWER_PLUS_SIXTEEN; break;
        case 17: return DAMAGE_POWER_PLUS_SEVENTEEN; break;
        case 18: return DAMAGE_POWER_PLUS_EIGHTEEN; break;
        case 19: return DAMAGE_POWER_PLUS_NINTEEN; break;
        case 20: return DAMAGE_POWER_PLUS_TWENTY; break;
    }
    return DAMAGE_POWER_PLUS_ONE;
}

// Retrieves the correct DAMAGE_BONUS_* constant based on the input integer.
// Used for EffectDamageIncrease and related item properites.
// Returns DAMAGE_BONUS_1 by default, and a maximum of DAMAGE_BONUS_20.
int GetDamageBonusValue(int nBonus)
{
    switch (nBonus)
    {
        case 1: return DAMAGE_BONUS_1; break;
        case 2: return DAMAGE_BONUS_2; break;
        case 3: return DAMAGE_BONUS_3; break;
        case 4: return DAMAGE_BONUS_4; break;
        case 5: return DAMAGE_BONUS_5; break;
        case 6: return DAMAGE_BONUS_6; break;
        case 7: return DAMAGE_BONUS_7; break;
        case 8: return DAMAGE_BONUS_8; break;
        case 9: return DAMAGE_BONUS_9; break;
        case 10: return DAMAGE_BONUS_10; break;
        case 11: return DAMAGE_BONUS_11; break;
        case 12: return DAMAGE_BONUS_12; break;
        case 13: return DAMAGE_BONUS_13; break;
        case 14: return DAMAGE_BONUS_14; break;
        case 15: return DAMAGE_BONUS_15; break;
        case 16: return DAMAGE_BONUS_16; break;
        case 17: return DAMAGE_BONUS_17; break;
        case 18: return DAMAGE_BONUS_18; break;
        case 19: return DAMAGE_BONUS_19; break;
        case 20: return DAMAGE_BONUS_20; break;
    }
    // Max bonus for now
    if (nBonus > 20) return DAMAGE_BONUS_20;
    return DAMAGE_BONUS_1;
}

// Gets the creature size modifier for grapple and bull rush
// If oCreature is invalid it uses nCreatureSize
int GetCreatureSizeModifier(object oCreature = OBJECT_INVALID, int nCreatureSize = CREATURE_SIZE_MEDIUM)
{
    if (GetIsObjectValid(oCreature))
    {
        nCreatureSize = GetCreatureSize(oTarget);
    }
    int nModifier = 0;
    switch (GetCreatureSize(oTarget))
    {
        case CREATURE_SIZE_TINY: nModifier = -8; break;
        case CREATURE_SIZE_SMALL: nModifier = -4; break;
        case CREATURE_SIZE_MEDIUM: nModifier = 0; break;
        case CREATURE_SIZE_LARGE: nModifier = 4; break;
        case CREATURE_SIZE_HUGE: nModifier = 8; break;
    }
    return nModifier;
}

// Gets the creature size modifier for attack rolls
// If oCreature is invalid it uses nCreatureSize
int GetCreatureSizeAttackModifier(object oCreature = OBJECT_INVALID, int nCreatureSize = CREATURE_SIZE_MEDIUM)
{
    if (GetIsObjectValid(oCreature))
    {
        nCreatureSize = GetCreatureSize(oTarget);
    }
    int nModifier = 0;
    switch (GetCreatureSize(oTarget))
    {
        case CREATURE_SIZE_TINY: nModifier = 2; break;
        case CREATURE_SIZE_SMALL: nModifier = 1; break;
        case CREATURE_SIZE_MEDIUM: nModifier = 0; break;
        case CREATURE_SIZE_LARGE: nModifier = -1; break;
        case CREATURE_SIZE_HUGE: nModifier = -2; break;
    }
    return nModifier;
}

// Does a grapple check based on the input characteristics along with feedback to the target/caster
// Grapple checks are made with an opposed roll;
//     oGrappler: 1d20 + bab + strength modifier + size modifier
// vs. oGrappled: 1d20 + base attack bonus + strength modifier + size modifier.
// Returns TRUE if oGrappler manages to grapple oGrappled (ties go to oGrappled)
int DoGrappleCheck(object oGrappled, object oGrappler, int nGrapplerBAB, int nGrapplerStrengthModifier, int nGrapplerSize = CREATURE_SIZE_MEDIUM)
{
    // oGrappler variables
    int nGrapplerRoll = d20();
    int nGrapplerSizeModifier = GetCreatureSizeModifier(OBJECT_INVALID, nGrapplerSize);
    int nGrapplerModifiers = nGrapplerBAB + nGrapplerStrengthModifier + nGrapplerSizeModifier;

    // oGrappled variables
    int nGrappledRoll = d20();
    int nGrappledBAB  = GetBaseAttackBonus(oGrappled);
    int nGrappledStrength = GetAbilityModifier(ABILITY_STRENGTH, oGrappled);
    int nGrappledSize = GetCreatureSizeModifier(oGrappled);
    int nGrappledModifiers = nGrappledBAB + nGrappledStrength + nGrappledSize;

    int bResult = (nGrapplerRoll + nGrapplerBAB + nGrapplerStrengthModifier + nGrapplerSizeModifier > nGrappledRoll + nGrappledModifiers);

    // Report result
    SendGrappleCheckFeedbackMessage(oGrappled, oGrappler, bResult, nGrappledRoll, nGrappledModifiers, nGrapplerRoll, nGrapplerModifiers);

    return bResult;
}

// Bull rush checks are made with an opposed roll;
//   oBullRusher: 1d20 + strength modifier + size modifier + charge bonus
// vs. oDefender: 1d20 + strength modifier + size modifier.
// Returns TRUE if oDefender is rushed by oBullRusher (ties defender wins)
int DoBullRushCheck(object oDefender, object oBullRusher, int nBullRusherStrengthModifier, int nBullRusherSize = CREATURE_SIZE_MEDIUM, int nBullRusherChargeBonus = 2)
{
    // oBullRusher variables
    int nBullRusherRoll = d20();
    int nBullRusherSizeModifier = GetCreatureSizeModifier(OBJECT_INVALID, nBullRusherSize);

    // oDefender variables
    int nDefenderRoll = d20();
    int nDefenderStrengthModifier = GetAbilityModifier(ABILITY_STRENGTH, oDefender);
    int nDefenderSizeModifier = GetCreatureSizeModifier(oDefender);

    int bResult = (nBullRusherRoll + nBullRusherStrengthModifier + nBullRusherSizeModifier + nBullRusherChargeBonus > nDefenderRoll + nDefenderStrengthModifier + nDefenderSizeModifier);

    // Report result
    SendBullRushCheckFeedbackMessage(oDefender, oBullRusher, bResult, nDefenderRoll, nDefenderStrengthModifier + nDefenderSizeModifier, nBullRusherRoll, nBullRusherStrengthModifier + nBullRusherSizeModifier + nBullRusherChargeBonus);

    return bResult;
}

// Attack checks are made with an opposed roll (with a critical only on a 20);
//   oAttacker: 1d20 + BAB (or caster level) + ability modifier (strength or if a spell can be int, etc.)
//              + misc modifier (eg: Bigby hand size modifier, attack bonuses, etc.) + size modifier
// vs. oTarget: AC
// Returns 0 on miss, 1 on hit or 2 on critical hit
int DoAttackRoll(object oTarget, object oAttacker, int nAttackerBAB, int nAttackerAbilityModifier, int nAttackerMiscModifier, int nAttackerSize = CREATURE_SIZE_MEDIUM)
{
    // Versus variables
    int nAttackerRoll = d20();
    int nAttackerSizeModifier = GetCreatureSizeAttackModifier(OBJECT_INVALID, nAttackerSize);
    int nModifiers = nAttackerAbilityModifier + nAttackerMiscModifier + nAttackerSizeModifier;

    // Target variables
    int nAC = GetAC(oTarget); // TODO: Add on bonuses of AC vs. oVersus as if an actual attack

    int nResult = (nAttackerRoll + nModifiers >= nAC);

    // 20 is critical
    if (nAttackerRoll == 20)
    {
        nResult = 2;
    }

    // For now just hit/miss/critical.
    int nAttackResult = ATTACK_RESULT_MISS;
    switch (nResult)
    {
        case 0: nAttackResult = ATTACK_RESULT_MISS; break;
        case 1: nAttackResult = ATTACK_RESULT_HIT_SUCCESSFUL; break;
        case 2: nAttackResult = ATTACK_RESULT_CRITICAL_HIT; break;
    }

    // Report result
    SendAttackRollFeedbackMessage(oTarget, oAttacker, nAttackResult, nAC, nAttackerRoll, nModifiers);

    return nResult;
}

// Used for the scaling DC of various monster abilities.
// If they are polymorphed it will check for shifter / druid levels.
// Parameters:
// oCaster       - The Shifter. If there are no shifter levels it will default to their HD.
// nDCConst      - SPELLABILITY_DC_VERY_EASY   = 10 + levels / 3
//                 SPELLABILITY_DC_EASY        = 10 + levels / 2
//                 SPELLABILITY_DC_EASY_MEDIUM = 12 + levels / 2
//                 SPELLABILITY_DC_NORMAL      = 15 + levels / 2
//                 SPELLABILITY_DC_HARD        = 10 + levels
// bAddDruidLevels - Take druid levels into account if a polymorphed ability
int GetSpellabilitySaveDC(object oCaster, int nDCConst = SPELLABILITY_DC_NORMAL, int bAddDruidLevels = FALSE)
{
    int nLevel = 0;

    // If we are polymorphed we assume it's a druid or shifter ability.
    if (GetIsPolymorphed(oCaster))
    {
        // Calculate the overall level of the shifter used for DC determination
        nLevel = GetLevelByClass(CLASS_TYPE_SHIFTER, oCaster);

        if (bAddDruidLevels)
        {
            nLevel += GetLevelByClass(CLASS_TYPE_DRUID, oCaster);
        }
    }
    // Worst case we have a polymorphed ability with no shifter involved.
    // Maybe we will whitelist abilities at some stage to be shifter/not shifter
    if (nLevel == 0)
    {
        nLevel = GetHitDice(oCaster);
    }

    // Calculate the DC based on the requested DC constant
    int nDC;
    switch(nDCConst)
    {
        case SPELLABILITY_DC_VERY_EASY:
            nDC = 10 + nLevel/3;
        break;
        case SPELLABILITY_DC_EASY:
            nDC = 10 + nLevel/2;
        break;
        case SPELLABILITY_DC_EASY_MEDIUM:
            nDC = 12 + nLevel/2;
        break;
        case SPELLABILITY_DC_NORMAL:
            nDC = 15 + nLevel/2;
        break;
        case SPELLABILITY_DC_HARD:
            nDC = 10 + nLevel;
        break;
    }
    return nDC;
}

// Clones oCreature and returns the resulting clone. It will also fix it so it isn't considered a PC, and clears the inventory.
// Equipped items are marked to not be droppable as well just in case.
// * fMaxHPPercent - The percentage of HP to have the clone set to
object CreateClone(object oCreature, location lSpawn, float fMaxHPPercent = 100.0)
{
    json jClone = ObjectToJson(oTarget, FALSE);

    // Not a PC!
    jClone = GffReplaceByte(jClone, "IsPC", 0);

    // Cannot be disarmed
    jClone = GffReplaceByte(jClone, "Disarmable", 0);

    // Delete inventory
    jClone = JsonObjectDel(jClone, "ItemList");

    // Set that held items cannot be dropped

    // Set Max HP
    int nHP = JsonGetInt(GffGetByte(jClone, "MaxHitPoints"));

    if (fMaxHPPercent < 100.0) nHP = FloatToInt((IntToFloat(nHP) * fMaxHPPercent) / 100.0);

    jClone = GffReplaceByte(jClone, "MaxHitPoints", nHP);
    jClone = GffReplaceByte(jClone, "CurrentHitPoints", nHP);
    jClone = GffReplaceByte(jClone, "HitPoints", nHP);

    // Set scripts
    jClone = GffReplaceResRef(jClone, "ScriptHeartbeat", "nw_ch_ac1");
    jClone = GffReplaceResRef(jClone, "ScriptUserDefine", "nw_ch_acd");
    jClone = GffReplaceResRef(jClone, "ScriptSpellAt", "nw_ch_acb");
    jClone = GffReplaceResRef(jClone, "ScriptDisturbed", "nw_ch_ac8");
    jClone = GffReplaceResRef(jClone, "ScriptDamaged", "nw_ch_ac5");
    jClone = GffReplaceResRef(jClone, "ScriptRested", "nw_ch_aca");
    jClone = GffReplaceResRef(jClone, "ScriptEndRound", "nw_ch_ac3");
    jClone = GffReplaceResRef(jClone, "ScriptSpawn", "nw_ch_ac9");
    jClone = GffReplaceResRef(jClone, "ScriptDeath", "nw_ch_ac7");
    jClone = GffReplaceResRef(jClone, "ScriptOnNotice", "nw_ch_ac2");
    jClone = GffReplaceResRef(jClone, "ScriptDialogue", "nw_ch_ac4");
    jClone = GffReplaceResRef(jClone, "ScriptAttacked", "nw_ch_ac5");
    jClone = GffReplaceResRef(jClone, "ScriptOnBlocked", "nw_ch_ace");

    // Set no conversation
    jClone = GffReplaceResRef(jClone, "Conversation", "");

    // Set faction to standard hostile
    jClone = GffReplaceWord(jClone, "FactionID", STANDARD_FACTION_HOSTILE);

    object oClone = JsonToObject(jClone, lTarget);

    // Inventory slots shouldn't be droppable and make cursed just in case
    // Move this to Json once we have some code for it.
    int i;
    for (i = 0; i < NUM_INVENTORY_SLOTS; i++)
    {
        object oItem = GetItemInSlot(i, oClone);
        SetItemCursedFlag(oItem, TRUE);
        SetDroppableFlag(oItem, FALSE);
    }

    // Return the clone for further changes in the script running it
    return oClone;
}
