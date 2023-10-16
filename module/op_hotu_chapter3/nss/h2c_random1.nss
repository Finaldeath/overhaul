//::///////////////////////////////////////////////
//:: Random 1 (Condition Script)
//:: H2c_Random1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if a previously saved random
     integer equals 1
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 21, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iRandom = GetLocalInt(OBJECT_SELF, "iRandom");

    if (iRandom == 1)
    {
        return TRUE;
    }
    return FALSE;
}
