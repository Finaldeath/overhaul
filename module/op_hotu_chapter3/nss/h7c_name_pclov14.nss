//::///////////////////////////////////////////////
//:: The Knower of Names, Player's Love = Sleeping Man (Condition Script)
//:: H7c_Name_PCLov14.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player's one true love is
     the Sleeping Man.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 9, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sLove = GetLocalString(GetModule(), "sKnower_PlayersLove");
    if (sLove == "SleepingMan")
    {
        return TRUE;
    }
    return FALSE;
}
