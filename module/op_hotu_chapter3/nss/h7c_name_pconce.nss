//::///////////////////////////////////////////////
//:: The Knower of Names, PC's Name Do Once (Condition Script)
//:: H7c_Name_PCOnce.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the has not asked for his
     name before.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 28, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bDoOnce = GetLocalInt(GetModule(), "bKnower_PlayerHasAskedHisNameOnce");
    if (bDoOnce == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
