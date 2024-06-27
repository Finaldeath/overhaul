//::///////////////////////////////////////////////
//:: Paralysis Spells
//:: op_s_paralysis.nss
//:://////////////////////////////////////////////
/*
    Hold Animal
    The target animal is paralyzed for the duration of the spell.

    Hold Person
    The target humanoid is paralyzed for the duration of the spell.

    Hold Monster
    The target monster is paralyzed for the duration of the spell.

    Mass Hold Monster
    30 ft. diameter (Large) and paralysis.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    // Check target for certain spells
    switch (nSpellId)
    {
        case SPELL_HOLD_ANIMAL:
        {
            if (GetRacialType(oTarget) != CLASS_TYPE_ANIMAL) return;
        }
        break;
        case SPELL_HOLD_PERSON:
        {
            if (!GetIsHumanoidCreature(oTarget)) return;
        }
        break;
    }

    if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
    {
        if (!DoResistSpell(oTarget, oCaster))
        {
            if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_PARALYSIS))
            {
                effect eLink = EffectLinkEffects(EffectParalyze(),
                               EffectLinkEffects(EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE),
                               EffectLinkEffects(EffectVisualEffect(VFX_DUR_PARALYZED),
                                                 EffectVisualEffect(VFX_DUR_PARALYZE_HOLD))));

                // See op_ss_paralysis for why we're storing metadata for this effect
                eLink = EffectTagWithMetadata(eLink);

                float fDuration = GetScaledDuration(oTarget, nCasterLevel, ROUNDS);

                ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
            }
        }
    }

}

