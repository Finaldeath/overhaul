//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: q3_ud_calibast
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Surrendering Calibast's user defined events
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////
#include "q_include"
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {

    }
    else if(nUser == 1002) // PERCEIVE
    {

    }
    else if(nUser == 1003) // END OF COMBAT
    {

    }
    else if(nUser == 1004) // ON DIALOGUE
    {

    }
    else if(nUser == 1005) // ATTACKED
    {

    }
    else if(nUser == 1006) // DAMAGED
    {
        int nCurr = GetCurrentHitPoints();
        int nSurrender = GetLocalInt(OBJECT_SELF,"OS_SURRENDER");

        if((nCurr == 1) && (nSurrender == 0))
        {
            q3_HenchmenSurrender();
            object oDoor = GetObjectByTag("q3_door_illithid");
            AssignCommand(oDoor, SetLocked(OBJECT_SELF, FALSE));
        }
    }
    else if(nUser == 1007) // DEATH
    {

    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

