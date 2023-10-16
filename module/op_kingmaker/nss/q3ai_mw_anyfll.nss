//::///////////////////////////////////////////////
//:: Any Flail Check
//:: q3ai_mw_anyfll
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if the player can use any kind of flail
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: June 2004
//:://////////////////////////////////////////////

#include "q_include"

int StartingConditional()
{
    int iResult = FALSE;

    if ((os_CheckMW(OS_MW_HEAVYFLAIL) == TRUE)
    || (os_CheckMW(OS_MW_LIGHTFLAIL) == TRUE))
    {
        iResult = TRUE;
    }

    return iResult;
}
