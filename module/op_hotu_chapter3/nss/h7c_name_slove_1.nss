//::///////////////////////////////////////////////
//:: The Knower of Names, Sleeping Man's Love Not Yet Named (Condition Script)
//:: H7c_Name_SLove_1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player has not yet
     learned the True Name of Sleeping Man's
     one true love.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 8, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sTrueName = GetLocalString(GetModule(), "sKnower_SleepingMansLove");
    if (sTrueName == "")
    {
        return TRUE;
    }
    return FALSE;
}

