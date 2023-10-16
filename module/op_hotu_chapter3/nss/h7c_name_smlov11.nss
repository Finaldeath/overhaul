//::///////////////////////////////////////////////
//:: The Knower of Names, Sleeping Man's Love = Aribeth (Condition Script)
//:: H7c_Name_SMLov11.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE Aribeth is the Sleeping Man's
     true love.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 9, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sLove = GetLocalString(GetModule(), "sKnower_SleepingMansLove");
    if (sLove == "Aribeth")
    {
        return TRUE;
    }
    return FALSE;
}
