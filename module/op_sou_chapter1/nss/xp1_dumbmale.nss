//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Checks if pc is male and normal or better intelligence
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 10, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
int StartingConditional()
{
    int iGender = GetGender(GetPCSpeaker());
    if (iGender == GENDER_MALE && CheckIntelligenceLow())
    {
        return TRUE;
    }
    return FALSE;
}
