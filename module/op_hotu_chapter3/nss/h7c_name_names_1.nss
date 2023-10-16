//::///////////////////////////////////////////////
//:: The Knower of Names Not Yet Named (Condition Script)
//:: H7c_Name_Names_1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player has not yet
     learned the True Name of the Knower of Names.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 8, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bTrueName = GetLocalInt(GetModule(), "bKnower_NamesNamed");
    if (bTrueName == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}

