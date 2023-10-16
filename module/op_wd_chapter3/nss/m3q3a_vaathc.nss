//::///////////////////////////////////////////////
//:: Generic Conversation Check: VAATH
//:: NW_D2_gen_check
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see whether the NPC has an initialized
    NPC is using SetSpecialConversationStart, and
    that the Plot for Vaath is at 0
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 7, 2001
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"

int StartingConditional()
{
    int nVaathPlot = GetLocalInt(OBJECT_SELF, "M3Q3_A2_Surrender");
    if(GetSpawnInCondition(NW_FLAG_SPECIAL_CONVERSATION))
    {
        if(!GetIsObjectValid(GetPCSpeaker()))
        {
            if(nVaathPlot == 0)
            {
                return TRUE;
            }
        }
    }
    return FALSE;
}

