//::///////////////////////////////////////////////
//:: Burning Man (Condition - Random20)
//:: C_Burning_20ofX.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Return TRUE if it's the randomization
     variable.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 11, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iRandom = GetLocalInt(OBJECT_SELF, "iRandomConv");

    if (iRandom == 20)
    {
        return TRUE;
    }
    return FALSE;
}
