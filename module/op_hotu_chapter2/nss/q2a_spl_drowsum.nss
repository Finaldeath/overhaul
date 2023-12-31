//::///////////////////////////////////////////////
//:: Default On Attacked
//:: q2a_spl_drowsum
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
    //Do nothing if not the leader
    //if (GetLocalInt(OBJECT_SELF, "nLeader") != 1)
    //    return;
    //if we are already in combat - the end of combat script should fire - so do nothing
    if (GetIsInCombat() == TRUE)
        return;

    //Do nothing if in retreat
    if (GetLocalInt(OBJECT_SELF, "nRetreat") == 1)
        return;


        object oTarget = GetLastSpellCaster();



        //if the target is dead - pick the next nearest target
        if (GetIsDead(oTarget) == TRUE)
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

