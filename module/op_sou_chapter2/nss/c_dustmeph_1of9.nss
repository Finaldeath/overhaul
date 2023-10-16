//::///////////////////////////////////////////////
//:: Dust Mephit (Condition - Random 1 of 9 - Combat)
//:: C_DustMeph_1of9.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Set the randomization and return TRUE if it
     picks the first one. This is intended for use
     as a combat string.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: May 5, 2003
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

int StartingConditional()
{
    if(GetSpawnInCondition(NW_FLAG_SPECIAL_COMBAT_CONVERSATION))
    {
        if(!GetIsObjectValid(GetPCSpeaker()))
        {
            int iRandom = Random(9)+1;
            SetLocalInt(OBJECT_SELF, "iRandomConv", iRandom);
            if (iRandom == 1)
            {
                return TRUE;
            }
        }
    }
    return FALSE;
}
