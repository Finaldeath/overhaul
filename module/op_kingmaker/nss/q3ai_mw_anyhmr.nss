//::///////////////////////////////////////////////
//:: Any hammer Check
//:: q3ai_mw_anyhmr
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if the player can use any kind of hammer
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: June 2004
//:://////////////////////////////////////////////

#include "q_include"

int StartingConditional()
{
    int iResult = FALSE;

    if ((os_CheckMW(OS_MW_LIGHTHAMMER) == TRUE)
    || (os_CheckMW(OS_MW_WARHAMMER) == TRUE))
    {
        iResult = TRUE;
    }

    return iResult;
}
