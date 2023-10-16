//::///////////////////////////////////////////////
//:: The Knower of Names, Player's Love = Generic Female (Condition Script)
//:: H7c_Name_PCLove4.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Knower has told the
     Player that a generic female is their one
     true love.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 8, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sName = GetLocalString(GetModule(), "sKnower_PlayersLove");
    if (sName == "GenericFemale")
    {
        return TRUE;
    }
    return FALSE;
}
