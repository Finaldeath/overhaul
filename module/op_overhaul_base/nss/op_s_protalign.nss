//:://////////////////////////////////////////////
//:: Protection Vs. Alignment spells
//:: op_s_protalign
//:://////////////////////////////////////////////
/*
    Protection from Alignment
        Protection from Evil
        Protection from Good

    When this spell is cast, the caster chooses a target to be protected from
    either good or evil. The target receives a +2 deflection bonus to Armor
    Class, +2 to all saving throws, and immunity to any mind-affecting spells
    and spell-like abilities used by creatures of the chosen alignment.

    Magic Circle against Alignment
        Magic Circle against Evil
        Magic Circle against Good

    When this spell is cast, the caster chooses to be protected from either
    good or evil. The spell target and all allies who stay within 10 feet
    (3.33m) receive a +2 deflection bonus to Armor Class, +2 to all saving
    throws, and immunity to any mind-affecting spells and spell-like abilities
    used by creatures of the chosen alignment.

    Aura versus Alignment
        Holy Aura
        Unholy Aura

    When this spell is cast, the caster chooses to be protected from either good
    or evil. He receives a +4 deflection bonus to Armor Class, immunity to
    mind-affecting spells and spell-like abilities used by creatures of the
    chosen alignment

    Additionally the caster gains spell resistance 25, and all creatures
    attacking the caster take 6 + 1d8 divine (if Holy Aura) or negative (if
    Unholy Aura) damage on a successful hit.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

// Will pass back a linked effect for all the protection from alignment spells.  The power represents the multiplier of strength.
// That is instead of +3 AC and +2 Saves a  power of 2 will yield +6 AC and +4 Saves.
effect CreateProtectionFromAlignmentLink(int nAlignment, int nPower = 1, int bAura = FALSE);

// Gets the right ALIGNMENT_ value for nSpellId
int GetAlignmentFromSpell(int nSpellId);

void main()
{
    if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_ENTER)
    {
        if (!AOECheck()) return;

        if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_ALLALLIES))
        {
            SignalSpellCastAt();

            // Apply the correct effect
            effect eLink = CreateProtectionFromAlignmentLink(GetAlignmentFromSpell(nSpellId), 2);

            ApplyAOEPersistentEffect(oTarget, eLink);
        }
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_EXIT)
    {
        RemovePersistentAOEEffects(oTarget);
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_HEARTBEAT)
    {
        if (!AOECheck()) return;
    }
    else
    {
        if (DoSpellHook()) return;

        switch (nSpellId)
        {
            case SPELL_MAGIC_CIRCLE_AGAINST_EVIL:
            {
                ApplyVisualEffectToObject(VFX_IMP_GOOD_HELP, oTarget);

                effect eLink = EffectLinkEffects(EffectAreaOfEffect(AOE_MOB_CIRCGOOD, GetScriptName(), GetScriptName(), GetScriptName()),
                               EffectLinkEffects(EffectIcon(EFFECT_ICON_AREA_OF_EFFECT),
                                                 EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));

                ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(nCasterLevel, HOURS));
            }
            break;
            case SPELL_MAGIC_CIRCLE_AGAINST_GOOD:
            {
                ApplyVisualEffectToObject(VFX_IMP_EVIL_HELP, oTarget);

                effect eLink = EffectLinkEffects(EffectAreaOfEffect(AOE_MOB_CIRCEVIL, GetScriptName(), GetScriptName(), GetScriptName()),
                               EffectLinkEffects(EffectIcon(EFFECT_ICON_AREA_OF_EFFECT),
                                                 EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));

                ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(nCasterLevel, HOURS));
            }
            break;
            case SPELL_PROTECTION_FROM_EVIL:
            case SPELL_PROTECTION_FROM_GOOD:
            {
                effect eLink = CreateProtectionFromAlignmentLink(GetAlignmentFromSpell(nSpellId), 1);

                ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(nCasterLevel, HOURS));
            }
            break;
            case SPELL_UNHOLY_AURA:
            case SPELL_HOLY_AURA:
            {
                effect eLink = CreateProtectionFromAlignmentLink(GetAlignmentFromSpell(nSpellId), 2, TRUE);

                ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(nCasterLevel, HOURS));
            }
            break;
            default:
            {
                if (DEBUG_LEVEL >= ERROR) Debug("[op_s_protection] No valid spell ID passed in: " + IntToString(nSpellId), ERROR);
                return;
            }
            break;
        }
    }
}

effect CreateProtectionFromAlignmentLink(int nAlignment, int nPower = 1, int bAura = FALSE)
{
    // This is Biowares with some tweaks. Bless this mess!
    int nFinal = nPower * 2;
    effect eAC = EffectACIncrease(nFinal, AC_DEFLECTION_BONUS);
    eAC = VersusAlignmentEffect(eAC, ALIGNMENT_ALL, nAlignment);
    effect eSave = EffectSavingThrowIncrease(SAVING_THROW_ALL, nFinal);
    eSave = VersusAlignmentEffect(eSave,ALIGNMENT_ALL, nAlignment);
    effect eImmune = EffectImmunity(IMMUNITY_TYPE_MIND_SPELLS);
    eImmune = VersusAlignmentEffect(eImmune,ALIGNMENT_ALL, nAlignment);
    effect eDur;
    if(nAlignment == ALIGNMENT_EVIL)
    {
        int nVFX = bAura ? VFX_DUR_PROTECTION_GOOD_MAJOR: VFX_DUR_PROTECTION_GOOD_MINOR;

        eDur = EffectVisualEffect(nVFX);
    }
    else if(nAlignment == ALIGNMENT_GOOD)
    {
        int nVFX = bAura ? VFX_DUR_PROTECTION_EVIL_MAJOR: VFX_DUR_PROTECTION_EVIL_MINOR;

        eDur = EffectVisualEffect(nVFX);
    }

    effect eDur2 = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);
    effect eLink = EffectLinkEffects(eImmune, eSave);
    eLink = EffectLinkEffects(eLink, eAC);
    eLink = EffectLinkEffects(eLink, eDur);
    eLink = EffectLinkEffects(eLink, eDur2);

    // Aura addons
    if (bAura)
    {
        int nDamageType = nAlignment == ALIGNMENT_GOOD ? DAMAGE_TYPE_DIVINE : DAMAGE_TYPE_NEGATIVE;

        eLink = EffectLinkEffects(eLink, EffectSpellResistanceIncrease(25)); // Currently this doesn't work against alignment
        eLink = EffectLinkEffects(eLink, EffectDamageShield(6, DAMAGE_BONUS_1d8, nDamageType)); // Currently this doesn't work against alignment
    }
    return eLink;
}

// Gets the right ALIGNMENT_ value for nSpellId
int GetAlignmentFromSpell(int nSpellId)
{
    switch(nSpellId)
    {
        case SPELL_PROTECTION_FROM_EVIL:
        case SPELL_MAGIC_CIRCLE_AGAINST_EVIL:
        case SPELL_HOLY_AURA:
        {
            return ALIGNMENT_EVIL;
        }
        break;
        case SPELL_PROTECTION_FROM_GOOD:
        case SPELL_MAGIC_CIRCLE_AGAINST_GOOD:
        case SPELL_UNHOLY_AURA:
        {
            return ALIGNMENT_GOOD;
        }
        break;
        default:
        {
            if (DEBUG_LEVEL >= ERROR) Debug("[op_s_protection] No valid spell ID passed in: " + IntToString(nSpellId), ERROR);
            return -1;
        }
        break;
    }
    return -1;
}
