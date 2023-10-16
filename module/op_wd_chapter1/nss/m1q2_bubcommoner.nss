//::///////////////////////////////////////////////
//:: m1q2 Commoner Text Bubble
//:: m1q2_BubCommoner (NW_D2_gen_check)
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see whether the NPC has an initialized
    NPC is using SetSpecialCombatConversationStart.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Nov 30, 2001
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"

int StartingConditional()
{
    if(GetSpawnInCondition(NW_FLAG_SPECIAL_COMBAT_CONVERSATION))
    {
        if(GetIsObjectValid(GetPCSpeaker()) == FALSE)
        {
            int iSeeStairs = GetLocalInt(OBJECT_SELF, "SeeStairs");

            if(iSeeStairs == FALSE)
            {
                return TRUE;
            }
        }
    }
    return FALSE;
}


