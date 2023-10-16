//::///////////////////////////////////////////////
//:: The Knower of Names, Knower of Names Already Named (Condition Script)
//:: H7c_Name_Names_3.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Knower has alread ytold
     the Player her own name.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 8, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bName = GetLocalInt(GetModule(), "bKnower_NamesNamed");
    if (bName == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
