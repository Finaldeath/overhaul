//::///////////////////////////////////////////////
//:: Morag Cutscene Part 2
//:: 2q6k_morag_02
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Start the second part of the cutscene.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 22, 2002
//:://////////////////////////////////////////////
#include "nw_i0_hostincl"

int StartingConditional()
{
    int nPlot = GetLocalInt(GetArea(OBJECT_SELF), "NW_2Q6_CUT_SCENE_START");
    if(nPlot == 10)
    {
        return TRUE;
    }
    return FALSE;
}
