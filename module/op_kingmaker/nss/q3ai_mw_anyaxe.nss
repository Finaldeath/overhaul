//::///////////////////////////////////////////////
//:: Any Axe Check
//:: q3ai_mw_anyaxe
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if the player can use any kind of axe
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: June 2004
//:://////////////////////////////////////////////

#include "q_include"

int StartingConditional()
{
    int iResult = FALSE;

    if ((os_CheckMW(OS_MW_GREATAXE) == TRUE)
    || (os_CheckMW(OS_MW_ONEAXE) == TRUE)
    || (os_CheckMW(OS_MW_BATTLEAXE) == TRUE))
    {
        iResult = TRUE;
    }

    return iResult;
}
