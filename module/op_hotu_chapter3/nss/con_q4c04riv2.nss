//::///////////////////////////////////////////////
//::
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Does a check to see if the PC talking to
    the character is a fighter class
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: October 2002
//:://////////////////////////////////////////////
#include "nw_i0_plot"

int StartingConditional()
{
    {
        int nClass;
        nClass = GetLevelByClass(CLASS_TYPE_BARBARIAN, GetPCSpeaker());
        nClass += GetLevelByClass(CLASS_TYPE_FIGHTER, GetPCSpeaker());
        nClass += GetLevelByClass(CLASS_TYPE_PALADIN, GetPCSpeaker());
        nClass += GetLevelByClass(CLASS_TYPE_RANGER, GetPCSpeaker());
        return nClass;
    }
    return FALSE;
}
