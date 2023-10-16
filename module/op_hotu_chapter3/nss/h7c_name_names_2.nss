//::///////////////////////////////////////////////
//:: The Knower of Names, Knower of Names Not Yet Named (Condition Script)
//:: H7c_Name_Names_2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Knower has not yet told
     the Player her own name.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 8, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bName = GetLocalInt(GetModule(), "bKnower_NamesNamed");
    if (bName == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
