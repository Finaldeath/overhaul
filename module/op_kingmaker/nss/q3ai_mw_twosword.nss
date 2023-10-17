//::///////////////////////////////////////////////
//:: Two-bladed sword Check
//:: q3ai_mw_twosword
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if the player can use the two-bladed sword
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

#include "q_include"
int StartingConditional()
{
    int iResult;

    iResult = os_CheckMW(OS_MW_TWOBLADEDSWORD);
    return iResult;
}