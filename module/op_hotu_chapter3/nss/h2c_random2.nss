//::///////////////////////////////////////////////
//:: Random 2 (Condition Script)
//:: H2c_Random2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if a previously saved random
     integer equals 2
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 6, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iRandom = GetLocalInt(OBJECT_SELF, "iRandom");

    if (iRandom == 2)
    {
        return TRUE;
    }
    return FALSE;
}
