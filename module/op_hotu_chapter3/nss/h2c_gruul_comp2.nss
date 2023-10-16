//::///////////////////////////////////////////////
//:: Gru'ul the Quarry Boss, 2nd Time Talked To Since Quest Complete (Condition Script)
//:: H2c_Gruul_Comp2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Quarry Grinder 5 is active
     or holiday's been declared (2nd time talked to).
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
    int bTalked = GetLocalInt(OBJECT_SELF, "bTalked");

    if ((bHolidays == TRUE ||
         bQuestComplete == TRUE) &&
         bTalked == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}


