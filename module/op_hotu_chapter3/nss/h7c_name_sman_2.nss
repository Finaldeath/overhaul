//::///////////////////////////////////////////////
//:: The Knower of Names, Sleeping Man Not Yet Named (Condition Script)
//:: H7c_Name_SMan_2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Knower has not yet told
     the Player the Sleeping Man's name.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 8, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bName = GetLocalInt(GetModule(), "bKnower_SleepingManNamed");
    if (bName == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
