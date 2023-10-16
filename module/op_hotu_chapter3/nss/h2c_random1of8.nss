//::///////////////////////////////////////////////
//:: Random 1 of 8 (Condition Script)
//:: H2c_Random1of8.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Saves out a random number between 1 and 8.
     Returns TRUE if it equals 1.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 16, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iRandom = Random(8)+1;
    SetLocalInt(OBJECT_SELF, "iRandom", iRandom);

    if (iRandom == 1)
    {
        return TRUE;
    }
    return FALSE;
}
