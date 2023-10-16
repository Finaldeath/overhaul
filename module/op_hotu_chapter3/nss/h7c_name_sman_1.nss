//::///////////////////////////////////////////////
//:: The Knower of Names, Sleeping Man's Not Yet Named (Condition Script)
//:: H7c_Name_SMan_1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player has not yet
     learned the Sleeping Man's True Name.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 8, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bTrueName = GetLocalInt(GetModule(), "bKnower_SleepingManNamed");
    if (bTrueName == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
