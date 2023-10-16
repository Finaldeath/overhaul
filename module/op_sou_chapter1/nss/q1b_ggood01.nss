//::///////////////////////////////////////////////
//:: Good Alignment
//:: q1b_ggood01
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Does a check to see if the PC talking to
    the character is of good alignment
    25% chance of falling through to the next line
*/
//:://////////////////////////////////////////////
//:: Created By: David Gaider
//:: Created On: November 8, 2001
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    if ((GetLocalInt(OBJECT_SELF,"counter")!=1) && (GetLocalInt(OBJECT_SELF,"counter")!=2))
    {
        if ((GetAlignmentGoodEvil(GetPCSpeaker()) == ALIGNMENT_GOOD) &&
           (d100() > 25))
        {
            return TRUE;
        }
    }
    return FALSE;
}
