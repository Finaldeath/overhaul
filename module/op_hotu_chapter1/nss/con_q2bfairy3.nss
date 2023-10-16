//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Is the ogre defeated?
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Jan 13, 2003.
//:://////////////////////////////////////////////
#include "nw_i0_plot"
int StartingConditional()
{
    object oOgreboss = (GetObjectByTag("ogrehighmage"));
    if ((GetIsObjectValid(oOgreboss)) && CheckIntelligenceNormal())
        return TRUE;
    return FALSE;
}
