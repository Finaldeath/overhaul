//::///////////////////////////////////////////////
//:: The Knower of Names, Player's Love Not Yet Named (Condition Script)
//:: H7c_Name_PCLove1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Knower has not yet told
     the Player that name of their one true love.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 8, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sName = GetLocalString(GetModule(), "sKnower_PlayersLove");
    if (sName == "")
    {
        return TRUE;
    }
    return FALSE;
}
