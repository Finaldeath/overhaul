//::///////////////////////////////////////////////
//:: Quarry Plot, Random 2, Holiday Declared (Condition Script)
//:: H2c_Rand2_Holi.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if a previously saved random
     integer equals 2 and the Quarry Boss has
     declared a holiday.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 21, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iRandom = GetLocalInt(OBJECT_SELF, "iRandom");
    int bHoliday = GetLocalInt(GetModule(), "bQuarryHoliday");

    if (/*iRandom == 2 &&*/
        bHoliday == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
