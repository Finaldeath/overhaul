//::///////////////////////////////////////////////
//:: Lazy the Imp, Holiday Declared (Condition Script)
//:: H2c_Lazy_Holiday.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Quarry Boss has declared
     a holiday.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 21, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bHoliday = GetLocalInt(GetModule(), "bQuarryHoliday");

    if (bHoliday == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}

