//::///////////////////////////////////////////////
//:: Asabi Thrall (Condition - Random 1 of 7)
//:: C_Thrall_1of7.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Set the randomization and return TRUE if it
     picks the first one.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 31, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iRandom = Random(7)+1;
    SetLocalInt(OBJECT_SELF, "iRandomConv", iRandom);

    if (iRandom == 1)
    {
        return TRUE;
    }
    return FALSE;
}
