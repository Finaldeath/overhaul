//::///////////////////////////////////////////////
//:: Zombie Custom User Defined Event
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    User defined for zombies.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 27, 2002
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        WalkWayPoints();
        SetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT, FALSE);
    }
}

