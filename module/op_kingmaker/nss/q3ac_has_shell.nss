//::///////////////////////////////////////////////
//:: Player has shell Key
//:: q3ac_has_shell
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns true if the player has the shell key
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

#include "os_include"
int StartingConditional()
{
    int iResult;
    iResult = os_CheckItem("q3ac_key_shell");
    return iResult;
}
