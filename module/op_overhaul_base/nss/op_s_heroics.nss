//::///////////////////////////////////////////////
//:: Heroics
//:: op_s_heroics.nss
//:://////////////////////////////////////////////
/*
    Caster Level(s): Wizard / Sorcerer 2
    Innate Level: 2
    School: Transmutation
    Descriptor(s):
    Component(s): Verbal, Somatic
    Range: Touch
    Area of Effect / Target: Single
    Duration: 10 minutes / level
    Additional Counter Spells:
    Save: Harmless
    Spell Resistance: No

    The heroics spell temporarily grants the subject a feat from the fighter's
    bonus feat list. For the duration of the heroics spell, the subject can use
    the feat as if it were one of those the creature had selected. All
    prerequisites for the feat must be met by the target of this spell. A
    creature can only be affected by one Heroics spell at a time.

    The subspells allow you to choose a category of feats to apply;

    - Appropriate Feat (Feat from the below selection based on equipped weapons)
    - Melee Active Feat (Improved Knockdown, Improved Disarm, Whirlwind Attack, Knockdown, Sap, Disarm, Called Shot)
    - Melee Mode Feat (Greater Cleave, Cleave, Improved Power Attack, Power Attack)
    - Unarmed Feat (Stunning Fist, Deflect Arrows, Improved Unarmed Attack)
    - Ranged Feat (Rapid Shot, Called Shot, Point Blank Shot)
    - Weapon Feat (Weapon Specialization, Weapon Focus, Weapon Finesse (if applicable))
    - Defensive Feat (Improved Expertise, Expertise, Spring Attack, Mobility, Dodge, Improved Parry, Deflect Arrows (if unarmed), Blind Fight)
    - Two-Weapon Fighting Feat (Improved two-weapon fighting, Ambidexterity, Two-Weapon Fighting)

*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    // Remove all existing spell effects
    RemoveEffectsFromSpell(oTarget, SPELL_HEROICS);

    // Check for the feat to apply.
    int nFeatId = FEAT_INVALID;

    // We need to know what feats we really know - so Json it is
    // TODO we'll just throw a feat in and ignore the requirements for now.

    switch (nSpellId)
    {
        case SPELL_HEROICS_DEFENSIVE_FEAT:
        {
            nFeatId = FEAT_IMPROVED_EXPERTISE;
        }
        break;
        case SPELL_HEROICS_MELEE_ACTIVE_FEAT:
        {
            nFeatId = FEAT_IMPROVED_KNOCKDOWN;
        }
        break;
        case SPELL_HEROICS_MELEE_MODE_FEAT:
        {
            nFeatId = FEAT_IMPROVED_POWER_ATTACK;
        }
        break;
        case SPELL_HEROICS_RANGED_FEAT:
        {
            nFeatId = FEAT_RAPID_SHOT;
        }
        break;
        case SPELL_HEROICS_TWOWEAPON_FIGHTING_FEAT:
        {
            nFeatId = FEAT_IMPROVED_TWO_WEAPON_FIGHTING;
        }
        break;
        case SPELL_HEROICS_UNARMED_FEAT:
        {
            nFeatId = FEAT_STUNNING_FIST;
        }
        break;
        case SPELL_HEROICS_WEAPON_FEAT:
        // Default to "Appropriate" feat, eg if the master spell is cast somehow
        // case SPELL_HEROICS_APPROPRIATE_FEAT:
        default:
        {
            nFeatId = FEAT_IMPROVED_KNOCKDOWN;
        }
        break;
    }

    if (nFeatId == FEAT_INVALID)
    {
        SendMessageToPC(oCaster, "Heroics: No appropriate feat from selection found");
        ApplySpellEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SPELL_FAIL_HAND), oCaster);
        return;
    }

    // Apply feat with feedback
    string sMessage = "Heroics feat granted: " + GetFeatName(nFeatId);
    SendMessageToPC(oTarget, sMessage);
    if (oTarget != oCaster) SendMessageToPC(oCaster, sMessage);

    // Reset nSpellId for the resulting application
    nSpellId = SPELL_HEROICS;

    float fDuration = GetDuration(nCasterLevel, MINUTES);

    effect eLink =
        EffectLinkEffects(EffectBonusFeat(nFeatId),
        EffectLinkEffects(EffectImmunity(EFFECT_ICON_BONUS_FEAT),
        EffectLinkEffects(EffectVisualEffect(VFX_DUR_MIND_AFFECTING_POSITIVE),
                          EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE))));

    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
}

