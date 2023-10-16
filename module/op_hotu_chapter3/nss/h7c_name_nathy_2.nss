//::///////////////////////////////////////////////
//:: The Knower of Names, Nathyrra Not Yet Named (Condition Script)
//:: H7c_Name_Nathy_2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Knower has not yet told
     the Player Nathyrra's name.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 8, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bName = GetLocalInt(GetModule(), "bKnower_NathyrraNamed");
    if (bName == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
