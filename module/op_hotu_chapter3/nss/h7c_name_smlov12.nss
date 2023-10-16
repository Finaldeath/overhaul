//::///////////////////////////////////////////////
//:: The Knower of Names, Sleeping Man's Love = Nathyrra (Condition Script)
//:: H7c_Name_SMLov12.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Nathyrra is the Sleeping Man's
     true love.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 9, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sLove = GetLocalString(GetModule(), "sKnower_SleepingMansLove");
    if (sLove == "Nathyrra")
    {
        return TRUE;
    }
    return FALSE;
}
