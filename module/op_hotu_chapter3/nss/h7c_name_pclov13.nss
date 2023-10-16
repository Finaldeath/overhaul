//::///////////////////////////////////////////////
//:: The Knower of Names, Player's Love = Valen (Condition Script)
//:: H7c_Name_PCLov13.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player's one true love is
     Valen.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 9, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sLove = GetLocalString(GetModule(), "sKnower_PlayersLove");
    if (sLove == "Valen")
    {
        return TRUE;
    }
    return FALSE;
}
