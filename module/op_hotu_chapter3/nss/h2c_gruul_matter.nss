//::///////////////////////////////////////////////
//:: Gru'ul the Quarry Boss, PC Knows What's the Matter (Condition Script)
//:: H2c_Gruul_Matter.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if player has talked to Lazy the
     Imp but Grinder 5 remains inactive.
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

    if (bLazy == TRUE &&
        bQuestComplete == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
