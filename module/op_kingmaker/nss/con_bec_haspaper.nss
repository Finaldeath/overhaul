//::///////////////////////////////////////////////
//:: Checks Assassin Paper
//:: con_bec_haspaper
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if the player has the assassin paper
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

#include "os_include"
int StartingConditional()
{
    int iResult;
    iResult = os_CheckItem("os_itm_notepaper");
    return iResult;
}
