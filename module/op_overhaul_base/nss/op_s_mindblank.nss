//::///////////////////////////////////////////////
//:: Mind Blank spell range
//:: op_s_mindblank.nss
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

void MindBlank(object oTarget, int bClarity, float fDuration, float fDelay = 0.0);

void main()
{
    if (DoSpellHook()) return;

    // For single target spells just do their effects
    if (nSpellId == SPELL_CLARITY)
    {
        MindBlank(oTarget, TRUE, 5.0 + GetDuration(nCasterLevel, ROUNDS));
    }
    else if (nSpellId == SPELL_LESSER_MIND_BLANK)
    {
        MindBlank(oTarget, FALSE, GetDuration(nCasterLevel, MINUTES));
    }
    // For Mind Blank do an AOE version
    else if (nSpellId == SPELL_MIND_BLANK)
    {
        effect eImpact = EffectVisualEffect(VFX_FNF_LOS_NORMAL_20);
        ApplySpellEffectAtLocation(DURATION_TYPE_INSTANT, eImpact, lTarget);

        json jArray = GetArrayOfTargets(SPELL_TARGET_ALLALLIES, SORT_METHOD_DISTANCE, SHAPE_SPHERE, RADIUS_SIZE_HUGE, lTarget, TRUE);

        // Loop array
        int nIndex;
        for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
        {
            oTarget = GetArrayObject(jArray, nIndex);

            SignalSpellCastAt();

            float fDelay = GetDistanceBetweenLocations(lTarget, GetLocation(oTarget)) / 20;

            MindBlank(oTarget, FALSE, GetDuration(nCasterLevel, MINUTES), fDelay);
        }
    }
    else
    {
        OP_Debug("[Mind Blank Spell Script] Error: Invalid spell ID", LOG_LEVEL_ERROR);
    }
}

void MindBlank(object oTarget, int bClarity, float fDuration, float fDelay)
{
    // Same immunity for each
    effect eLink = EffectLinkEffects(EffectImmunity(IMMUNITY_TYPE_MIND_SPELLS),
                   EffectLinkEffects(EffectVisualEffect(VFX_DUR_MIND_AFFECTING_POSITIVE),
                                     EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));

    DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration));

    effect eSearch = GetFirstEffect(oTarget);
    while(GetIsEffectValid(eSearch))
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
                DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(1), oTarget));
            }
            DelayCommand(fDelay, RemoveEffect(oTarget, eSearch));
        }
        eSearch = GetNextEffect(oTarget);
    }
}
