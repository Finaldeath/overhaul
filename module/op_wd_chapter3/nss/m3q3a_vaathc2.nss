//::///////////////////////////////////////////////
//:: Conversation Check: Vaath Surrender
//:: M3Q3A_VAATH2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check that Vaath Plot is at 1
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 15, 2001
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"

int StartingConditional()
{
    int nVaathPlot = GetLocalInt(OBJECT_SELF, "M3Q3_A2_VaathPlot");
    if(GetSpawnInCondition(NW_FLAG_SPECIAL_CONVERSATION))
    {
        if(!GetIsObjectValid(GetPCSpeaker()))
        {
            if(nVaathPlot == 1)
            {
                return TRUE;
            }
        }
    }
    return FALSE;
}


