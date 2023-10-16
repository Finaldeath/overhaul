//::///////////////////////////////////////////////
//:: The Knower of Names, Sleeping Man's Love = Nathyrra (Condition Script)
//:: H7c_Name_SMLove5.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Knower has told the
     Player that Nathyrra is the Sleeping Man's
     one true love.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 8, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sName = GetLocalString(GetModule(), "sKnower_SleepingMansLove");
    if (sName == "Nathyrra")
    {
        return TRUE;
    }
    return FALSE;
}
