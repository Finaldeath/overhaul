//::///////////////////////////////////////////////
//:: The Knower of Names, Sleeping Man's Love = Names (Condition Script)
//:: H7c_Name_SMLove7.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Knower has told the
     Player that she is the Sleeping Man's one
     true love.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 8, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sName = GetLocalString(GetModule(), "sKnower_SleepingMansLove");
    if (sName == "Names")
    {
        return TRUE;
    }
    return FALSE;
}
