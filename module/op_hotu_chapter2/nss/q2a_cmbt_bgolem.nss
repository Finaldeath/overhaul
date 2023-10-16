//::///////////////////////////////////////////////
//:: Default: End of Combat Round
//:: q2a_cmbt_bgolem
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

    DelayCommand(3.0, SignalEvent(OBJECT_SELF, EventUserDefined(500)));

}










