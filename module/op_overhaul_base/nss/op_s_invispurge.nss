//::///////////////////////////////////////////////
//:: Invisibility Purge
//:: op_s_invispurge
//:://////////////////////////////////////////////
/*
    This spell removes the invisibility (and related concealment from Improved
    Invisibility) from all invisible creatures and items which enter an area
    around you.

    Note: Will run removal on heartbeat as well, removes as per original Bioware
    anyones invisibility not just enemies or anything.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

// Returns TRUE if an invisibility effect (or spell) was removed
int RemoveInvisibityEffects(object oTarget);

void main()
{
    if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_ENTER)
    {
        if (!AOECheck()) return;

        if (RemoveInvisibityEffects(oTarget))
        {
            if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
            {
                SignalSpellCastAt(oTarget, oCaster, TRUE);
            }
            else
            {
                SignalSpellCastAt(oTarget, oCaster, FALSE);
            }
        }
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_EXIT)
    {
        // Nothing to remove
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_HEARTBEAT)
    {
        if (!AOECheck()) return;

        json jArray = GetArrayOfAOETargets(SPELL_TARGET_ANYTHING);
        int nIndex;
        for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
        {
            oTarget = GetArrayObject(jArray, nIndex);

            if (RemoveInvisibityEffects(oTarget))
            {
                if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
                {
                    SignalSpellCastAt(oTarget, oCaster, TRUE);
                }
                else
                {
                    SignalSpellCastAt(oTarget, oCaster, FALSE);
                }
            }
        }
    }
    else
    {
        if (DoSpellHook()) return;

        effect eLink = EffectLinkEffects(EffectAreaOfEffect(AOE_MOB_INVISIBILITY_PURGE, GetScriptName(), GetScriptName(), GetScriptName()),
                       EffectLinkEffects(EffectVisualEffect(VFX_DUR_MAGICAL_SIGHT),
                                         EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));

        ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(nCasterLevel, MINUTES));
    }
}

// Returns TRUE if an invisibility effect (or spell) was removed
int RemoveInvisibityEffects(object oTarget)
{
    int bRemovedSomething = FALSE;
    effect eCheck = GetFirstEffect(oTarget);
    while (GetIsEffectValid(eCheck))
    {
        if (GetEffectType(eCheck, TRUE))
        {
            bRemovedSomething = TRUE;
            RemoveEffect(oTarget, eCheck);
        }
        else
        {
            // Some spells apply things like concealment (Improved Invisibility)
            switch (GetEffectSpellId(eCheck))
            {
                case SPELL_INVISIBILITY:
                case SPELL_IMPROVED_INVISIBILITY:
                {
                    bRemovedSomething = TRUE;
                    RemoveEffect(oTarget, eCheck);
                }
                break;
            }
        }
        eCheck = GetNextEffect(oTarget);
    }
    if (bRemovedSomething) SendMessageToPCByStrRef(oTarget, STRREF_INVISIBILITY_PURGED); // *Invisibility purged*
    return bRemovedSomething;
}
