//::///////////////////////////////////////////////
//:: Checks Assassin Paper
//:: q2c25_env_hspapr
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
    iResult = os_CheckItem("os_itm_notepaper")
        && GetLocalInt(OBJECT_SELF,"OS_ENIVID_ASSASSIN")==10;
    return iResult;
}
