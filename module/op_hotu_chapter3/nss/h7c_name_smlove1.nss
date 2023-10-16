//::///////////////////////////////////////////////
//:: The Knower of Names, Sleeping Man's Love Not Yet Named (Condition Script)
//:: H7c_Name_SMLove1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Knower has not yet told
     the Player the name of the Sleeping Man's one
     true love.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 8, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sName = GetLocalString(GetModule(), "sKnower_SleepingMansLove");
    if (sName == "")
    {
        return TRUE;
    }
    return FALSE;
}
