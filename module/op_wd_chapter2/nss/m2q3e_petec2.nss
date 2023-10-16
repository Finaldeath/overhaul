//::///////////////////////////////////////////////
//:: m2q3E Pete O'Deel Condition Script #2
//:: m2q3E_PeteC2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if the player has spared the
    she-wolf, Silverback. Low Int.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Feb 5, 2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iWolfState = GetLocalInt(GetModule(), "m2q3E_WolfSpared");

    if (iWolfState == TRUE)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
