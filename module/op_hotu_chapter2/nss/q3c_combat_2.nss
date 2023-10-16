//::///////////////////////////////////////////////
//:: Q3 (Ch2 Dracolich Suplot)
//:: Combat One-Liners, Random 2 (Condition Script)
//:: Q3c_Combat_2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if in combat and Randomizer is
    set to 2.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 26, 2003
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"

int StartingConditional()
{
    int nRandom = GetLocalInt(OBJECT_SELF, "nRandom");
    if(nRandom == 2)
    {
        if(GetSpawnInCondition(NW_FLAG_SPECIAL_COMBAT_CONVERSATION))
        {
            if(!GetIsObjectValid(GetPCSpeaker()))
            {
                return TRUE;
            }
        }
    }
    return FALSE;
}

