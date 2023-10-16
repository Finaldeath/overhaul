//::///////////////////////////////////////////////
//:: Checks Assassin Note
//:: q2c25_env_hsnote
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if the player has the assassin note
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

#include "os_include"
int StartingConditional()
{
    int iArrest = GetLocalInt(GetModule(), "BECKET_ARRESTED");
    int iResult;

    if (iArrest == FALSE)
    {
        iResult = os_CheckItem("os_itm_noteassas");
    }

    return iResult;
}
