//::///////////////////////////////////////////////
//:: Name con_q2bfairy5
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Is the ogre not defeated?
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Jan 13, 2003.
//:://////////////////////////////////////////////
#include "nw_i0_plot"
int StartingConditional()
{
    object oOgreboss = GetObjectByTag("ogrehighmage");
    if (GetIsObjectValid(oOgreboss) == TRUE)
        return TRUE;
    return FALSE;
}
