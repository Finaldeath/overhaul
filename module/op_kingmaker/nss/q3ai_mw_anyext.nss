//::///////////////////////////////////////////////
//:: Any exotic weapon Check
//:: q3ai_mw_anyext
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if the player can use any kind of exotic
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: June 2004
//:://////////////////////////////////////////////

#include "q_include"

int StartingConditional()
{
    int iResult = FALSE;

    if ((os_CheckMW(OS_MW_KAMA) == TRUE)
    || (os_CheckMW(OS_MW_KUKRI) == TRUE)
    || (os_CheckMW(OS_MW_SICKLE) == TRUE))
    {
        iResult = TRUE;
    }

    return iResult;
}
