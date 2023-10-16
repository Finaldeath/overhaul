//::///////////////////////////////////////////////
//:: Default: End of Combat Round
//:: bat2_endcmbtrnd
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
    //Do nothing if not the leader
    //if (GetLocalInt(OBJECT_SELF, "nLeader") != 1)
        //return;

    //Do nothing if in retreat

    if (GetLocalInt(OBJECT_SELF, "nRetreat") == 1)
        return;

    if (GetLocalInt(OBJECT_SELF, "nAttackedTimer") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nAttackedTimer", 1);
        DelayCommand(1.0, SignalEvent(OBJECT_SELF, EventUserDefined(5000)));
        DelayCommand(6.0, SetLocalInt(OBJECT_SELF, "nAttackedTimer", 0));
    }


    DetermineCombatRound();

}










