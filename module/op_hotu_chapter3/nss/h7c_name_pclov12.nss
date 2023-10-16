//::///////////////////////////////////////////////
//:: The Knower of Names, Player's Love = Generic Female (Condition Script)
//:: H7c_Name_PCLov12.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player's one true love is
     a Generic Female.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 9, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sLove = GetLocalString(GetModule(), "sKnower_PlayersLove");
    if (sLove == "GenericFemale")
    {
        return TRUE;
    }
    return FALSE;
}
