//:://////////////////////////////////////////////
//:: Mind Blank spells
//:: op_s_mindblank
//:://////////////////////////////////////////////
/*
    Clarity

    This spell removes the effects of Daze, Sleep, Confusion, Stun, and Charm,
    and protects against all mind-affecting effects until it expires. For every
    effect removed by the spell, the target creature sustains 1 point of damage.

    Lesser Mind Blank

    This spell renders the target creature immune to mind-affecting spells and
    spell-like effects. It also removes Charm, Confusion, Daze, Domination,
    Sleep and Stun effects and the effects of the spells Bane and Feeblemind
    from the target creature.

    Mind Blank

    This spell renders all allies within the area of effect immune to
    mind-affecting spells and effects. It also removes Charm, Confusion, Daze,
    Domination, Sleep and Stun effects and the effects of the spells Bane and
    Feeblemind from the targeted creatures.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void MindBlank(object oTarget, int bClarity, float fDuration);

void main()
{
    if (DoSpellHook()) return;

    // For single target spells just do their effects
    switch (nSpellId)
    {
        case SPELL_CLARITY:
        {
            MindBlank(oTarget, TRUE, 5.0 + GetDuration(nCasterLevel, ROUNDS));
        }
        break;
        case SPELL_LESSER_MIND_BLANK:
        {
            MindBlank(oTarget, FALSE, GetDuration(nCasterLevel, MINUTES));
        }
        break;
        case SPELL_MIND_BLANK:
        {
            // For Mind Blank do an AOE version
            ApplyVisualEffectAtLocation(VFX_FNF_LOS_NORMAL_20, lTarget);

            json jArray = GetArrayOfTargets(SPELL_TARGET_ALLALLIES);
            int nIndex;
            for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
            {
                oTarget = GetArrayObject(jArray, nIndex);

                SignalSpellCastAt();

                float fDelay = GetDistanceBetweenLocations(lTarget, GetLocation(oTarget)) / 20;

                DelayCommand(fDelay, MindBlank(oTarget, FALSE, GetDuration(nCasterLevel, MINUTES)));
            }
        }
        break;
        default:
        {
            if (DEBUG_LEVEL >= ERROR) Error("No valid spell ID passed in: " + IntToString(nSpellId));
            return;
        }
        break;
    }
}

void MindBlank(object oTarget, int bClarity, float fDuration)
{
    // Same immunity for each
    effect eLink = EffectLinkEffects(EffectImmunity(IMMUNITY_TYPE_MIND_SPELLS),
                                     EffectLinkEffects(EffectVisualEffect(VFX_DUR_MIND_AFFECTING_POSITIVE),
                                                       EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));

    // Immunity link
    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);

    effect eSearch = GetFirstEffect(oTarget);
    while (GetIsEffectValid(eSearch))
    {
        int bValid = FALSE;
        switch (GetEffectType(eSearch, TRUE))
        {
            case EFFECT_TYPE_DAZED:
            case EFFECT_TYPE_CHARMED:
            case EFFECT_TYPE_SLEEP:
            case EFFECT_TYPE_CONFUSED:
            case EFFECT_TYPE_STUNNED:
            {
                bValid = TRUE;
            }
            break;
            case EFFECT_TYPE_DOMINATED:
            {
                if (!bClarity)
                {
                    bValid = TRUE;
                }
            }
            break;
        }

        if (!bClarity)
        {
            if (GetEffectSpellId(eSearch) == SPELL_FEEBLEMIND)
            {
                bValid = TRUE;
            }
            else if (GetEffectSpellId(eSearch) == SPELL_BANE)
            {
                bValid = TRUE;
            }
        }
        if (bValid)
        {
            // Apply damage if it's clarity
            if (bClarity)
            {
                ApplyDamageToObject(oTarget, 1);
            }
            RemoveEffect(oTarget, eSearch);
        }
        eSearch = GetNextEffect(oTarget);
    }
}
