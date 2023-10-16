//::///////////////////////////////////////////////
//:: Conversation Check: Vaath Surrender
//:: M3Q3A_VAATH3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check that Vaath Plot is at 2
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 15, 2001
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"

int StartingConditional()
{
    int nVaathPlot = GetLocalInt(OBJECT_SELF, "M3Q3_A2_VaathPlot");
    if(nVaathPlot == 2)
    {
        return TRUE;
    }
    return FALSE;
}
