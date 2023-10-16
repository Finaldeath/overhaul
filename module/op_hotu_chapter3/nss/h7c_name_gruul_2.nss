//::///////////////////////////////////////////////
//:: The Knower of Names, Gru'ul the Quarry Boss Not Yet Named (Condition Script)
//:: H7c_Name_Gruul_2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Knower has not yet told
     the Player Gru'ul the Quarry Boss' name.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 8, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bName = GetLocalInt(GetModule(), "bKnower_GruulNamed");
    if (bName == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
