//::///////////////////////////////////////////////
//:: Default On Attacked
//:: q2_onattacked
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If already fighting then ignore, else determine
    combat round
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 27/03
//:://////////////////////////////////////////////

#include "nw_i0_generic"
void main()
{
    //Do nothing if in retreat
    if (GetLocalInt(OBJECT_SELF, "nRetreat") == 1)
        return;

        object oTarget = GetLastAttacker();

        //if the target is dead - pick the next nearest target
        if (GetIsDead(oTarget) == TRUE || GetIsObjectValid(oTarget) == FALSE)
            oTarget = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, 1, CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);

        if (GetDistanceToObject(oTarget) > 20.0)
            return;

        ClearAllActions(TRUE);
        if (GetLocalInt(oTarget, "Q2A_OnLedge") == 1)
            ActionEquipMostDamagingRanged();
        else
            ActionEquipMostDamagingMelee();

        //Attack the target
        ActionAttack(oTarget);

}

