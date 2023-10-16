//::///////////////////////////////////////////////
//:: Default: End of Combat Round
//:: q2a_cmbt_drowsum
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Test Combat Round End
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 16, 2001
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"

void main()
{
    //Do nothing if in retreat

    if (GetLocalInt(OBJECT_SELF, "nRetreat") == 1)
        return;

    object oTarget = GetLastHostileActor();
    //if the target is dead - pick the next nearest target
    if (GetIsDead(oTarget) == TRUE || GetIsObjectValid(oTarget) == FALSE)
        oTarget = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, 1, CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);

    int nCount = 1;
    //ignore the ledge people
    while (GetLocalInt(oTarget, "Q2A_OnLedge") == 1)
    {
        nCount++;
        oTarget = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, nCount, CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);
    }
    if (GetIsObjectValid(oTarget) == FALSE)
        return;

    if (GetDistanceToObject(oTarget) > 20.0)
            return;



    //Attack the target
    ActionAttack(oTarget);

}










