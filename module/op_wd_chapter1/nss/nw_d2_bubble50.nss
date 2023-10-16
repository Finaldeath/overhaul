//::///////////////////////////////////////////////
//:: Combat Text Bubble (50%)
//:: NW_D2_Bubble50
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see whether the NPC has an initialized
    NPC is using SetSpecialCombatConversationStart.
    Fires only 50% of the time.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 10, 2002
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"

int StartingConditional()
{
    if(GetSpawnInCondition(NW_FLAG_SPECIAL_COMBAT_CONVERSATION))
    {
        if(!GetIsObjectValid(GetPCSpeaker()))
        {
            int iPercent = Random(99);

            if(iPercent < 50)
            {
                return TRUE;
            }
        }
    }
    return FALSE;
}


