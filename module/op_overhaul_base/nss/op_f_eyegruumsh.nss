//:://////////////////////////////////////////////
//:: Eye of Gruumsh Class Feats
//:: op_f_eyegruumsh
//:://////////////////////////////////////////////
/*
    Follow Orders Blindly

    Specifics: At 1st level, the Eye of Gruumsh may grant a +2 morale bonus
    on Will saving throws to any allies within 30 feet. The effect lasts
    for 1 hour per eye of Gruumsh level.


    Blinding Spittle

    Specifics: At 4th level, an Eye of Gruumsh can launch blinding spittle at
    any opponent within short range. Using a ranged touch attack (at a -4
    penalty), he spits his stomach acid into the target's eyes. An opponent who
    fails a Reflex save (DC 10 + eye of Gruumsh level + Eye of Gruumsh's
    Constitution bonus) is blinded 3 rounds. This attack has no effect on
    creatures that don't have eyes or don't depend on vision. Blinding spittle
    is usable 2/day at 4th level and 4/day at 7th level.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    if (nSpellId == SPELL_FOLLOW_ORDERS_BLINDLY)
    {
        lTarget = GetLocation(oCaster);
        if (GetGender(oCaster) == GENDER_FEMALE)
        {
            ApplyVisualEffectAtLocation(VFX_FNF_HOWL_WAR_CRY_FEMALE, lTarget);
        }
        else
        {
            ApplyVisualEffectAtLocation(VFX_FNF_HOWL_WAR_CRY, lTarget);
        }

        effect eLink = EffectLinkEffects(EffectSavingThrowIncrease(SAVING_THROW_WILL, 2),
                                         EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
        eLink        = ExtraordinaryEffect(eLink);

        nCasterLevel = GetLevelByClass(CLASS_TYPE_EYE_OF_GRUUMSH, oCaster);

        if (nCasterLevel == 0)
        {
            if (DEBUG_LEVEL >= ERROR) Debug("[ERROR] Command the Horde no class levels in Eye of Gruumsh. Script called in error?");
            return;
        }

        float fDuration = GetDuration(nCasterLevel, HOURS);

        json jArray = GetArrayOfTargets(SPELL_TARGET_ALLALLIES);
        int nIndex;
        for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
        {
            oTarget = GetArrayObject(jArray, nIndex);

            SignalSpellCastAt();

            float fDelay = GetDistanceBetweenLocations(lTarget, GetLocation(oTarget)) / 25.0;

            DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_IMPROVE_ABILITY_SCORE, oTarget));
            DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration));
        }
    }
    else if (nSpellId == SPELL_BLINDING_SPITTLE)
    {
        if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
        {
            SignalSpellCastAt();

            if (DoTouchAttack(oTarget, oCaster, TOUCH_RANGED))
            {
                effect eBlind = ExtraordinaryEffect(EffectBlindness());

                float fDuration = GetDuration(3, ROUNDS);
                ApplyVisualEffectToObject(VFX_IMP_ACID_L, oTarget);
                ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eBlind, oTarget, fDuration);
            }
        }
    }
    else
    {
        if (DEBUG_LEVEL >= ERROR) Debug("Error: Eye of Gruumsh script fired with incorrect spell");
    }
}

