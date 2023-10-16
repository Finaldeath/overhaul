//::///////////////////////////////////////////////
//:: The Knower of Names, Sleeping Man's Love = Knower of Names (Condition Script)
//:: H7c_Name_SMLov15.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE the Knower of Names is the
     Sleeping Man's true love.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 9, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sLove = GetLocalString(GetModule(), "sKnower_SleepingMansLove");
    if (sLove == "Names")
    {
        return TRUE;
    }
    return FALSE;
}
