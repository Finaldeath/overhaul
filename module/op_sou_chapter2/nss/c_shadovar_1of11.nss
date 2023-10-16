//::///////////////////////////////////////////////
//:: Shadovar (Condition - Random 1 of 11 - Combat)
//:: C_Shadovar_1of11.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Set the randomization and return TRUE if it
     picks the first one. This is intended for use
     as a combat string.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 9, 2003
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

int StartingConditional()
{
    if(GetSpawnInCondition(NW_FLAG_SPECIAL_COMBAT_CONVERSATION))
    {
        if(!GetIsObjectValid(GetPCSpeaker()))
        {
            int iRandom = Random(11)+1;
            SetLocalInt(OBJECT_SELF, "iRandomConv", iRandom);
            if (iRandom == 1)
            {
                return TRUE;
            }
        }
    }
    return FALSE;
}
