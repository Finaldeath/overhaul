//::///////////////////////////////////////////////
//:: Generic Combat Conversation Check
//:: NW_D2_gen_check
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see whether the NPC has an initialized
    NPC is using SetSpecialCombatConversationStart
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 7, 2001
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"

int StartingConditional()
{
    if(GetSpawnInCondition(NW_FLAG_SPECIAL_COMBAT_CONVERSATION))
    {
        int iResult = GetLocalInt(OBJECT_SELF, "Generic_Surrender");
        if(iResult == 0 && !GetIsObjectValid(GetPCSpeaker()))
        {
            return TRUE;
        }
    }
    return FALSE;
}
