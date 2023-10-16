//::///////////////////////////////////////////////
//:: Generic Devils, Holiday Declared (Condition Script)
//:: H2c_Devil_Holidae.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Gru'ul has declared a
     holiday.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 4, 2003
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
