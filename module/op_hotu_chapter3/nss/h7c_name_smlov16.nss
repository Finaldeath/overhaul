//::///////////////////////////////////////////////
//:: The Knower of Names, Sleeping Man's Love = Lavoera (Condition Script)
//:: H7c_Name_SMLov16.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Lavoera is the Sleeping Man's
     true love.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 9, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sLove = GetLocalString(GetModule(), "sKnower_SleepingMansLove");
    if (sLove == "Lavoera")
    {
        return TRUE;
    }
    return FALSE;
}
