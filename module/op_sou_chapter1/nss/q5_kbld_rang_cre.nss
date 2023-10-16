//::///////////////////////////////////////////////
//:: Default: End of Combat Round
//:: NW_C2_DEFAULT3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Calls the end of combat script every round
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 16, 2001
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"
void main()
{
    if(GetBehaviorState(NW_FLAG_BEHAVIOR_SPECIAL))
    {
        DetermineSpecialBehavior();
    }
    else if(!GetSpawnInCondition(NW_FLAG_SET_WARNINGS))
    {
       // first, check whether the player has arrived yet to the blow-barrels area
       int nAllow = GetLocalInt(GetArea(OBJECT_SELF), "Q5A_CAN_BLOW_BARRELS");
       object oBarrel = GetNearestObjectByTag("Q5_GREASE_BARREL");
       if(nAllow == 1 && oBarrel != OBJECT_INVALID && GetDistanceBetween(OBJECT_SELF, oBarrel) <= 20.0)
            DetermineCombatRound(oBarrel);
       else
            DetermineCombatRound();
    }
    if(GetSpawnInCondition(NW_FLAG_END_COMBAT_ROUND_EVENT))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(1003));
    }
}




