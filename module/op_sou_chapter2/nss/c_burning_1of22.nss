//::///////////////////////////////////////////////
//:: Burning Man (Condition - Random 1 of 22)
//:: C_Burning_1of22.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Set the randomization and return TRUE if it
     picks the first one.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 11, 2003
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

int StartingConditional()
{
    int iRandom = Random(22)+1;
    SetLocalInt(OBJECT_SELF, "iRandomConv", iRandom);
    if (iRandom == 1)
    {
        return TRUE;
    }
    return FALSE;
}
