//::///////////////////////////////////////////////
//:: Damage Reduction spells
//:: op_s_damagereduc
//:://////////////////////////////////////////////
/*
    Q: Should these stack? (and if not stack should the remaining amount be applied to a recast?)

    Stoneskin
    10/+5 damage reduction for up to a limit of 10 per caster level, 100 limit.
    Greater Stoneskin
    20/+5 damage reduction for up to a limit of 10 per caster level, 150 limit.
    Premonition
    30/+5 damage reduction for up to a limit of 10 per caster level, no limit.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    effect eLink;
    int nVis = VFX_NONE;
    float fDuration;
    switch (nSpellId)
    {
        case SPELL_STONESKIN:
        case SPELL_SHADES_STONESKIN:
        {
            fDuration = GetDuration(nCasterLevel, HOURS);
            nVis = VFX_IMP_SUPER_HEROISM;
            eLink = EffectLinkEffects(EffectDamageReduction(10, DAMAGE_POWER_PLUS_FIVE, max(100, nCasterLevel)),
                    EffectLinkEffects(EffectVisualEffect(VFX_DUR_PROT_STONESKIN),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
        }
        break;
        case SPELL_GREATER_STONESKIN:
        {
            fDuration = GetDuration(nCasterLevel, HOURS);
            nVis = VFX_IMP_POLYMORPH;
            eLink = EffectLinkEffects(EffectDamageReduction(20, DAMAGE_POWER_PLUS_FIVE, max(150, nCasterLevel)),
                    EffectLinkEffects(EffectVisualEffect(VFX_DUR_PROT_GREATER_STONESKIN),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
        }
        break;
        case SPELL_PREMONITION:
        {
            fDuration = GetDuration(nCasterLevel, HOURS);
            eLink = EffectLinkEffects(EffectDamageReduction(30, DAMAGE_POWER_PLUS_FIVE, nCasterLevel),
                    EffectLinkEffects(EffectVisualEffect(VFX_DUR_PROT_PREMONITION),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
        }
        break;
        default:
            OP_Debug("[Damage Reduction] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
        break;
    }

    SignalSpellCastAt();

    // Remove existing effects
    RemoveEffectsFromSpell(oTarget, SPELL_STONESKIN);
    RemoveEffectsFromSpell(oTarget, SPELL_SHADES_STONESKIN);
    RemoveEffectsFromSpell(oTarget, SPELL_GREATER_STONESKIN);
    RemoveEffectsFromSpell(oTarget, SPELL_PREMONITION);

    ApplyVisualEffectToObject(nVis, oTarget);
    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
}

