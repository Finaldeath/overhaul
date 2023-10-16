//::///////////////////////////////////////////////
//:: Racial Types Same, but not human
//:: Intelligence Normal
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks: Are the PC and NPC Racial Types the
            same BUT not human
            AND
            Is Intelligence Normal
*/
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"
int StartingConditional()
{
    if(GetRacialType(GetPCSpeaker()) != RACIAL_TYPE_HUMAN)
    {
        if(GetRacialType(GetPCSpeaker()) == GetRacialType(OBJECT_SELF))
        {
            if(CheckIntelligenceNormal())
            {
                return TRUE;
            }
        }
    }
    return FALSE;
}

