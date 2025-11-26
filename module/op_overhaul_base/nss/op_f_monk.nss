//:://////////////////////////////////////////////
//:: Monk Feats
//:: op_f_monk.nss
//:://////////////////////////////////////////////
/*
    Wholeness of Body

    The monk can heal damage equal to twice her class level, once per day.

    Empty Body

    50% concealment for 1 round/Monk level.

    Blinding Speed

    Is in op_s_buffs.
    Haste for 10 rounds. Also have made it supernatural.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    SignalSpellCastAt();

    switch (nSpellId)
    {
        case SPELLABILITY_WHOLENESS_OF_BODY:
        {
            int nAmount = GetLevelByClass(CLASS_TYPE_MONK, oCaster) * 2;

            if (nAmount == 0) return;

            ApplyVisualEffectToObject(VFX_IMP_HEALING_M, oTarget);
            ApplySpellEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nAmount), oTarget);
        }
        break;
        case SPELLABILITY_EMPTY_BODY:
        {
            // If already has the spell effect, exit early.
            if (GetHasEffect(oTarget, EFFECT_TYPE_ALL, nSpellId)) return;

            effect eLink = SupernaturalEffect(GetEffectLink(EFFECT_TYPE_CONCEALMENT, 50));

            float fDuration = GetDuration(GetLevelByClass(CLASS_TYPE_MONK, oCaster), ROUNDS);

            if (fDuration <= 0.0) return;

            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
        }
        break;
    }
}

