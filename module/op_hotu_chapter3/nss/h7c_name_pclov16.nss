//::///////////////////////////////////////////////
//:: The Knower of Names, Player's Love = No True Love (Condition Script)
//:: H7c_Name_PCLov16.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if it has been decided that the
     Player has no true love.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 9, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sLove = GetLocalString(GetModule(), "sKnower_PlayersLove");
    if (sLove == "NoTrueLove")
    {
        return TRUE;
    }
    return FALSE;
}
