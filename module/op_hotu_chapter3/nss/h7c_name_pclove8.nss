//::///////////////////////////////////////////////
//:: The Knower of Names, Player's Love = No True Love (Condition Script)
//:: H7c_Name_PCLove8.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Knower has told the
     Player that they shall have no true love.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 8, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sName = GetLocalString(GetModule(), "sKnower_PlayersLove");
    if (sName == "NoTrueLove")
    {
        return TRUE;
    }
    return FALSE;
}
