//::///////////////////////////////////////////////
//:: The Knower of Names, Player's Love = Sleeping Man (Condition Script)
//:: H7c_Name_PCLove6.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Knower has told the
     Player that the Sleeping Man is their one
     true love.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 8, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sName = GetLocalString(GetModule(), "sKnower_PlayersLove");
    if (sName == "SleepingMan")
    {
        return TRUE;
    }
    return FALSE;
}
