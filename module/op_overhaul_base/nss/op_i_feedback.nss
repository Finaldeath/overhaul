//::///////////////////////////////////////////////
//:: Feedback Include
//:: op_i_feedback
//:://////////////////////////////////////////////
/*
    This is a include file that deals with sending feedback messages both
    mimicing the original games and for new ones.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_debug"
#include "utl_i_strings"

// Fake IMMUNITY_TYPE_* for the feedback function
const int IMMUNITY_TYPE_PETRIFICATION = -2;

// Colour codes
const string FEEDBACK_COLOUR_FEEDBACK   = "<c\xFF\xFF\x01>";  // Yellow
const string FEEDBACK_COLOUR_COMBAT     = "<c\xFF\x66\x01>";  // Orange
const string FEEDBACK_COLOUR_MAGIC      = "<c\xCC\x77\xFF>";  // Purple
const string FEEDBACK_COLOUR_SKILLS     = "<c\x01\x66\xFF>";  // Dark Blue
const string FEEDBACK_COLOUR_SAVING     = "<c\x66\xCC\xFF>";  // Pale Blue
const string FEEDBACK_COLOUR_SAVESTATUS = "<c\x20\xFF\x20>";  // some kind of green.
const string FEEDBACK_COLOUR_PAUSESTATE = "<c\xFF\x01\x01>";  // bright red.
const string FEEDBACK_COLOUR_CLIENTNAME = "<c\x99\xFF\xFF>";  // Cyan blue? (Client creature name)
const string FEEDBACK_COLOUR_OTHERNAME  = "<c\xCC\x99\xCC>";  // Disgusting purple (other creature names)
const string FEEDBACK_COLOUR_DRAIN      = "<c\xFF\x01\x01>";  // horrifically sad, depressing, and draining red
const string FEEDBACK_COLOUR_HINT       = "<c\xFF\xFF\x01>";  // For Loadscreen Hints. Yellow.

const string FEEDBACK_COLOUR_END = "</c>";

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

const int STRREF_DISPEL_MAGIC = 791;  // Dispel Magic

// Skill check results
const int STRREF_FAILURE                = 5353;
const int STRREF_SUCCESS                = 5352;
const int STRREF_CRITICAL_FAILURE       = 8100;
const int STRREF_SUCCESS_NOT_POSSIBLE   = 8101;
const int STRREF_AUTOMATIC_SUCCESS      = 53306;
const int STRREF_SUCCESS_NEVER_POSSIBLE = 40091;
const int STRREF_TAKE20                 = 10485;
// Results to get above TLK strings
const int SKILL_RESULT_FAILURE                = 0;
const int SKILL_RESULT_SUCCESS                = 1;
const int SKILL_RESULT_CRITICAL_FAILURE       = 2;
const int SKILL_RESULT_SUCCESS_NOT_POSSIBLE   = 3;
const int SKILL_RESULT_AUTOMATIC_SUCCESS      = 4;
const int SKILL_RESULT_SUCCESS_NEVER_POSSIBLE = 5;
// Attack roll results
const int STRREF_HIT                  = 511;
const int STRREF_PARRIED              = 1463;
const int STRREF_CRITICAL_HIT         = 5224;
const int STRREF_MISS                 = 514;
const int STRREF_RESISTED             = 53241; // for ATTACK_RESISTED
const int STRREF_FAILED               = 53300; // for ATTACK_FAILED
const int STRREF_AUTOMATIC_HIT        = 61628;
const int STRREF_TARGET_CONCEALED     = 62337;
const int STRREF_ATTACKER_MISS_CHANCE = 62336;
const int STRREF_DEVASTATING_CRITICAL = 1769;
// Results to get above TLK strings (not implemented yet, only HIT and MISS are)
const int ATTACK_RESULT_INVALID              = 0;
const int ATTACK_RESULT_HIT_SUCCESSFUL       = 1;
const int ATTACK_RESULT_PARRIED              = 2;
const int ATTACK_RESULT_CRITICAL_HIT         = 3;
const int ATTACK_RESULT_MISS                 = 4;
const int ATTACK_RESULT_ATTACK_RESISTED      = 5;
const int ATTACK_RESULT_ATTACK_FAILED        = 6;
const int ATTACK_RESULT_AUTOMATIC_HIT        = 7;
const int ATTACK_RESULT_TARGET_CONCEALED     = 8;
const int ATTACK_RESULT_ATTACKER_MISS_CHANCE = 9;
const int ATTACK_RESULT_DEVASTATING_CRITICAL = 10;

const int STRREF_VERSUS = 7603; // "vs."

// Basic feedback strings Bioware have thus are translated (albeit with several formatting errors, oh well!)
// Some may be used by the engine in which case we can override them in some cases.
const int STRREF_TARGET_GRAPPLED = 2478; // *Target grappled!*
const int STRREF_FAILURE_NOT_ENOUGH_XP_TO_CREATE_THAT_ITEM = 3785; // * Failure - Not enough XP to create that item *
const int STRREF_FAILURE_YOU_DO_NOT_POSSESS_ENOUGH_GOLD_TO_CREATE_THAT_ITEM = 3786; // * Failure! - You do not possess enough gold to create that item *
const int STRREF_SUCCESS_ITEM_CREATED = 8502; // * Success - Item created! *
const int STRREF_YOU_HAVE_BEEN_TURNED_TO_STONE = 40579; // You have been turned to stone.
const int STRREF_FAILURE_YOU_DO_NOT_HAVE_THE_NECESSARY_FEAT_TO_ENCHANT_THIS_ITEM = 40487; // * Failure  - You do not have the necessary feat to enchant this item *
const int STRREF_THIS_ABILITY_IS_TIED_TO_YOUR_TURN_UNDEAD_ABILITY_WHICH_HAS_NO_MORE_USES_FOR_TODAY = 40550; // This ability is tied to your turn undead ability, which has no more uses for today.
const int STRREF_RROOAARR = 58651; // *RROOAARR*
const int STRREF_HOOOOOWL = 59426; // *HOOOOOWL*
const int STRREF_FAILURE_POTIONS_CAN_NOT_HOLD_SPELLS_HIGHER_THAN_LEVEL_3 = 76416; // * Failure - potions can not hold spells higher than level 3 *
const int STRREF_FAILURE_ITEM_CREATION_NOT_SUCCESSFUL = 76417; // * Failure - Item creation not successful! *
const int STRREF_TARGET_EVADES_GRAPPLE_ATTEMPT = 83309; // *Target evades grapple attempt*
const int STRREF_SPELL_FAILED_TARGET_MUST_BE_CREATURE_OR_AN_ITEM_THAT_CAN_BE_EQUIPPED = 83326; // * Spell failed - Target must be creature or an item that can be equipped *
const int STRREF_FAILURE_YOU_CAN_NOT_USE_THIS_ITEM_WHILE_IN_COMBAT = 83352; // * Failure: You can not use this item while in combat! *
const int STRREF_FAILURE_USE_ON_ARMOR_OR_HELMET_ONLY               = 83353; // * Failure: Use on armor or helmet only! *
const int STRREF_FAILURE_ITEM_MUST_BE_IN_YOUR_POSESSION            = 83354; // * Failure: Item must be in your possession *
const int STRREF_FAILURE_TARGET_MUST_BE_A_MELEE_WEAPON_OR_PROJECTILE = 83359; // * Failure: Target must be a melee weapon or projectile *
const int STRREF_NOTHING_HAPPENS = 83360; // * Nothing happens *
const int STRREF_SUCCESS_THE_WEAPON_IS_COATED_WITH_POISON = 83361; // * Success: The weapon is coated with poison *
const int STRREF_FAILURE_WEAPON_ALREADY_POISONED = 83362; // * Failure: Weapon already poisoned *
const int STRREF_FAILURE_TARGET_WEAPON_MUST_DO_SLASHING_OR_PIERCING_DAMAGE = 83367; // * Failure: Target weapon must do slashing or piercing damage *
const int STRREF_FAILURE_DEXTERITY_CHECK_FAILED = 83368; // * Failure: Dexterity check failed *
const int STRREF_AUTOMATIC_SUCCESS_USE_POISON_FEAT = 83369; // * Automatic Success: Use Poison feat *
const int STRREF_USE_POISON_DEXTERITY_CHECK_SUCCESS = 83370; // * Use Poison: Dexterity check success! *
const int STRREF_FAILURE_CAN_NOT_USE_ONE_ITEM_TO_ENCHANT_ANOTHER = 83373; // * Failure - Can not use one item to enchant another! *
const int STRREF_ITEM_CREATION_FAILED_MISSING_REQUIRED_MATERIAL_COMPONENT = 83374; // * Item Creation Failed - Missing required required material component *
const int STRREF_FAILURE_INVALID_TARGET = 83384; // * Failure - Invalid Target *
const int STRREF_FAILURE_ITEM_ALREADY_HAS_THAT_PROPERTY = 83385; // * Failure - Item already has that property! *
const int STRREF_SUCCESS_ITEM_HAS_BEEN_ENCHANTED_WITH_A_NEW_PROPERTY = 83386;// * Success - Item has been enchanted with a new property! *
const int STRREF_FAILURE_THIS_WEAPON_IS_ALREADY_POISONOUS = 83407; // * Failure!  This weapon is already poisonous *
const int STRREF_FAILURE_OBJECT_IS_NOT_A_VALID_TARGET_FOR_THIS_SPELL = 83453; // *Failure - Object is not a valid target for this spell *
const int STRREF_WEAPON_ALREADY_ENCHANTED = 83566; // * Weapon already enchanted *
const int STRREF_YOU_CAN_NOT_CONCENTRATE_ON_USING_THIS_ABILITY_EFFECTIVELY = 83576; // * You can not concentrate on using this ability effectively *
const int STRREF_TREMBLING_WITH_FEAR = 83583; // * trembling with fear! *
const int STRREF_WHIRLWIND_ATTACK = 83603; // * Whirlwind Attack *
const int STRREF_IMPROVED_WHIRLWIND_ATTACK = 83604; // * Improved Whirlwind Attack *
const int STRREF_ITEM_CREATION_FEATS_ARE_NOT_ENABLED_IN_THIS_MODULE = 83612; // * Item creation feats are not enabled in this module *
const int STRREF_SPELL_FAILED_TARGET_MUST_BE_A_MELEE_WEAPON_OR_CREATURE_WITH_A_MELEE_WEAPON_EQUIPPED = 83615; // * Spell Failed - Target must be a melee weapon or creature with a melee weapon equipped *
const int STRREF_INVALID_TARGET_SPELL_MUST_BE_CAST_ON_QUARTERSTAFF = 83620; // * Invalid Target - This spell must be cast on a quarterstaff *
const int STRREF_INVALID_TARGET_THIS_SPELL_MUST_BE_CAST_ON_A_SLASHING_WEAPON = 83621; // * Invalid Target - This spell must be cast on a slashing weapon *
const int STRREF_FAILURE_WANDS_CAN_NOT_HOLD_SPELLS_HIGHER_THAN_LEVEL_4 = 83623; // * Failure! - wands can not hold spells higher than level 4 *
const int STRREF_THIS_OBJECT_CAN_NOT_BE_BROUGHT_BACK_FROM_THE_DEAD = 83861; // This object can not be brought back from the dead!
const int STRREF_YOUR_ARMOR_WAS_TORN_AWAY = 84426; // * Your armor was torn away! *
const int STRREF_YOUR_ARMOR_WAS_DESTROYED = 84428; // * Your armor was destroyed! *
const int STRREF_YOUR_SHIELD_WAS_TORN_AWAY = 84429; // * Your shield was torn away! *
const int STRREF_YOUR_SHIELD_WAS_DESTROYED = 84430; // * Your shield was destroyed! *
const int STRREF_CONCENTRATION_CROKEN_SUMMONED_CREATURE_DISPELLED = 84481; // * Concentration broken, summoned creature dispelled *
const int STRREF_TARGET_IMMUNE = 84525; // * Target immune *
const int STRREF_GAZE_ATTACK_FAILED_BLINDED = 84530; // * Gaze attack failed - blinded! *
const int STRREF_FAILURE_THIS_SPELL_IS_NOT_SUPPORTED_ON_WANDS_SCROLLS_OR_POTIONS = 84544; // * Failure - This spell is not supported on wands, scrolls or potions *
const int STRREF_WILD_MAGIC_SURGE = 84829; // * wild magic surge *
const int STRREF_DEAFENED = 85388; // Deafened!
const int STRREF_FAILURE_THIS_SPELL_ONLY_AFFECTS_UNDEAD_CREATURES = 85390; // * Failure! - This spell only affects undead creatures *
const int STRREF_THIS_ABILITY_IS_TIED_TO_YOUR_BARD_SONG_ABILITY_WHICH_HAS_NO_MORE_USES_FOR_TODAY = 85587; // This ability is tied to your bard song ability, which has no more uses for today.
const int STRREF_IMMUNE_TO_UNDEAD_GRAFT = 85591; // * Immune to Undead Graft ! *
const int STRREF_YOU_CAN_NOT_USE_THIS_FEAT_WHILE_SILENCED = 85764; // * You can not use this feat while silenced *
const int STRREF_FAILURE_DOOR_UNAFFECTED_BY_MAGIC = 83887; // * Failure! - Door unaffected by magic *
const int STRREF_TARGET_ALREADY_HAS_THIS_EFFECT = 100775; // Target already has this effect!
const int STRREF_CHAOS_SHIELD_TRIGGERED = 100925; // * Chaos Shield Triggered *
const int STRREF_AREA_OF_EFFECT_DISPELLED = 100929; // * Area of effect dispelled  *
const int STRREF_AREA_OF_EFFECT_NOT_DISPELLED = 100930; // * Area of effect not dispelled *
const int STRREF_DEATH_THROUGH_ABILITY_DAMAGE = 100932; // * Death through ability damage *
const int STRREF_ONLY_MELEE_WEAPONS_CAN_BE_COATED_WITH_ALCHEMISTS_FIRE = 100944; // *  Only melee weapons can be coated with alchemist's fire! *
const int STRREF_YOUR_CHARISMA_IS_TOO_LOW_TO_USE_THIS_FEAT = 100967; // * Your charisma is too low to use this feat! *
const int STRREF_SUMMON_AND_MOUNT_PALADIN_HORSE_FAILED = 111959; // ** Summon and Mount Paladin Horse Failed! **
const int STRREF_THAT_IS_NOT_PERMITTED_IN_THIS_AREA = 111960; // That is not permitted in this area.
const int STRREF_YOU_CANNOT_MOUNT_THAT = 119983; // ** You cannot mount that! **



// Gets the name of oObject if oSenser can see or hear them (and oObject is valid!), else returns "Someone"
// Returns the name properly in these cases:
// * oObject isn't a creature
// * oObject = oSenser
// * oSenser is invalid
// This is formatted as per the game formatting (cyan for players, purple for other things)
string GetNameOrSomeone(object oObject, object oSenser = OBJECT_INVALID);

// Provides the string " + " or " - " to input into string feedback messages.
string GetPositiveOrNegativeSign(int nInteger);

// Provide some feedback formatted to the games method of showing immunity feedback
void SendImmunityFeedback(object oCaster, object oTarget, int nImmunityType);

// Provides cure feedback to oCaster and oTarget
void SendCureFeedback(object oCaster, object oTarget, string sEffectName);

// Provides dispel magic feedback to oCaster and oTarget
void SendDispelMagicFeedback(object oCaster, object oTarget, json jArrayOfSpellIds);

// Provides dispel magic feedback to oCaster and oItem's possessor
void SendDispelMagicFeedbackForItem(object oCaster, object oItem, json jArrayOfSpellIds);

// Sends fake damage messages as per the game format for oTarget and oSource
void SendFakeDamageFeedbackMessage(object oTarget, object oSource, int nDamage, int nDamageType);

// Provides a game-formatted feedback message for skill. Optionally can have oVersus.
// - nSkillResult - Use the SKILL_RESULT_ variables
void SendSkillFeedbackMessage(object oObject, object oVersus, int nSkill, int nSkillResult, int nRoll, int nSkillModifier, int nDC, int bTake20 = FALSE);

// Provides a new feedback message for ability checks (d20 + ability modifier)
// - nAbility - should be the ability oObject is using to resist
// - bResult - TRUE if passed FALSE if not
// - nRoll - the roll used
// - nAbilityModifier - the ability modifier of oObject
void SendAbilityCheckFeedbackMessage(object oObject, object oVersus, int nAbility, int bResult, int nRoll, int nAbilityModifier, int nDC);

// Provides a new feedback message for grapple checks
void SendGrappleCheckFeedbackMessage(object oGrappled, object oGrappler, int bResult, int nGrappledRoll, int nGrappledModifiers, int nGrapplerRoll, int nGrapplerModifiers);

// Provides a new feedback message for bull rush checks
void SendBullRushCheckFeedbackMessage(object oDefender, object oBullRusher, int bResult, int nDefenderRoll, int nDefenderModifier, int nBullRusherRoll, int nBullRusherModifier);

// Provides a new feedback message for attack roll checks. Note does not
// provide critical hit feedback as part of the message.
// Use ATTACK_RESULT constants for nAttackResult
void SendAttackRollFeedbackMessage(object oTarget, object oAttacker, int nAttackResult, int nTargetAC, int nAttackerRoll, int nAttackerModifier);

// Gets the name of oObject if oSenser can see or hear them (and oObject is valid!), else returns "Someone"
// If not a creature will just get the name. If oObject and oSenser is the same returns the name.
// This is formatted as per the game formatting (cyan for players, purple for other things)
string GetNameOrSomeone(object oObject, object oSenser)
{
    // If oObject is valid and oCaster knows of them use that name, else use "Someone" TLK string
    if (GetIsObjectValid(oObject) && (!GetIsObjectValid(oSenser) || oObject == oSenser || GetObjectType(oObject) != OBJECT_TYPE_CREATURE || GetObjectSeen(oSenser, oObject) || GetObjectHeard(oSenser, oObject)))
    {
        if (GetIsPC(oObject))
        {
            return FEEDBACK_COLOUR_CLIENTNAME + GetName(oObject) + FEEDBACK_COLOUR_END;
        }
        else
        {
            return FEEDBACK_COLOUR_OTHERNAME + GetName(oObject) + FEEDBACK_COLOUR_END;
        }
    }
    return GetStringByStrRef(STRREF_SOMEONE);
}

// Provides the string " + " or " - " to input into string feedback messages.
string GetPositiveOrNegativeSign(int nInteger)
{
    if (nInteger >= 0)
    {
        return " + ";
    }
    return " - ";
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
        case IMMUNITY_TYPE_PETRIFICATION: sMessage = "Petrification"; break;
        default:
        {
            // EG: IMMUNITY_TYPE_NONE (0) or other values we do no messages. This should not occur though.
            if (DEBUG_LEVEL >= ERROR) Debug("[ERROR] SendImmunityFeedback: Invalid nImmunityType: " + IntToString(nImmunityType));
            return;
        }
        break;
    }

    // Send the feedback to the caster
    string sTargetName = GetNameOrSomeone(oTarget, oCaster);
    if (GetIsObjectValid(oCaster) && oCaster != oTarget)
    {
        // No string ref available for immunity feedback we  do our own; Bioware didn't provide feedback on several of them (besides in spell scripts a VFX).
        if (nStrRef == 0)
        {
            sMessage = sTargetName + " : " + sMessage + ".";
        }
        else
        {
            // Replace <CUSTOM0> with the given named target
            sMessage = RegExpReplace("<CUSTOM0>", GetStringByStrRef(nStrRef), sTargetName, REGEXP_BASIC);
        }
        SendMessageToPC(oCaster, sMessage);
    }

    // Same for the target except always use their name
    if (GetIsObjectValid(oTarget))
    {
        sTargetName = GetName(oTarget);
        if (nStrRef == 0)
        {
            sMessage = sTargetName + " : " + sMessage + ".";
        }
        else
        {
            // Replace <CUSTOM0> with the given named target
            sMessage = RegExpReplace("<CUSTOM0>", GetStringByStrRef(nStrRef), sTargetName, REGEXP_BASIC);
        }
        SendMessageToPC(oTarget, sMessage);
    }
}

// Provides cure feedback to oCaster and oTarget
void SendCureFeedback(object oCaster, object oTarget, string sEffectName)
{
    // For now format same as Dispel Magic. Maybe change the colours sometime though.
    if (GetIsObjectValid(oCaster) && oCaster != oTarget)
    {
        SendMessageToPC(oCaster, FEEDBACK_COLOUR_MAGIC + "Cured" + FEEDBACK_COLOUR_END + " : " + GetNameOrSomeone(oTarget, oCaster) + " : " + FEEDBACK_COLOUR_MAGIC + sEffectName + FEEDBACK_COLOUR_END);
    }
    if (GetIsObjectValid(oTarget))
    {
        SendMessageToPC(oTarget, FEEDBACK_COLOUR_MAGIC + "Cured" + FEEDBACK_COLOUR_END + " : " + GetNameOrSomeone(oTarget) + " : " + FEEDBACK_COLOUR_MAGIC + sEffectName + FEEDBACK_COLOUR_END);
    }
}

// Provides dispel magic feedback to oCaster and oTarget
void SendDispelMagicFeedback(object oCaster, object oTarget, json jArrayOfSpellIds)
{
    // Get the spell names in the format of "Spell Name, Spell Name 2, Spell Name 3"
    string sSpellNames;

    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArrayOfSpellIds); nIndex++)
    {
        if (nIndex > 0) sSpellNames += ", ";
        nSpellId = JsonGetInt(JsonArrayGet(jArrayOfSpellIds, nIndex));
        sSpellNames += GetStringByStrRef(StringToInt(Get2DAString("spells", "Name", nSpellId)));
    }
    // Caster version
    if (GetIsObjectValid(oCaster) && oCaster != oTarget)
    {
        SendMessageToPC(oCaster, FEEDBACK_COLOUR_MAGIC + GetStringByStrRef(STRREF_DISPEL_MAGIC) + FEEDBACK_COLOUR_END + " : " + GetNameOrSomeone(oTarget, oCaster) + " : " + FEEDBACK_COLOUR_MAGIC + sSpellNames + FEEDBACK_COLOUR_END);
    }
    if (GetIsObjectValid(oTarget))
    {
        SendMessageToPC(oTarget, FEEDBACK_COLOUR_MAGIC + GetStringByStrRef(STRREF_DISPEL_MAGIC) + FEEDBACK_COLOUR_END + " : " + GetNameOrSomeone(oTarget) + " : " + FEEDBACK_COLOUR_MAGIC + sSpellNames + FEEDBACK_COLOUR_END);
    }
}

// Provides dispel magic feedback to oCaster and oItem's possessor
void SendDispelMagicFeedbackForItem(object oCaster, object oItem, json jArrayOfSpellIds)
{
    // Get the spell names in the format of "Spell Name, Spell Name 2, Spell Name 3"
    string sSpellNames;

    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArrayOfSpellIds); nIndex++)
    {
        if (nIndex > 0) sSpellNames += ", ";
        nSpellId = JsonGetInt(JsonArrayGet(jArrayOfSpellIds, nIndex));
        sSpellNames += GetStringByStrRef(StringToInt(Get2DAString("spells", "Name", nSpellId)));
    }

    // For item names we use the base item name not the "real name" (like for NPCs it'd show
    // "Balor Weapon" or something equally unseen). Also helps hide things a little even if the target is a PC.
    // For creature weapons we use just "Creature Item" for better or worse. Maybe improve later.
    int nBaseItemType = GetBaseItemType(oItem);
    if (nBaseItemType == BASE_ITEM_CPIERCWEAPON ||
        nBaseItemType == BASE_ITEM_CSLASHWEAPON ||
        nBaseItemType == BASE_ITEM_CSLSHPRCWEAP) nBaseItemType = BASE_ITEM_CREATUREITEM;

    string sItemName = FEEDBACK_COLOUR_OTHERNAME + GetStringByStrRef(StringToInt(Get2DAString("baseitems", "Name", nBaseItemType))) + FEEDBACK_COLOUR_END;

    object oTarget = GetItemPossessor(oItem);
    // Possessed item
    if (GetIsObjectValid(oTarget))
    {
        // Caster version
        if (GetIsObjectValid(oCaster) && oCaster != oTarget)
        {
            SendMessageToPC(oCaster, FEEDBACK_COLOUR_MAGIC + GetStringByStrRef(STRREF_DISPEL_MAGIC) + FEEDBACK_COLOUR_END + " : " + sItemName + " (possessed by " + GetNameOrSomeone(oTarget, oCaster) + ") : " + FEEDBACK_COLOUR_MAGIC + sSpellNames + FEEDBACK_COLOUR_END);
        }
        if (GetIsObjectValid(oTarget))
        {
            SendMessageToPC(oTarget, FEEDBACK_COLOUR_MAGIC + GetStringByStrRef(STRREF_DISPEL_MAGIC) + FEEDBACK_COLOUR_END + " : " + sItemName + " (possessed by " + GetNameOrSomeone(oTarget) + ") : " + FEEDBACK_COLOUR_MAGIC + sSpellNames + FEEDBACK_COLOUR_END);
        }
    }
    // Item on the ground or something else
    else
    {
        // Caster version only
        if (GetIsObjectValid(oCaster))
        {
            SendMessageToPC(oCaster, FEEDBACK_COLOUR_MAGIC + GetStringByStrRef(STRREF_DISPEL_MAGIC) + FEEDBACK_COLOUR_END + " : " + GetNameOrSomeone(oItem) + " : " + FEEDBACK_COLOUR_MAGIC + sSpellNames + FEEDBACK_COLOUR_END);
        }
    }
}

// Sends fake damage messages as per the game format for oTarget and oSource
void SendFakeDamageFeedbackMessage(object oTarget, object oSource, int nDamage, int nDamageType)
{
    // Similar to BroadcastDamageDataToParty
    // * Things in oTarget or oSource faction get info
    // * Limited to a particular range (30M) and visibility info

    // Need to use damagetypegroups.2da 2da to get RGB info now

    // TLK string:
    // STRREF_FEEDBACK_COMPLEX_DAMAGE 10466
    //  <CUSTOM0> damages <CUSTOM1>: <CUSTOM2>
    Debug("[SendFakeDamageFeedbackMessage] Not implemented yet.");
}

// Provides a game-formatted feedback message for skill. Optionally can have oVersus. Will not play sound effects (eg for disarm trap)
// - nSkillResult - Use the SKILL_RESULT_ variables
void SendSkillFeedbackMessage(object oObject, object oVersus, int nSkill, int nSkillResult, int nRoll, int nSkillModifier, int nDC, int bTake20 = FALSE)
{
    // For now we just take nSkillResult. In the future maybe this can just work out the right feedback message from the roll.
    string sResult;
    switch (nSkillResult)
    {
        case SKILL_RESULT_FAILURE: sResult = GetStringByStrRef(STRREF_FAILURE); break;
        case SKILL_RESULT_SUCCESS: sResult = GetStringByStrRef(STRREF_SUCCESS); break;
        case SKILL_RESULT_CRITICAL_FAILURE: sResult = GetStringByStrRef(STRREF_CRITICAL_FAILURE); break;
        case SKILL_RESULT_SUCCESS_NOT_POSSIBLE: sResult = GetStringByStrRef(STRREF_SUCCESS_NOT_POSSIBLE); break;
        case SKILL_RESULT_AUTOMATIC_SUCCESS: sResult = GetStringByStrRef(STRREF_AUTOMATIC_SUCCESS); break;
        case SKILL_RESULT_SUCCESS_NEVER_POSSIBLE: sResult = GetStringByStrRef(STRREF_SUCCESS_NEVER_POSSIBLE); break;
    }

    string sSkill = GetStringByStrRef(StringToInt(Get2DAString("skills", "Name", nSkill)));

    // Floating text string on oObject regardless of the result type but not sent to log (simplified)
    FloatingTextStringOnCreature(sSkill + " : *" + sResult + "*", oObject, FALSE, FALSE);

    // Simple message
    if (nSkillResult == SKILL_RESULT_SUCCESS_NEVER_POSSIBLE)
    {
        SendMessageToPC(oObject, FEEDBACK_COLOUR_SKILLS + GetNameOrSomeone(oObject) + " : " + sSkill + " : *" + sResult + "*" + FEEDBACK_COLOUR_END);
        if (GetIsObjectValid(oVersus)) SendMessageToPC(oVersus, FEEDBACK_COLOUR_SKILLS + GetNameOrSomeone(oObject, oVersus) + " : " + sSkill + " : *" + sResult + "*" + FEEDBACK_COLOUR_END);
        return;
    }
    // Complicated message
    int nTotal = nRoll + nSkillModifier;
    // Need this so you get +0
    string sSign;
    if (nSkillModifier < 0)
    {
        sSign          = " -";
        nSkillModifier = -nSkillModifier;
    }
    else
    {
        sSign = " +";
    }

    // 10484 - <CUSTOM0> : <CUSTOM1> : *<CUSTOM2>* : (<CUSTOM3> <CUSTOM4> <CUSTOM5> = <CUSTOM6> vs. DC: <CUSTOM7>)
    string sMessage = " : " + sSkill + " : *" + sResult + "* : (" + IntToString(nRoll) + sSign + IntToString(nSkillModifier) + " = " + IntToString(nTotal) + " vs. DC: " + IntToString(nDC) + ")";
    if (bTake20)
    {
        sMessage = sMessage + " : " + GetStringByStrRef(STRREF_TAKE20);
    }

    SendMessageToPC(oObject, FEEDBACK_COLOUR_SKILLS + GetNameOrSomeone(oObject) + sMessage + FEEDBACK_COLOUR_END);
    if (GetIsObjectValid(oVersus) && oVersus != oTarget) SendMessageToPC(oVersus, FEEDBACK_COLOUR_SKILLS + GetNameOrSomeone(oObject, oVersus) + sMessage + FEEDBACK_COLOUR_END);
}

// Provides a new feedback message for ability checks (d20 + ability modifier)
// - nAbility - should be the ability oObject is using to resist
// - bResult - TRUE if passed FALSE if not
// - nRoll - the roll used
// - nAbilityModifier - the ability modifier of oObject
void SendAbilityCheckFeedbackMessage(object oObject, object oVersus, int nAbility, int bResult, int nRoll, int nAbilityModifier, int nDC)
{
    string sAbilityName = GetStringByStrRef(StringToInt(Get2DAString("iprp_abilities", "Name", nAbility)));

    string sResult = bResult == TRUE ? GetStringByStrRef(STRREF_SUCCESS) : GetStringByStrRef(STRREF_FAILURE);

    // Floating text string on oObject regardless of the result type but not sent to log (simplified)
    FloatingTextStringOnCreature(sAbilityName + " : *" + sResult + "*", oObject, FALSE, FALSE);

    // Complicated message like skills
    int nTotal = nRoll + nAbilityModifier;

    string sMessage = " : " + sAbilityName + " Ability Check : *" + sResult + "* : (" + IntToString(nRoll) + GetPositiveOrNegativeSign(nAbilityModifier) + IntToString(nAbilityModifier) + " = " + IntToString(nTotal) + " vs. DC: " + IntToString(nDC) + ")";

    SendMessageToPC(oObject, FEEDBACK_COLOUR_SKILLS + GetNameOrSomeone(oObject) + sMessage + FEEDBACK_COLOUR_END);
    if (GetIsObjectValid(oVersus) && oVersus != oTarget) SendMessageToPC(oVersus, FEEDBACK_COLOUR_SKILLS + GetNameOrSomeone(oObject, oVersus) + sMessage + FEEDBACK_COLOUR_END);
}

// Provides a new feedback message for grapple checks
void SendGrappleCheckFeedbackMessage(object oGrappled, object oGrappler, int bResult, int nGrappledRoll, int nGrappledModifiers, int nGrapplerRoll, int nGrapplerModifiers)
{
    // 2478 = *Target Grappled!*
    // 83309 = *Target evades grapple attempt*
    string sResult = bResult == TRUE ? GetStringByStrRef(2478) : GetStringByStrRef(83309);

    // Floating text string on oObject regardless of the result type but not sent to log (simplified)
    FloatingTextStringOnCreature(sResult, oGrappled, FALSE, FALSE);

    // Shorter version (just d20 + modifiers)
    string sMessage = " : " + sResult +
                                                " : (" + IntToString(nGrapplerRoll) +
                                                           GetPositiveOrNegativeSign(nGrapplerModifiers) + IntToString(abs(nGrapplerModifiers)) +
                                                " = " + IntToString(nGrapplerRoll + nGrapplerModifiers) +
                                                " vs. " +  IntToString(nGrappledRoll) +
                                                           GetPositiveOrNegativeSign(nGrappledModifiers) + IntToString(abs(nGrappledModifiers)) +
                                                " = " + IntToString(nGrappledRoll + nGrappledModifiers) +
                                                ")";

    if (GetIsObjectValid(oGrappled))
    {
        SendMessageToPC(oGrappled, FEEDBACK_COLOUR_COMBAT + GetNameOrSomeone(oGrappler, oGrappled) + " " + GetStringByStrRef(STRREF_VERSUS) + " " + GetNameOrSomeone(oGrappled) + sMessage + FEEDBACK_COLOUR_END);
    }
    if (GetIsObjectValid(oGrappler) && oGrappler != oGrappled)
    {
        SendMessageToPC(oGrappler, FEEDBACK_COLOUR_COMBAT + GetNameOrSomeone(oGrappler) + " " + GetStringByStrRef(STRREF_VERSUS) + " " + GetNameOrSomeone(oGrappled, oGrappler) + sMessage + FEEDBACK_COLOUR_END);
    }
}

// Provides a new feedback message for bull rush checks
void SendBullRushCheckFeedbackMessage(object oDefender, object oBullRusher, int bResult, int nDefenderRoll, int nDefenderModifier, int nBullRusherRoll, int nBullRusherModifier)
{
    // 8966 Bull Rush Successful
    // 8967 Bull Rush Failed
    string sResult = bResult == TRUE ? GetStringByStrRef(8966) : GetStringByStrRef(8967);

    // Floating text string on oDefender regardless of the result type but not sent to log (simplified)
    FloatingTextStringOnCreature("Bull Rush : *" + sResult + "*", oDefender, FALSE, FALSE);

    // Shorter version (just d20 + modifiers)
    string sMessage = " : *" + sResult +
                                                "* : (" + IntToString(nBullRusherRoll) +
                                                           GetPositiveOrNegativeSign(nBullRusherModifier) + IntToString(abs(nBullRusherModifier)) +
                                                " = " + IntToString(nBullRusherRoll + nBullRusherModifier) +
                                                " vs. " +  IntToString(nDefenderRoll) +
                                                           GetPositiveOrNegativeSign(nDefenderModifier) + IntToString(abs(nDefenderModifier)) +
                                                " = " + IntToString(nDefenderRoll + nDefenderModifier) +
                                                ")";

    if (GetIsObjectValid(oDefender))
    {
        SendMessageToPC(oDefender, FEEDBACK_COLOUR_COMBAT + GetNameOrSomeone(oBullRusher, oDefender) + " " + GetStringByStrRef(STRREF_VERSUS) + " " + GetNameOrSomeone(oDefender) + sMessage + FEEDBACK_COLOUR_END);
    }
    if (GetIsObjectValid(oBullRusher) && oBullRusher != oDefender)
    {
        SendMessageToPC(oBullRusher, FEEDBACK_COLOUR_COMBAT + GetNameOrSomeone(oBullRusher) + " " + GetStringByStrRef(STRREF_VERSUS) + " " + GetNameOrSomeone(oDefender, oBullRusher) + sMessage + FEEDBACK_COLOUR_END);
    }
}

// Provides a new feedback message for attack roll checks. Note does not
// provide critical hit feedback as part of the message.
// Use ATTACK_RESULT constants for nAttackResult
void SendAttackRollFeedbackMessage(object oTarget, object oAttacker, int nAttackResult, int nTargetAC, int nAttackerRoll, int nAttackerModifier)
{
    string sResult;
    switch (nAttackResult)
    {
        case ATTACK_RESULT_HIT_SUCCESSFUL: sResult = GetStringByStrRef(STRREF_HIT); break;
        case ATTACK_RESULT_PARRIED: sResult = GetStringByStrRef(STRREF_PARRIED); break;
        case ATTACK_RESULT_CRITICAL_HIT: sResult = GetStringByStrRef(STRREF_CRITICAL_HIT); break;
        case ATTACK_RESULT_MISS: sResult = GetStringByStrRef(STRREF_MISS); break;
        case ATTACK_RESULT_ATTACK_RESISTED: sResult = GetStringByStrRef(STRREF_RESISTED); break;
        case ATTACK_RESULT_ATTACK_FAILED: sResult = GetStringByStrRef(STRREF_FAILED); break;
        case ATTACK_RESULT_AUTOMATIC_HIT: sResult = GetStringByStrRef(STRREF_AUTOMATIC_HIT); break;
        case ATTACK_RESULT_TARGET_CONCEALED: sResult = GetStringByStrRef(STRREF_TARGET_CONCEALED); break;
        case ATTACK_RESULT_ATTACKER_MISS_CHANCE: sResult = GetStringByStrRef(STRREF_ATTACKER_MISS_CHANCE); break;
        case ATTACK_RESULT_DEVASTATING_CRITICAL: sResult = GetStringByStrRef(STRREF_DEVASTATING_CRITICAL); break;
        default: // OP_Debug()
        break;
    }

    // Floating text string on oObject regardless of the result type but not sent to log (simplified)
    FloatingTextStringOnCreature("Attack : *" + sResult + "*", oTarget, FALSE, FALSE);

    // Game version (no combat debugging) there isn't actually a use for nTargetAC:
    // 10470   <CUSTOM0> attacks <CUSTOM1> : *<CUSTOM2>* : (<CUSTOM3> <CUSTOM4> <CUSTOM5> = <CUSTOM6><CUSTOM7>)
    // <CUSTOM0> oVersus
    // <CUSTOM1> oTarget
    // <CUSTOM2> Attack result text ("Hit")
    // <CUSTOM3> To hit roll
    // <CUSTOM4> The sign (+/-)
    // <CUSTOM5> To hit modifier
    // <CUSTOM6> Total
    // <CUSTOM7> Info if a thread (ignored in this case).

    // Replace parts other than Custom 1/2.
    string sMessage = GetStringByStrRef(10470);
    sMessage = RegExpReplace("<CUSTOM2>", sMessage, sResult, REGEXP_BASIC);
    sMessage = RegExpReplace("<CUSTOM3>", sMessage, IntToString(nAttackerRoll), REGEXP_BASIC);
    sMessage = RegExpReplace("<CUSTOM4>", sMessage, GetPositiveOrNegativeSign(nAttackerModifier), REGEXP_BASIC);
    sMessage = RegExpReplace("<CUSTOM5>", sMessage, IntToString(abs(nAttackerModifier)), REGEXP_BASIC);
    sMessage = RegExpReplace("<CUSTOM6>", sMessage, IntToString(nAttackerRoll + nAttackerModifier), REGEXP_BASIC);
    sMessage = RegExpReplace("<CUSTOM7>", sMessage, "", REGEXP_BASIC);

    // Send the feedback to oAttacker
    if (GetIsObjectValid(oAttacker) && oAttacker != oTarget)
    {
        // Replace <CUSTOM1> with the given named target
        string sAttackerMessage = RegExpReplace("<CUSTOM1>", sMessage, GetNameOrSomeone(oTarget, oAttacker), REGEXP_BASIC);

        // Colour message orange
        sAttackerMessage = FEEDBACK_COLOUR_COMBAT + sAttackerMessage + FEEDBACK_COLOUR_END;

        // Then we put in CUSTOM0 the attacker, with different colours
        sAttackerMessage = RegExpReplace("<CUSTOM0>", sAttackerMessage, GetNameOrSomeone(oAttacker), REGEXP_BASIC);

        SendMessageToPC(oAttacker, sAttackerMessage);
    }

    // Same for the target except always use their name
    if (GetIsObjectValid(oTarget))
    {
        // Replace <CUSTOM1> with the given named target
        string sTargetMessage = RegExpReplace("<CUSTOM1>", sMessage, GetNameOrSomeone(oTarget), REGEXP_BASIC);

        // Colour message orange
        sTargetMessage = FEEDBACK_COLOUR_COMBAT + sTargetMessage + FEEDBACK_COLOUR_END;

        // Then we put in CUSTOM0 the attacker, with different colours
        sTargetMessage = RegExpReplace("<CUSTOM0>", sTargetMessage, GetNameOrSomeone(oAttacker, oTarget), REGEXP_BASIC);

        SendMessageToPC(oTarget, sTargetMessage);
    }
}

