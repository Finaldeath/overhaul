//::///////////////////////////////////////////////
//:: Random 7 (Condition Script)
//:: H2c_Random7.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if a previously saved random
     integer equals 7
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 16, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iRandom = GetLocalInt(OBJECT_SELF, "iRandom");

    if (iRandom == 7)
    {
        return TRUE;
    }
    return FALSE;
}

