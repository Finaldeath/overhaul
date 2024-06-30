//::///////////////////////////////////////////////
//:: Increasing and Decreasing Skills
//:: op_s_skills.nss
//:://////////////////////////////////////////////
/*
    Clairaudience/Clairvoyance
    +10 bonus to all Spot and Listen checks.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    int bVis;
    float fDuration;
    effect eVis, eLink;

    switch (nSpellId)
    {
        case SPELL_CLAIRAUDIENCE_AND_CLAIRVOYANCE:
        {
            bVis = FALSE;
            fDuration = GetDuration(nCasterLevel, ROUNDS);
            eLink = EffectLinkEffects(EffectSkillIncrease(SKILL_SPOT, 10),
                    EffectLinkEffects(EffectSkillIncrease(SKILL_LISTEN, 10),
                    EffectLinkEffects(EffectVisualEffect(VFX_DUR_MAGICAL_SIGHT),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE))));
        }
        break;
        default:
        {
            OP_Debug("[Skill Spells] Unknown spell ID: " + IntToString(nSpellId), LOG_LEVEL_ERROR);
            return;
        }
        break;
    }

    SignalSpellCastAt();

    if (bVis) ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
}

