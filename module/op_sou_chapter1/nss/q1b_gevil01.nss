//::///////////////////////////////////////////////
//:: Evil Alignment
//:: q1b_gevil01
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Does a check to see if the PC talking to
    the character is of evil alignment
    25% chance of falling through to the next line
*/
//:://////////////////////////////////////////////
//:: Created By: David Gaider
//:: Created On: February 14, 2003
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    if ((GetLocalInt(OBJECT_SELF,"counter")!=1) && (GetLocalInt(OBJECT_SELF,"counter")!=2))
    {
        if ((GetAlignmentGoodEvil(GetPCSpeaker()) == ALIGNMENT_EVIL) &&
           (d100() > 25))
        {
            return TRUE;
        }
    }
    return FALSE;
}
