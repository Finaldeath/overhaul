//::///////////////////////////////////////////////
//:: x2_partyroom
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns true if there is room in the party
    for another
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On:
//:://////////////////////////////////////////////
#include "x0_i0_henchman"

int StartingConditional()
{
    if (X2_GetNumberOfHenchmen(GetPCSpeaker()) <= 1)
    {
        return TRUE;
    }
    return FALSE;
}
