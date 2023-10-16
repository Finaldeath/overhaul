//::///////////////////////////////////////////////
//:: Gru'ul the Quarry Boss, PC Doesn't Know What's the Matter (Condition Script)
//:: H2c_Gruul_NoMatt.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if player hasn't talked to Lazy
     the Imp or Grinder 5 is active.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 21, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bLazy = GetLocalInt(GetModule(), "bLazyTalked");
    object oGrinder5 = GetObjectByTag("QuarryGrinder5");
    int bQuestComplete = GetLocalInt(oGrinder5, "bQuestComplete");

    if (bLazy == FALSE ||
        bQuestComplete == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
