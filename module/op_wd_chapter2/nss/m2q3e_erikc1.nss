//::///////////////////////////////////////////////
//:: m2q3E Erik Condition Script #1
//:: m2q3E_ErikC1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if player is Male and of normal
    intelligence.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Feb 13, 2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    int nGender = GetGender(GetPCSpeaker());

    if (nGender == GENDER_MALE)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
