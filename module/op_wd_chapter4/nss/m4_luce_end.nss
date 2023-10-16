//::///////////////////////////////////////////////
//:: M4_LUCE_END
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets her back to walking if the plot has not yet
    been resolved
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    March 12, 2002
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"

void main()
{
    if(GetLocalInt(GetModule(),"NW_G_M4Q01PLOTLEESA_RESCUE") !=1)
    {
        WalkWayPoints();
    }
}
