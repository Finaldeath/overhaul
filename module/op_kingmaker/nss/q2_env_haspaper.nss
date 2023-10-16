//::///////////////////////////////////////////////
//:: Checks Assassin Paper
//:: q2_env_haspaper
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if the player has the assassin paper
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Jan 2004
//:://////////////////////////////////////////////

#include "os_include"
int StartingConditional()
{
    int iResult;
    iResult = os_CheckItem("os_itm_notepaper");
    return iResult;
}
