//::///////////////////////////////////////////////
//:: Long Sword Check
//:: q3ai_mw_lsword
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if the player can use the long sword
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

#include "q_include"
int StartingConditional()
{
    int iResult;

    iResult = os_CheckMW(OS_MW_LONGSWORD);
    return iResult;
}
