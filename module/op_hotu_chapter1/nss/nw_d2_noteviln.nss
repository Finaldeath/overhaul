//::///////////////////////////////////////////////
//:: Check Neutral or Good, Normal Int
//:: NW_D2_NOTEVIL
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Does a check to see if the PC talking to
    the character is of good or neutral alignment
*/
//:://////////////////////////////////////////////
//:: Created By: David Gaider
//:: Created On: November 14, 2001
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    if (CheckIntelligenceNormal())
    {
        if (GetAlignmentGoodEvil(GetPCSpeaker()) != ALIGNMENT_EVIL)
        {
            return TRUE;
        }
    }
    return FALSE;
}
