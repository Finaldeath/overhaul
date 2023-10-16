//::///////////////////////////////////////////////
//:: Entered
//:: M2MoveHostTower
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script moves the PCs to the Chapter2 end
    module.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: March 6, 2002
//:://////////////////////////////////////////////
#include "nw_i0_henchman"

void RestoreEveryone();

void main()
{
    object oClicked = GetClickingObject();

    if (GetIsPC(oClicked))
    {
        StripAllPersonalItemsFromEveryone();
        RestoreEveryone();
        DelayCommand(0.5,StartNewModule("Chapter2E"));
    }
}

void RestoreEveryone()
{
    object oTarget = GetFirstPC();
    while(GetIsObjectValid(oTarget))
    {
        effect eBad = GetFirstEffect(oTarget);
        //Search for negative effects
        while(GetIsEffectValid(eBad))
        {
            if (GetEffectType(eBad) == EFFECT_TYPE_ABILITY_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_AC_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_ATTACK_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SAVING_THROW_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SPELL_RESISTANCE_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SKILL_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_BLINDNESS ||
                GetEffectType(eBad) == EFFECT_TYPE_DEAF ||
                GetEffectType(eBad) == EFFECT_TYPE_CURSE ||
                GetEffectType(eBad) == EFFECT_TYPE_DISEASE ||
                GetEffectType(eBad) == EFFECT_TYPE_POISON ||
                GetEffectType(eBad) == EFFECT_TYPE_PARALYZE ||
                GetEffectType(eBad) == EFFECT_TYPE_NEGATIVELEVEL)
            {
                //Remove effect if it is negative.
                RemoveEffect(oTarget, eBad);
            }
            eBad = GetNextEffect(oTarget);
        }
        int nHeal = GetMaxHitPoints(oTarget) - GetCurrentHitPoints(oTarget);
        if(nHeal > 0)
        {
            effect eHeal = EffectHeal(nHeal);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oTarget);
        }
        oTarget = GetNextPC();
    }
}
