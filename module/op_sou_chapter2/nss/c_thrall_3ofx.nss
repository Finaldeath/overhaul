//::///////////////////////////////////////////////
//:: Asabi Thrall (Condition - Random 3)
//:: C_Thrall_3ofX.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Return TRUE if it's the randomization
     variable.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 31, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iRandom = GetLocalInt(OBJECT_SELF, "iRandomConv");

    if (iRandom == 3)
    {
        return TRUE;
    }
    return FALSE;
}
