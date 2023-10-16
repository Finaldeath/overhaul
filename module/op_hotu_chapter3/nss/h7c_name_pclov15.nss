//::///////////////////////////////////////////////
//:: The Knower of Names, Player's Love = Generic Male (Condition Script)
//:: H7c_Name_PCLov15.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player's one true love is
     a Generic Male.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 9, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sLove = GetLocalString(GetModule(), "sKnower_PlayersLove");
    if (sLove == "GenericMale")
    {
        return TRUE;
    }
    return FALSE;
}
