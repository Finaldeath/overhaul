//::///////////////////////////////////////////////
//:: Default: End of Combat Round
//:: q2a_cmbt_rebswd
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
    //object oGate = GetObjectByTag("q2acitygate");
    //if (GetIsObjectValid(oGate) == TRUE)
    //{

    //    return;
    //}
    //else
    //{
        ClearAllActions();
        DetermineCombatRound();
        DelayCommand(6.0, SignalEvent(OBJECT_SELF, EventUserDefined(UNIT_ORDER_PATROL_CURRENT_LOCATION)));

    //}

}




