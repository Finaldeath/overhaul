//::///////////////////////////////////////////////
//:: Gru'ul the Quarry Boss, Quest Incomplete (Condition Script)
//:: H2c_Gruul_Incomp.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Quarry Grinder 5 is inactive
     and no holiday's been declared.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 21, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bHolidays = GetLocalInt(GetModule(), "bQuarryHoliday");
    object oGrinder5 = GetObjectByTag("QuarryGrinder5");
    int bQuestComplete = GetLocalInt(oGrinder5, "bQuestComplete");

    if (bHolidays == FALSE &&
        bQuestComplete == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
