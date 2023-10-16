//::///////////////////////////////////////////////
//:: M2Q2CC_PLTRING
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the player has found the ring.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: January 24, 2002
//:://////////////////////////////////////////////

#include "M2Q2Include"

int StartingConditional()
{
    if (PlayerHasRing(GetPCSpeaker()) == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
