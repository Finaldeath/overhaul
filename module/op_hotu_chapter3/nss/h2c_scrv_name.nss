//::///////////////////////////////////////////////
//:: Scrivener, PC Knows Name (Condition Script)
//:: H2c_Scrv_Name.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has learned the
     Scrivener's name
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 6, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bName = GetLocalInt(GetModule(), "bScrivener");
    if (bName == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
