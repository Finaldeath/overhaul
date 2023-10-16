//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag, Male Condition (Low Int)
//:: WW1_Hag_Male_L.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player is male (Low Int
     Variant)
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 16, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iGender = GetGender(oPC);

    if (iGender = GENDER_MALE)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
