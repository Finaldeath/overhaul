//::///////////////////////////////////////////////
//:: Default: End of Combat Round
//:: q2a_cmbt_rebmark
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Calls the end of combat script every round
    //if the gates have been destroyed - pick
    a target for the squad
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 16, 2001
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"
#include "q2_inc_battle"
void main()
{
    object oTarget = GetLastHostileActor();
    //if the target is dead - pick the next nearest target
    if (GetIsDead(oTarget) == TRUE)
        oTarget = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, 1, CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);

    ClearAllActions(TRUE);

    //if (GetLocalInt(oTarget, "Q2A_OnLedge") == 1)
    //    ActionEquipMostDamagingRanged();
    //else
    //    ActionEquipMostDamagingMelee();

    //Attack the target
    ActionAttack(oTarget);


}




