//::///////////////////////////////////////////////
//:: M2Q2CC_PLTSCROLL
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the player has found a scroll with Creator language on it.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: January 24, 2002
//:://////////////////////////////////////////////

#include "M2Q2Include"

int StartingConditional()
{
    if (PlayerHasScroll(GetPCSpeaker()) == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
