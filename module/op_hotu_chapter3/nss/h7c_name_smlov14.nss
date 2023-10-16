//::///////////////////////////////////////////////
//:: The Knower of Names, Sleeping Man's Love = Knower of Places (Condition Script)
//:: H7c_Name_SMLov14.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Knower of Places is the
     Sleeping Man's true love.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 9, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sLove = GetLocalString(GetModule(), "sKnower_SleepingMansLove");
    if (sLove == "Places")
    {
        return TRUE;
    }
    return FALSE;
}
